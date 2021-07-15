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
import web.models.tblBlog.BlogDAO;
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblFeedback.FeedbackDAO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblManager.ManagerDAO;
import web.models.tblManager.ManagerDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;

/**
 *
 * @author Admin
 */
public class ViewAccountsServlet extends HttpServlet {

    private static final String VIEW_ACCOUNT = "accountDashboard.jsp";

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
        String url = VIEW_ACCOUNT;
        try {
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            ServiceDAO dao = new ServiceDAO();
            BlogDAO blogDAO = new BlogDAO();
            IdentityDAO identityDAO = new IdentityDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            StaffDAO staffDAO = new StaffDAO();
            ManagerDAO managerDAO = new ManagerDAO();
            List<CustomerDTO> listActiveCustomer = customerDAO.getAllActiveCustomerProfile();
            request.setAttribute("ListActiveCustomer", listActiveCustomer);
            List<StaffDTO> listActiveStaff = staffDAO.getAllActiveStaffProfile();
            request.setAttribute("ListActiveStaff", listActiveStaff);
            List<ManagerDTO> listActiveManager = managerDAO.getAllActiveManagerProfile();
            request.setAttribute("ListActiveManager", listActiveManager);
            List<CustomerDTO> listDeactiveCustomer = customerDAO.getAllDeactiveCustomerProfile();
            request.setAttribute("ListDeactiveCustomer", listDeactiveCustomer);
            List<StaffDTO> listDeactiveStaff = staffDAO.getAllDeactiveStaffProfile();
            request.setAttribute("ListDeactiveStaff", listDeactiveStaff);
            List<ManagerDTO> listDeactiveManager = managerDAO.getAllDeactiveManagerProfile();
            request.setAttribute("ListDeactiveManager", listDeactiveManager);
            int sum = identityDAO.countAllAccount();
            request.setAttribute("TOTAL_ACCOUNT", sum);
            int customers = identityDAO.countCustomerAccount();
            request.setAttribute("CUSTOMER_ACCOUNT", customers);
            int staffs = identityDAO.countStaffAccount();
            request.setAttribute("STAFF_ACCOUNT", staffs);
            int newaccs = identityDAO.countNewAccountMonthly();
            request.setAttribute("MONTHLY_ACCOUNT", newaccs);
            int sumActive = identityDAO.countAllActiveAccount();
            request.setAttribute("ACTIVE_ACCOUNT", sumActive);
            int sumDeact = identityDAO.countAllDeactiveAccount();
            request.setAttribute("DEACT_ACCOUNT", sumDeact);

        } catch (Exception e) {
            log("ERROR at ViewAccountsServlet: " + e.getMessage());
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
