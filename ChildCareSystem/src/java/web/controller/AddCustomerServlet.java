/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblCustomer.CustomerError;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblIdentity.IdentityDTO;
import web.models.tblIdentity.IdentityError;
import web.utils.RegisterValidation;

/**
 *
 * @author Admin
 */
public class AddCustomerServlet extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "home.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String phoneNum = request.getParameter("phoneNum");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            String birthday = request.getParameter("birthday");
            String citizenID = request.getParameter("citizenID");
            String roleID = request.getParameter("roleID");
            HttpSession session = request.getSession();
            CustomerDAO dao = new CustomerDAO();
            RegisterValidation errors = new RegisterValidation();
            CustomerError error = new CustomerError();
            IdentityError error1 = new IdentityError();
            boolean check = dao.checkPassword(password, cpassword);
            boolean check2 = dao.checkEmail(email);
            boolean foundError = false;
            if (phoneNum.trim().length() != 10) {
                foundError = true;
                errors.setPhoneNumberError("Số điện thoại phải gồm 10 chữ số!");
                request.setAttribute("FOUND_ERROR", true);
            }
            /*if (!password.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})"))*/ if(!password.matches("(?!.*[!@#&()–[{}]:;',?/*~$^+=<>])[a-z0-9A-Z_-]{6,}$")) {
                foundError = true;
                errors.setPasswordError("Không đúng định dạng!");
                request.setAttribute("FOUND_ERROR", true);
            }
            if (citizenID.trim().length() != 12) {
                foundError = true;
                errors.setCitizenIDError("Không đúng định dạng!");
                request.setAttribute("FOUND_ERROR", true);
            }
            if (foundError) {
                request.setAttribute("SIGNUP_ERROR", errors);
            }

            if (!check) {
                error.setPasswordError("Mật khẩu xác nhận không trùng khớp!!");
                request.setAttribute("ERROR", error);
                request.setAttribute("FOUND_ERROR", true);
            }
            boolean check1 = dao.checkCitizenID(citizenID);
            if (check1) {
                error.setCitizenIDDupError("CCCD đã được sử dụng!!");
                request.setAttribute("ERROR", error);
                request.setAttribute("FOUND_ERROR", true);
            }
            if (check2) {
                error.setEmailDupError("Email đã được sử dụng!!");
                request.setAttribute("ERROR", error);
                request.setAttribute("FOUND_ERROR", true);
            }
            IdentityDAO dao1 = new IdentityDAO();
            boolean check3 = dao1.checkPhoneNum(phoneNum);
            if (check3) {
                error1.setPhoneNumDupError("Số điện thoại đã được sử dụng!!");
                request.setAttribute("error", error1);
                request.setAttribute("FOUND_ERROR", true);
            } 
            if(!foundError && check && !check1 && !check2 && !check3) {
                String epassword = dao1.sha256(password);
                IdentityDTO identity = new IdentityDTO(phoneNum, epassword, roleID);
                boolean flag = dao1.addIdentity(identity);
                if (flag) {
                    String identityID = dao1.queryID(phoneNum);
                    CustomerDTO cus = new CustomerDTO(identityID, fullName, email, address, birthday, citizenID);
                    boolean flag1 = dao.addCustomer(cus);
                    if (flag1) {
                        session.setAttribute("LOGIN_USER", cus.getFullName());
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at AddCustomerServlet: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
