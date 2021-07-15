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
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblFeedback.FeedbackDAO;
import web.models.tblFeedback.FeedbackDTO;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDAO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.viewModels.Feedback.FeedbackViewModel;

/**
 *
 * @author HOANGKHOI
 */
public class LoadFeedbackServlet extends HttpServlet {

    private static final String FEEDBACK_PAGE = "feedback.jsp";

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
        String reservationId = request.getParameter("id");
        ReservationDAO reservationDAO = new ReservationDAO();
        PatientDAO patientDAO = new PatientDAO();
        ServiceDAO serviceDAO = new ServiceDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        String url = FEEDBACK_PAGE;

        try {
            //Get reservation
            ReservationDTO reservationDTO = reservationDAO.queryResById(reservationId);
            // Get service, patient and customer      
            ServiceDTO serviceDTO = serviceDAO.getServiceInfo(reservationDTO.getServiceId());
            PatientDTO patientDTO = patientDAO.getPatByID(reservationDTO.getPatientId());
            CustomerDTO customerDTO = customerDAO.queryCustomerByCustomerId(reservationDTO.getCustomerId());
            FeedbackViewModel viewModel = new FeedbackViewModel(patientDTO, serviceDTO, reservationDTO, customerDTO);
            FeedbackDTO previousFeedback = feedbackDAO.getFeedbackByReservationId(reservationDTO.getReservationId());
            if (previousFeedback != null) {
                request.setAttribute("PREVIOUS_FEEDBACK", previousFeedback);
            }
            request.setAttribute("FEEDBACK_VIEW_MODEL", viewModel);

        } catch (SQLException | NamingException ex) {
            log("Error at LoadFeedbackServlet: " + ex.getMessage());
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
