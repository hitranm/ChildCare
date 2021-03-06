/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
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
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.viewModels.Reservation.ReservationViewModel;

/**
 *
 * @author HOANGKHOI
 */
public class ChooseReservationServlet extends HttpServlet {

    private static final String CHOOSE_SERVICE_PAGE = "chooseServiceReserve.jsp";

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
        HttpSession session = request.getSession();
        String url = CHOOSE_SERVICE_PAGE;
        //String status = request.getParameter("status");
        try {
            IdentityDAO identityDAO = new IdentityDAO();
            CustomerDAO customerDAO = new CustomerDAO();
            PatientDAO patientDAO = new PatientDAO();

            String identityId = (String) session.getAttribute("IDENTITY_ID");
            if (identityId != null) {
                // Get customerId if any
                String customerId = customerDAO.getCustomerIdByIdentity(identityId);
                if (!customerId.equals("")) {
                    IdentityDTO identityDTO = identityDAO.getIdentityDTO(identityId);
                    CustomerDTO customerDTO = customerDAO.queryCustomerByIdentityId(identityId);
                    List<PatientDTO> listPatient = patientDAO.getAllPatientProfile(customerId);
                    ReservationViewModel reservationViewModel = new ReservationViewModel(customerDTO, listPatient, identityDTO);
                    request.setAttribute("VIEW_MODEL", reservationViewModel);
                    String status = (String) session.getAttribute("STATUS");
                    if (status != null) {
                        if (status.equals("DUPLICATED")) {
                            request.setAttribute("DUPLICATE_PATIENT", "????n ?????t kh??m c???a b???nh nh??n n??y ??ang ch??? ???????c thanh to??n.");
                        } else if (status.equals("MAX")) {
                            request.setAttribute("MAX_RESERVATION", "B???n ch??? c?? th??? ?????t t???i ??a 3 ????n trong 1 l???n thanh to??n.");
                        }
                        session.removeAttribute("STATUS");
                    }
                }
            }
        } catch (SQLException | NamingException ex) {
            log("Error at ChooseReservationServlet: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.include(request, response);
            //response.sendRedirect(url);
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
