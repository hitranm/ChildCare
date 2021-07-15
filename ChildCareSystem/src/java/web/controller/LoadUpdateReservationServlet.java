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
public class LoadUpdateReservationServlet extends HttpServlet {

    private final static String SUCCESS = "updateReservation.jsp";

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
        String patientId = request.getParameter("txtPatientId");
        String url = SUCCESS;

        try {
            if (patientId != null) {
                //1. Go to cart place
                HttpSession session = request.getSession();
                String identityId = (String) session.getAttribute("IDENTITY_ID");
                if (identityId != null) { // Authenticated
                    CartObject cart = (CartObject) session.getAttribute("CART");
                    if (cart != null) { // Nếu có cart
                        CartItem targetReservation = cart.getCartItem(Integer.parseInt(patientId));
                        if (targetReservation != null) {  // Có tồn tại đơn này
                            request.setAttribute("UPDATE_RESERVATION", targetReservation);
                            IdentityDAO identityDAO = new IdentityDAO();
                            CustomerDAO customerDAO = new CustomerDAO();
                            PatientDAO patientDAO = new PatientDAO();
                            // Get customerId if any
                            String customerId = customerDAO.getCustomerIdByIdentity(identityId);
                            if (!customerId.equals("")) {
                                IdentityDTO identityDTO = identityDAO.getIdentityDTO(identityId);
                                CustomerDTO customerDTO = customerDAO.queryCustomerByIdentityId(identityId);
                                List<PatientDTO> listPatient = patientDAO.getAllPatientProfile(customerId);
                                ReservationViewModel reservationViewModel = new ReservationViewModel(customerDTO, listPatient, identityDTO);
                                request.setAttribute("VIEW_MODEL", reservationViewModel);
                            }
                        } else { // Ko có đơn
                            request.setAttribute("NOT_EXIST", "Đơn đặt hàng này không tồn tại.");
                        }
                    } else { // Ko có cart
                        request.setAttribute("EMPTY_CART", "Không có dịch vụ nào đang chờ được thanh toán.");
                    }
                } else {
                    response.sendRedirect("login.jsp");
                }  // End authenticated

            }
        } catch (SQLException | NamingException ex) {
            log("Error at LoadUpdateReservationServlet: " + ex.getMessage());
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
