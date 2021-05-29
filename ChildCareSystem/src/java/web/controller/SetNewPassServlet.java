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
import web.models.tblIdentity.IdentityDAO;

/**
 *
 * @author Admin
 */
public class SetNewPassServlet extends HttpServlet {
private static final String ERROR="newpassword.jsp";
private static final String SUCCESS="login.jsp";
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
        String url=ERROR;
        try{
            String password= request.getParameter("password");
            String cpassword= request.getParameter("cpassword");
            String phoneNum= request.getParameter("phoneNum");
            if(password.equals(cpassword)){
                
            IdentityDAO dao= new IdentityDAO();
             String epass = dao.sha256(password);
             boolean check = dao.updatePass(epass, phoneNum);
             if(check){
                 url=SUCCESS;
             }
            }
             else{
                 String msg="Mật khẩu và mật khẩu xác nhận không trùng khớp!";
                request.setAttribute("ERROR_PASS", msg);
             }
        }catch(Exception e){
            log("Error at SetNewPassServlet: "+e.toString());
        }
        finally{
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
