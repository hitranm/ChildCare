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
import web.models.tblFeedback.FeedbackDAO;
import web.models.tblFeedback.FeedbackDTO;

/**
 *
 * @author HOANGKHOI
 */
public class CreateFeedbackServlet extends HttpServlet {
    private static final String SUCCESS = "viewPatientProfile.jsp";
    private static final String ERROR = "feedback.jsp";
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
        String strReservationId = request.getParameter("txtrReservationId");
        String strCustomerId = request.getParameter("txtCustomerId");
        String strServiceId = request.getParameter("txtServiceId");
        String strStar = request.getParameter("txtStar");
        String strComment = request.getParameter("txtComment");
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        String url = ERROR;
        try {
            int reservationId = Integer.parseInt(strReservationId);
            int customerId = Integer.parseInt(strCustomerId);
            int serviceId = Integer.parseInt(strServiceId);
            int star = Integer.parseInt(strStar);
            FeedbackDTO feedbackDTO = new FeedbackDTO(serviceId, customerId, reservationId, strComment, star);
            boolean result = feedbackDAO.addFeedback(feedbackDTO);
            if (result) {
                url = SUCCESS;
            }
            
        } catch (Exception ex) {
            log("Error at CreateFeedbackServlet: " + ex.getMessage());
            url = ERROR;
        }
        finally {
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
