/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
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
public class ViewAccountDetailsServlet extends HttpServlet {

    private static final String ERROR = "systemError.html";
    private static final String VIEW_ACCOUNT_DETAIL = "viewDetails.jsp";

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
        String url = VIEW_ACCOUNT_DETAIL;
        try {
            HttpSession session = request.getSession();
            String currentIdentityID = request.getParameter("id");
            //  if (currentIdentityID != null) {
            IdentityDAO identityDAO = new IdentityDAO();
            IdentityDTO identityDTO = identityDAO.getIdentityDTO(currentIdentityID);
            int roleId = identityDAO.getRoleIDByIdentityID(currentIdentityID);
            switch (roleId) {
                case 1:
                    CustomerDAO customerDAO = new CustomerDAO();
                    CustomerDTO customerDTO = customerDAO.queryCustomerByIdentityId(currentIdentityID);

                    UserProfileViewModel userProfileViewModelCus = new UserProfileViewModel(identityDTO,
                            customerDTO.getFullName(),
                            customerDTO.getPhoneNumber(),
                            customerDTO.getAddress(),
                            customerDTO.getBirthday(),
                            customerDTO.getCitizenID());
                    session.setAttribute("USER_PROFILE1", userProfileViewModelCus);
                    break;
                case 2:
                    StaffDAO staffDAO = new StaffDAO();
                    StaffDTO staffDTO = staffDAO.queryStaffByIdentityId(currentIdentityID);

                    UserProfileViewModel userProfileViewModelStaff = new UserProfileViewModel(identityDTO, staffDTO.getFullName(), staffDTO.getPhoneNumber(), staffDTO.getAddress(), staffDTO.getBirthday(), staffDTO.getCitizenID(), staffDTO.getSpecialtyID());
                    session.setAttribute("USER_PROFILE1", userProfileViewModelStaff);
                    break;
                case 3:
                    ManagerDAO managerDAO = new ManagerDAO();
                    ManagerDTO managerDTO = managerDAO.queryManagerByIdentityId(currentIdentityID);
                    UserProfileViewModel userProfileViewModelManager = new UserProfileViewModel(identityDTO,
                            managerDTO.getFullName(),
                            managerDTO.getPhoneNumber(),
                            managerDTO.getAddress(),
                            managerDTO.getBirthday(),
                            managerDTO.getCitizenID());
                    session.setAttribute("USER_PROFILE1", userProfileViewModelManager);
                    break;
                case 4:
                    AdminDAO adminDAO = new AdminDAO();
                    AdminDTO adminDTO = adminDAO.queryAdminByIdentityId(currentIdentityID);
                    UserProfileViewModel userProfileViewModelAdmin = new UserProfileViewModel(identityDTO,
                            adminDTO.getFullName(),
                            adminDTO.getPhoneNumber(),
                            adminDTO.getAddress(),
                            adminDTO.getBirthday(),
                            adminDTO.getCitizenID());
                    session.setAttribute("USER_PROFILE1", userProfileViewModelAdmin);
                    break;

            }
            // } else {
            //    url = HOME_PAGE;
            // }

        } catch (Exception e) {
            log("Error at ViewAccountDetailsServlet: " + e.getMessage());
            url = ERROR;
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);

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
