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

/**
 *
 * @author HOANGKHOI
 */
public class DispatchServlet extends HttpServlet {
private static final String ADD="AddCustomerServlet";
private static final String LOGIN="LoginServlet";
private static final String LOGOUT="LogOutServlet";
private static final String ERROR="error.jsp";
private static final String VERIFY="VerifyServlet";
private static final String FORGOT="ForgotPassServlet";
private static final String RESETPASSWORD="ResetPassServlet";
private static final String SETNEWPASSWORD="SetNewPassServlet";
private static final String ADDNEWPATIENT="AddNewPatientProfileServlet";
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
        String url = ERROR;
        try {
            String button = request.getParameter("btAction");
            if (button.equalsIgnoreCase("Login") ) {
                url= LOGIN;
            }
            else if(button.equalsIgnoreCase("Register") ) {
                url= ADD;
            }
            else if(button.equalsIgnoreCase("LogOut")){
                url=LOGOUT;
            }
            else if(button.equalsIgnoreCase("Verify")){
                url=VERIFY;
            }
            else if(button.equalsIgnoreCase("VerifyPass")){
                url=RESETPASSWORD;
            }
            else if(button.equalsIgnoreCase("ResetPass")){
                url=SETNEWPASSWORD;
            }
            else if(button.equalsIgnoreCase("Forgot")){
                url=FORGOT;
            }
            else if (button.equalsIgnoreCase("AddNewPatientProfile")) {
                url=ADDNEWPATIENT;
            }
            
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
