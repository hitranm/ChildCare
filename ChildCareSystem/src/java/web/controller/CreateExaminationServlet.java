/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.models.tblMedicalExamination.MedicalExaminationDAO;
import web.models.tblMedicalExamination.MedicalExaminationDTO;

/**
 *
 * @author HOANGKHOI
 */
public class CreateExaminationServlet extends HttpServlet {

    private static final String VIEW_RESERVATION = "DispatchServlet?btAction=ViewReservationDetailsStaff&resid=";
    private static final String ERROR = "";

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
        String strReservationId = request.getParameter("txtReservationId");
        String strServiceId = request.getParameter("txtServiceId");
        String prescription = request.getParameter("txtPrescription");
        MedicalExaminationDAO medicalExamDAO = new MedicalExaminationDAO();
        String url = VIEW_RESERVATION;

        try {
            int reservationId = Integer.parseInt(strReservationId);
            int serviceId = Integer.parseInt(strServiceId);
            LocalDate createdDate = LocalDate.now();
            java.sql.Date sqlDate = java.sql.Date.valueOf(createdDate);
            
            url = url + reservationId;
            if (!prescription.equals("")) {
                MedicalExaminationDTO examination
                        = new MedicalExaminationDTO(reservationId, serviceId, prescription, sqlDate, sqlDate);
                boolean result = medicalExamDAO.addExamination(examination);
                if (result == false) {
                    url = ERROR;
                }
            }
        } catch (NumberFormatException | SQLException | NamingException ex) {
            log("Error at CreateExaminationServlet " + ex.getMessage());
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
