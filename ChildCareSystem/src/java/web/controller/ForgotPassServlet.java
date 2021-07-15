/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblIdentity.IdentityDAO;
import web.utils.SendEmail;

/**
 *
 * @author Admin
 */
public class ForgotPassServlet extends HttpServlet {

    private static final String ERROR = "forgot_pass.jsp";
    private static final String SUCCESS = "verify_pass_forgot.jsp";

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
        String url = ERROR;
        request.setCharacterEncoding("UTF-8");
        try {
           String email = request.getParameter("email");
           IdentityDAO dao = new IdentityDAO();
           HttpSession session = request.getSession();
           boolean check = dao.checkDuplicatedEmail(email);
            if (check) {
                SendEmail sm = new SendEmail();
                String code = sm.getRandom();
           //     CustomerDTO cus = new CustomerDTO(email, code);
                boolean test = sm.sendEmail(code, email);

                //check if the email send successfully
                if (test) {
                    session.setAttribute("authcode", code);
                    url = SUCCESS;
                }
            } else {
                String msg = "Email hoặc số điện thoại chưa được đăng ký";
                request.setAttribute("ERROR_EMAIL", msg);
            }

        } catch (Exception e) {
            log("Error at ForgotPassServlet: " + e.toString());
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
