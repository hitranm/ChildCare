/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class DeleteAccountServlet extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ViewAccountsServlet";

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
        String url = ERROR;
        String identityID = request.getParameter("id");
        IdentityDAO identityDAO = new IdentityDAO();
        try {
//            int roleID = identityDAO.getRoleIDByIdentityID(identityID);
//            if(roleID == 4) {
//                   AdminDAO adminDAO = new AdminDAO();
//                   boolean check = adminDAO.delete(identityID);
//                   boolean check2= identityDAO.delete(identityID);
//                   if(check && check2){
//                    url=SUCCESS;   
//                   }
//            }
//            if(roleID == 3){
//                 ManagerDAO managerDAO = new ManagerDAO();
//                 boolean check = managerDAO.delete(identityID);
//                   boolean check2= identityDAO.delete(identityID);
//                   if(check && check2){
//                    url=SUCCESS;   
//                   }
//            }
//            if(roleID == 2){
//                   StaffDAO staffDAO = new StaffDAO();
//                   boolean check = staffDAO.delete(identityID);
//                   boolean check2= identityDAO.delete(identityID);
//                   if(check && check2){
//                    url=SUCCESS;   
//                   }
//            }
//            if(roleID == 1){
//                    
//                   boolean check= identityDAO.delete(identityID);
//                   if(check){
//                    url=SUCCESS;   
//                   }
//            }
            int identityId = Integer.parseInt(identityID);
            identityDAO.deActiveAccount(identityId);
        } catch (SQLException | NamingException e) {
            log("Error at DeleteAccountServlet: " + e.toString());
            url = ERROR;
        } finally {
            response.sendRedirect(url);
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
