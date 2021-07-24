/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
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
import web.models.tblOpenTime.OpenTimeDAO;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblSpecialty.SpecialtyDAO;
import web.models.tblSpecialty.SpecialtyDTO;
import web.viewModels.Cart.CartViewModel;

/**
 *
 * @author HOANGKHOI
 */
public class UpdateReservationServlet extends HttpServlet {

    private static final String SUCCESS = "xem-don-dat-kham";

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
        int customerId = Integer.parseInt(request.getParameter("txtCustomerId"));
        int patientId = Integer.parseInt(request.getParameter("txtPatientId"));
        int serviceId = Integer.parseInt(request.getParameter("txtServiceId"));
        int timeIntervalId = Integer.parseInt(request.getParameter("txtTimeId"));
        String date = request.getParameter("txtDate");
        OpenTimeDAO openTimeDAO = new OpenTimeDAO();
        String url = SUCCESS;

        try {
            //1. Go to cart place
            HttpSession session = request.getSession(); // get true;

            //2. Customer take cart
            CartObject cart = (CartObject) session.getAttribute("CART");
            List<CartViewModel> listCartViewModel = (List<CartViewModel>) session.getAttribute("CART_VIEW_MODEL");

            if (cart != null) {
                String time = openTimeDAO.getTimeString(timeIntervalId);
                String datetime = date + " " + time;
                CartItem reservation = new CartItem(customerId, patientId, serviceId, timeIntervalId, datetime);
                //Update cart item
                boolean result = cart.UpdateCartItem(reservation);
                if (result) { //Update thành công
                    session.setAttribute("CART", cart);
                    //Update trong list View Model
                    //Setup viewmodel
                    CustomerDAO customerDAO = new CustomerDAO();
                    CustomerDTO customerDTO = customerDAO.queryCustomerByCustomerId(customerId);

                    PatientDAO patientDAO = new PatientDAO();
                    PatientDTO patientDTO = patientDAO.getPatientByID(String.valueOf(patientId));

                    ServiceDAO serviceDAO = new ServiceDAO();
                    ServiceDTO serviceDTO = serviceDAO.getServiceInfo(serviceId);

                    SpecialtyDAO specialtyDAO = new SpecialtyDAO();
                    int specialtyId = Integer.parseInt(serviceDTO.getSpecialtyId());
                    SpecialtyDTO specialtyDTO = specialtyDAO.getSpecialtyById(specialtyId);
                    CartViewModel cartViewModel = new CartViewModel(customerDTO, patientDTO, serviceDTO, specialtyDTO, reservation);
                    //Xóa cũ
                    CartViewModel deleteViewModel = null;
                    for (CartViewModel viewModel : listCartViewModel) {
                        if (Integer.parseInt(viewModel.getPatientDTO().getPatientID()) == patientId) {
                            deleteViewModel = viewModel;
                        }
                    }
                    double totalPrice = cart.getTotalPrice();
                    DecimalFormat df = new DecimalFormat("#.000");
                    String total = df.format(totalPrice);
                    session.setAttribute("TOTAL_PRICE", total);
                    
                    listCartViewModel.remove(deleteViewModel);
                    listCartViewModel.add(cartViewModel);
                    session.setAttribute("CART_VIEW_MODEL", listCartViewModel);
                }

            } else {
                request.setAttribute("CART_EMPTY", "Không có dịch vụ nào đang chờ được thanh toán.");
            }

        } catch (SQLException | NamingException ex) {
            log("Error at UpdateReservationServlet: " + ex.getMessage());
        } catch (Exception ex) {
            log("Error at UpdateReservationServlet: " + ex.getMessage());
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
