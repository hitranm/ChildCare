/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblAdmin.AdminDAO;
import web.models.tblAdmin.AdminDTO;
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblIdentity.IdentityDTO;
import web.models.tblManager.ManagerDAO;
import web.models.tblManager.ManagerDTO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;
import web.viewModels.UserProfile.UserProfileViewModel;

/**
 *
 * @author Admin
 */
public class UpdateProfileServlet extends HttpServlet {

    private static final String ERROR = "systemError.html";
    private static final String SUCCESS = "viewProfile.jsp";

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
            String address = request.getParameter("address");
            String birthday = request.getParameter("birthday");
            String phoneNumber = request.getParameter("phoneNum");
            String citizenID = request.getParameter("citizenID");
            String specialtyID = request.getParameter("specialtyID");
            IdentityDAO identityDAO = new IdentityDAO();
            AdminDAO dao0 = new AdminDAO();
            ManagerDAO dao1 = new ManagerDAO();
            StaffDAO dao2 = new StaffDAO();
            CustomerDAO dao3 = new CustomerDAO();
            HttpSession session = request.getSession();
            String identityID = (String) session.getAttribute("IDENTITY_ID");
            int roleID = identityDAO.getRoleIDByIdentityID(identityID);
            if (roleID == 4) {
                AdminDTO dto = new AdminDTO(identityID, fullName, phoneNumber, address, birthday, citizenID);
                boolean check = dao0.update(dto);
                if (check) {

                    IdentityDTO identityDTO = identityDAO.getIdentityDTO(identityID);
                    UserProfileViewModel userProfile = new UserProfileViewModel(identityDTO, dto.getFullName(), dto.getPhoneNumber(), dto.getAddress(), dto.getBirthday(), dto.getCitizenID());
                    session.setAttribute("USER_PROFILE", userProfile);
                    session.setAttribute("LOGIN_USER", dto);
                    String msg = "Cập nhật thành công";
                    request.setAttribute("SUCCESS", msg);
                    url = SUCCESS;
                }
            }
            if (roleID == 3) {
                ManagerDTO dto = new ManagerDTO(identityID, fullName, phoneNumber, address, birthday, citizenID);
                boolean check = dao1.update(dto);
                if (check) {
                    // session.setAttribute("USER_PROFILE", dto);
                    IdentityDTO identityDTO = identityDAO.getIdentityDTO(identityID);
                    UserProfileViewModel userProfile = new UserProfileViewModel(identityDTO, dto.getFullName(), dto.getPhoneNumber(), dto.getAddress(), dto.getBirthday(), dto.getCitizenID());
                    session.setAttribute("USER_PROFILE", userProfile);
                    session.setAttribute("LOGIN_USER", dto);
                    String msg = "Cập nhật thành công";
                    request.setAttribute("SUCCESS", msg);
                    url = SUCCESS;
                }
            }
            if (roleID == 2) {
                StaffDTO dto = new StaffDTO(identityID, fullName, phoneNumber, address, birthday, citizenID, specialtyID);
                boolean check = dao2.update(dto);
                if (check) {
                    // session.setAttribute("USER_PROFILE", dto);
                    IdentityDTO identityDTO = identityDAO.getIdentityDTO(identityID);
                    UserProfileViewModel userProfile = new UserProfileViewModel(identityDTO, dto.getFullName(), dto.getPhoneNumber(), dto.getAddress(), dto.getBirthday(), dto.getCitizenID(), dto.getSpecialtyID());
                    session.setAttribute("USER_PROFILE", userProfile);
                    session.setAttribute("LOGIN_USER", dto);
                    String msg = "Cập nhật thành công";
                    request.setAttribute("SUCCESS", msg);
                    url = SUCCESS;
                }
            }
            if (roleID == 1) {
                CustomerDTO dto = new CustomerDTO(identityID, fullName, phoneNumber, address, birthday, citizenID);
                boolean check = dao3.update(dto);
                if (check) {
                    // session.setAttribute("USER_PROFILE", dto);
                    IdentityDTO identityDTO = identityDAO.getIdentityDTO(identityID);
                    UserProfileViewModel userProfile = new UserProfileViewModel(identityDTO, dto.getFullName(), dto.getPhoneNumber(), dto.getAddress(), dto.getBirthday(), dto.getCitizenID());
                    session.setAttribute("USER_PROFILE", userProfile);
                    session.setAttribute("LOGIN_USER", dto);
                    String msg = "Cập nhật thành công";
                    request.setAttribute("SUCCESS", msg);
                    url = SUCCESS;

                }
            }
        } catch (Exception e) {
            log("Error at UpdateProfileServlet: " + e.toString());
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
