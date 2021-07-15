/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.Cart.CartItem;
import web.models.Cart.CartObject;
import web.viewModels.Cart.CartViewModel;

/**
 *
 * @author HOANGKHOI
 */
public class RemoveServiceFromCartServlet extends HttpServlet {

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
        String url = "xem-don-dat-kham";
        boolean result = false;
        int patientId = Integer.parseInt(request.getParameter("txtPatientId"));
        try {
            //1. Customer go to cart place
            HttpSession session = request.getSession();
            if (session != null) {
                //2. Customer take cart
                CartObject cart = (CartObject) session.getAttribute("CART");
                List<CartViewModel> listCartViewModel = (List<CartViewModel>) session.getAttribute("CART_VIEW_MODEL");
                if (cart != null) {
                    //3. Customer get item
                    List<CartItem> items = cart.getCartItems();
                    if (items != null) {

                        result = cart.removeServiceFromCart(patientId);
                    }
                    if (result) {
                        session.setAttribute("CART", cart);
                        //Remove trong Cart View Model
                        CartViewModel deleteViewModel = null;
                        for (CartViewModel viewModel : listCartViewModel) {
                            if (Integer.parseInt(viewModel.getPatientDTO().getPatientID()) == patientId) {
                                deleteViewModel = viewModel;
                            }
                        }
                        listCartViewModel.remove(deleteViewModel);
                        session.setAttribute("CART_VIEW_MODEL", listCartViewModel);
                        response.sendRedirect(url);
                    }
                }
            }
        } catch (IOException | NumberFormatException ex) {
            log("Error at RemoveServiceFromCartServlet " + ex.getMessage());
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
