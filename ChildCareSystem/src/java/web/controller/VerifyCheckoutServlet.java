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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.Cart.CartItem;
import web.models.Cart.CartObject;
import web.models.tblCustomer.CustomerDAO;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblReservation.ReservationDAO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;

/**
 *
 * @author HOANGKHOI
 */
public class VerifyCheckoutServlet extends HttpServlet {

    private static final String ERROR = "";
    private static final String SUCCESS = "successCheckout.jsp";
    private static final String EMPTY_CART = "home.jsp";
    private static final String LOGIN_PAGE = "login.jsp";
    private static final String SERVICE_CART = "serviceCart.jsp";

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
        CustomerDAO customerDAO = new CustomerDAO();
        ServiceDAO serviceDAO = new ServiceDAO();
        StaffDAO staffDAO = new StaffDAO();
        ReservationDAO reservationDAO = new ReservationDAO();
        boolean status = false;
        String url = LOGIN_PAGE;
        try {
            String idenityId = (String) session.getAttribute("IDENTITY_ID");
            String customerId = customerDAO.getCustomerIdByIdentity(idenityId);

            if (customerId != null) {
                CartObject cart = (CartObject) session.getAttribute("CART");
                if (cart != null) {
                    for (CartItem reservation : cart.getCartItems()) {
                        status = false;
                        int serviecId = reservation.getServiceId();
                        String serviceName = serviceDAO.getServiceNameById(serviecId);
                        String checkInTime = reservation.getCheckInTime();
                        ServiceDTO serviceDTO = serviceDAO.getServiceInfo(serviecId);
                        int specialtyId = Integer.parseInt(serviceDTO.getSpecialtyId());
                        boolean isExistedReservation
                                = reservationDAO.checkExistedReervation(reservation.getPatientId(), reservation.getServiceId(), reservation.getCheckInTime());
                        if (isExistedReservation) {
                            PatientDAO patientDAO = new PatientDAO();
                            String patientName = patientDAO.getPatienNametByID(reservation.getPatientId());
                            request.setAttribute("RESERVATION_EXIST", "Bạn đã đặt dịch vụ " + serviceName + " vào thời điểm " + checkInTime + " cho bệnh nhân " + patientName);
                            url = SERVICE_CART;
                            request.getRequestDispatcher(url).forward(request, response);
                            break;
                        }
                        // Lấy ra list staff thuộc specialty
                        List<StaffDTO> listStaff = staffDAO.getStaffListBySpecialtyId(specialtyId);

                        if (listStaff == null) {
                            request.setAttribute("SERVICE_BUSY", "Dịch vụ " + serviceName + " vào thời điểm " + checkInTime + " hiện không thể đặt.");
                            reservationDAO.getWaitingList().clear();
                            url = SERVICE_CART;
                            request.getRequestDispatcher(url).forward(request, response);
                        } else {
                            boolean foundStaff = false;
                            for (StaffDTO staff : listStaff) {
                                int staffId = Integer.parseInt(staff.getStaffID());
                                boolean IsAssignedService = reservationDAO.getReservationByInfo(staffId, serviecId, checkInTime);
                                if (IsAssignedService == false) {
                                    ReservationDTO reservationDTO
                                            = new ReservationDTO(Integer.parseInt(customerId), reservation.getPatientId(), serviecId, staffId, reservation.getTimeIntervalId(), checkInTime);
                                    // Add to waiting list
                                    reservationDAO.getWaitingList().add(reservationDTO);
                                    foundStaff = true;
                                    status = true;
                                    break;
                                }
                            }
                            if (foundStaff == false) {
                                request.setAttribute("SERVICE_BUSY", "Dịch vụ " + serviceName + " vào thời điểm " + checkInTime + " hiện không thể đặt.");
                                reservationDAO.getWaitingList().clear();
                                url = SERVICE_CART;
                                request.getRequestDispatcher(url).forward(request, response);
                            }
                        }
                    }

                    if (status == true) {
                        //Execute batch
                        reservationDAO.AddReservation();
                        url = SUCCESS;
                        session.removeAttribute("CART");
                        session.removeAttribute("CART_VIEW_MODEL");
                        response.sendRedirect(url);
                    }

                } else { // if empty cart
                    url = EMPTY_CART;
                    response.sendRedirect(url);
                }
            } else {  // if not login
                response.sendRedirect(url);
            }
        } catch (IOException | SQLException | NamingException ex) {
            log("Error at VerifyCheckoutServlet: " + ex.getMessage());
        } finally {

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
