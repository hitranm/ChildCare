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
import web.models.tblBlog.BlogDAO;
import web.models.tblFeedback.FeedbackDAO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblReservation.ReservationDAO;
import web.models.tblService.ServiceDAO;

/**
 *
 * @author Admin
 */
public class MainDashBoardServlet extends HttpServlet {

    private static final String VIEW_DASHBOARD = "dashboard.jsp";

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
        String url = VIEW_DASHBOARD;
        try {
            IdentityDAO identityDAO = new IdentityDAO();
            ServiceDAO serviceDAO = new ServiceDAO();
            BlogDAO blogDAO = new BlogDAO();
            ReservationDAO reservationDAO = new ReservationDAO();
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            int sum = identityDAO.countAllAccount();
            request.setAttribute("TOTAL_ACCOUNT", sum);
            int allService = serviceDAO.countAllService();
            request.setAttribute("ALL_SERVICE", allService);
            int allBlog = blogDAO.countAllBlog();
            request.setAttribute("ALL_BLOG", allBlog);
            int allfb = feedbackDAO.countAllFeedback();
            request.setAttribute("ALL_FB", allfb);
            int allRes = reservationDAO.countAllRes();
            request.setAttribute("ALL_RES", allRes);
        } catch (SQLException | NamingException e) {
            log("ERROR at MainDashBoardServlet: " + e.getMessage());
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
