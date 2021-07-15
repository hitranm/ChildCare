/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblAdmin.AdminDAO;
import web.models.tblAdmin.AdminDTO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblIdentity.IdentityDTO;
import web.models.tblManager.ManagerDAO;
import web.models.tblManager.ManagerDTO;
import web.utils.CheckValidHelper;
import web.utils.RegisterValidation;

/**
 *
 * @author Admin
 */
public class AddManagerServlet extends HttpServlet {

    private static final String ERROR = "addManager.jsp";
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
            int roleId = Integer.parseInt(roleID);
            HttpSession session = request.getSession();
            ManagerDAO managerDAO = new ManagerDAO();
            AdminDAO adminDAO = new AdminDAO();
            IdentityDAO identityDAO = new IdentityDAO();
            RegisterValidation registerValidation = new RegisterValidation();
            boolean foundError = false;
            if (!CheckValidHelper.IsValidPhoneNumberLength(phoneNum)) {
                foundError = true;
                registerValidation.setWrongFormatPhoneNumber("Số điện thoại phải gồm 10 chữ số!");
            }

            if (!CheckValidHelper.IsFormatPassword(password)) {
                foundError = true;
                registerValidation.setWrongFormatPassword("Mật khẩu không đúng định dạng!");
            }

            if (!CheckValidHelper.IsValidCitizenIdLength(citizenID)) {
                foundError = true;
                registerValidation.setDuplicatedCitizenId("CCCD không đúng định dạng!");
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
            switch (roleId) {
                case 3:
                    if (managerDAO.checkCitizenID(citizenID)) {
                        foundError = true;
                        registerValidation.setDuplicatedCitizenId("Căn cước công dân này đã được sử dụng.");
                    }

                    if (managerDAO.checkDuplicatedPhoneNumber(phoneNum)) {
                        foundError = true;
                        registerValidation.setDuplicatedPhoneNum("Số điện thoại này đã được sử dụng!");
                    }
                    break;
                case 4:
                    if (adminDAO.checkCitizenID(citizenID)) {
                        foundError = true;
                        registerValidation.setDuplicatedCitizenId("Căn cước công dân này đã được sử dụng.");
                    }

                    if (adminDAO.checkDuplicatedPhoneNumber(phoneNum)) {
                        foundError = true;
                        registerValidation.setDuplicatedPhoneNum("Số điện thoại này đã được sử dụng!");
                    }
                    break;
            }
            /*------------------------------------------------------------*/

            if (foundError) {
                request.setAttribute("SIGNUP_ERROR", registerValidation);
                request.setAttribute("FOUND_ERROR", true);
            } else {
                String epassword = identityDAO.sha256(password);
                IdentityDTO identity = new IdentityDTO(email, epassword, roleID);
                boolean resultAddIdentity = identityDAO.addIdentity(identity);
                if (resultAddIdentity) {
                    String identityID = identityDAO.queryIDByEmail(email);
                    if (roleID.equals("3")) {
                        ManagerDTO man = new ManagerDTO(identityID, fullName, address, birthday, citizenID, phoneNum);
                        boolean flag1 = managerDAO.addManager(man);
                        if (flag1) {
                            url = SUCCESS;
                        }
                    }
                    if (roleID.equals("4")) {
                        AdminDTO admin = new AdminDTO(identityID, fullName, address, birthday, citizenID, phoneNum);
                        boolean check = adminDAO.addAdmin(admin);
                        if (check) {
                            url = SUCCESS;
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
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
