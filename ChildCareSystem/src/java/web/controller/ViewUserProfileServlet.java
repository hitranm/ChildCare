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
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblIdentity.IdentityDTO;
import web.viewModels.UserProfile.UserProfileViewModel;

/**
 *
 * @author HOANGKHOI
 */
public class ViewUserProfileServlet extends HttpServlet {
    private static final String VIEW_USER_PROFILE_PAGE = "viewProfile.jsp";
    private static final String HOME_PAGE = "home.jsp";
    private static final String ERROR_PAGE = "error.jsp";
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
        String url = VIEW_USER_PROFILE_PAGE;
        
        try {
            HttpSession session = request.getSession();
            String currentIdentityID = (String)session.getAttribute("IDENTITYID");
            if (currentIdentityID != null) {
                IdentityDAO identityDAO = new IdentityDAO();
                IdentityDTO identityDTO = identityDAO.getIdentityDTO(currentIdentityID);
                int roleId = identityDAO.getRoleIDByIdentityID(currentIdentityID);
                switch(roleId) {
                    case 1:
                        CustomerDAO customerDAO = new CustomerDAO();
                        CustomerDTO customerDTO = customerDAO.queryCustomerByIdentityId(currentIdentityID);
                        
                        UserProfileViewModel userProfileViewModel = new UserProfileViewModel(identityDTO,
                                                                                            customerDTO.getFullName(),
                                                                                            customerDTO.getPhoneNum(),
                                                                                            customerDTO.getAddress(),
                                                                                            customerDTO.getBirthday(),
                                                                                            customerDTO.getCitizenID());
                        session.setAttribute("USER_PROFILE", userProfileViewModel);
                        break;
                    case 2:
                        //Do something
                        break;
                    case 3: 
                        //Do something
                        break;
                    case 4:
                        //Do something
                        break;
                    
                }
            } else {
                url = HOME_PAGE;
            }
            
            
        } catch (Exception e) {
            log("Error at ViewUserProfileServlet: " + e.getMessage());
            url = ERROR_PAGE;
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
