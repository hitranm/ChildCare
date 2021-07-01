/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblManager.ManagerDAO;
import web.models.tblManager.ManagerDTO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;


/**
 *
 * @author Admin
 */
public class ViewAccountsServlet extends HttpServlet {
private static final String VIEW_ACCOUNT="viewAllAccounts.jsp";
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
        String url=VIEW_ACCOUNT;
        try {
            CustomerDAO customerDAO = new CustomerDAO();
            StaffDAO staffDAO = new StaffDAO();
            ManagerDAO managerDAO = new ManagerDAO();
            List<CustomerDTO> listCustomer = customerDAO.getAllCustomerProfile();
            request.setAttribute("ListCustomer", listCustomer);
            List<StaffDTO> listStaff = staffDAO.getAllStaffProfile();
            request.setAttribute("ListStaff", listStaff);
            List<ManagerDTO> listManager = managerDAO.getAllManagerProfile();
            request.setAttribute("ListManager", listManager);
        } catch (Exception e) {
            log("ERROR at ViewPatientProfileServlet: " + e.getMessage());
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
