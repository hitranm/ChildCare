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
import web.models.tblMedicalExamination.MedicalExaminationDAO;

/**
 *
 * @author HOANGKHOI
 */
public class DeleteExaminationServlet extends HttpServlet {

    private static final String VIEW_RESERVATION = "DispatchServlet?btAction=ViewReservationDetailsStaff&resid=";
    private static final String ERROR = "systemError.html";

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
        HttpSession session = request.getSession();
        String strExaminationId = request.getParameter("txtExaminationId");
        String strReservationId = request.getParameter("txtReservationId");
        MedicalExaminationDAO medicalExamDAO = new MedicalExaminationDAO();
        String url = VIEW_RESERVATION;
        try {
            if (session.getAttribute("ROLE") == null) {
                request.setAttribute("DID_LOGIN", "Bạn cần đăng nhập để thực hiện thao tác này");
                url = "login.jsp";
            } else if (session.getAttribute("ROLE") != "staff") {
                url = "accessDenied.jsp";
            } else {
                int reservationId = Integer.parseInt(strReservationId);
                url = url + reservationId;
                int examinationId = Integer.parseInt(strExaminationId);
                boolean result = medicalExamDAO.deleteExamination(examinationId);
                if (result == false) {
                    url = ERROR;
                }
            }

        } catch (NumberFormatException | SQLException | NamingException ex) {
            log("Error at DeleteExaminationServlet: " + ex.getMessage());
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
