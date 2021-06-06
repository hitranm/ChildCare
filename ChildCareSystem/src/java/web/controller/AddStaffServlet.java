/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;
import web.utils.CheckValidHelper;
import web.utils.RegisterValidation;

/**
 *
 * @author HOANGKHOI
 */
public class AddStaffServlet extends HttpServlet {

    private static final String ERROR = "error.jsp";
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
            String specialtyID = request.getParameter("specialtyID");
            HttpSession session = request.getSession();
            StaffDAO staffDAO = new StaffDAO();
            IdentityDAO identityDAO = new IdentityDAO();
            RegisterValidation registerValidation = new RegisterValidation();
            boolean foundError = false;
            if (!CheckValidHelper.IsValidPhoneNumberLength(phoneNum)) {
                foundError = true;
                registerValidation.setWrongFormatPhoneNumber("Số điện thoại phải gồm 10 chữ số!");
            }

            if (!CheckValidHelper.IsFormatPassword(password)) {
                foundError = true;
                registerValidation.setWrongFormatPassword("Không đúng định dạng!");
            }

            if (!CheckValidHelper.IsValidCitizenIdLength(citizenID)) {
                foundError = true;
                registerValidation.setDuplicatedCitizenId("Không đúng định dạng!");
            }

            if (!CheckValidHelper.checkConfirmPassword(password, cpassword)) {
                foundError = true;
                registerValidation.setConfirmPasswordNotMatch("Mật khẩu xác nhận không trùng khớp!");
            }

            if (identityDAO.checkDuplicatedEmail(email)) {
                foundError = true;
                registerValidation.setDuplicatedEmail("Email này đã được sử dụng!");
            }

            /* -------- Following errors are depend on each role --------*/
            if (staffDAO.checkCitizenID(citizenID)) {
                foundError = true;
                registerValidation.setDuplicatedCitizenId("Căn cước công dân này đã được sử dụng.");
            }

            if (staffDAO.checkDuplicatedPhoneNumber(phoneNum)) {
                foundError = true;
                registerValidation.setDuplicatedPhoneNum("Số điện thoại này đã được sử dụng!");
            }
            /*------------------------------------------------------------*/

            if (foundError) {
                request.setAttribute("SIGNUP_ERROR", registerValidation);
                request.setAttribute("FOUND_ERROR", true);
            } else {
                String hashedPassword = identityDAO.sha256(password);
                IdentityDTO identityDTO = new IdentityDTO(email, hashedPassword, roleID);
                boolean resultAddIdentity = identityDAO.addIdentity(identityDTO);
                if (resultAddIdentity) {
                    String identityId = identityDAO.queryIDByEmail(email);
                    staffDAO.addStaff(identityId, fullName, phoneNum, address, birthday, citizenID, specialtyID);
                    url = SUCCESS;
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
