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
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblMedicalExamination.MedicalExaminationDAO;
import web.models.tblMedicalExamination.MedicalExaminationDTO;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDAO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblSpecialty.SpecialtyDAO;
import web.models.tblSpecialty.SpecialtyDTO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;
import web.viewModels.ReservationDetails.ReservationDetailViewModel;

/**
 *
 * @author Admin
 */
public class ViewReservationDetailStaffServlet extends HttpServlet {

    private static final String VIEW_RESERVATION_DETAIL = "viewReservationDetailsStaff.jsp";

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
        
        String id = request.getParameter("resid");
        String url = VIEW_RESERVATION_DETAIL;
        ReservationDAO resDAO = new ReservationDAO();
        CustomerDAO customerDAO = new CustomerDAO();
        PatientDAO patDAO = new PatientDAO();
        ServiceDAO serDAO = new ServiceDAO();
        StaffDAO staffDAO = new StaffDAO();
        SpecialtyDAO speDAO = new SpecialtyDAO();
        MedicalExaminationDAO medicalExamDAO = new MedicalExaminationDAO();

        try {
            ReservationDTO reservationDTO = resDAO.queryResById(id);
            CustomerDTO customerDTO = customerDAO.queryCustomerByCustomerId(reservationDTO.getCustomerId());
            PatientDTO patientDTO = patDAO.getPatByID(reservationDTO.getPatientId());
            ServiceDTO serviceDTO = serDAO.getServiceInfo(reservationDTO.getServiceId());
            StaffDTO staffDTO = staffDAO.queryStaffById(reservationDTO.getStaffAssignId());
            SpecialtyDTO speDTO = speDAO.getSpecialtyName(staffDTO.getSpecialtyID());
            String specialtyName = speDTO.getSpecialtyName();
            ReservationDetailViewModel resViewModel = new ReservationDetailViewModel(customerDTO, patientDTO, serviceDTO, staffDTO, specialtyName, reservationDTO);
            request.setAttribute("RES_DETAIL", resViewModel);
            //---------
            MedicalExaminationDTO previousExam = medicalExamDAO.getExaminationByReservationId(Integer.parseInt(id));
            if(previousExam != null) {
                request.setAttribute("PRE_EXAM", previousExam);
            }

        } catch (SQLException | NamingException e) {
            log("Error at ViewReservationDetailServlet: " + e.toString());
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
