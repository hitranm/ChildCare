/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblStaff.StaffDAO;

/**
 *
 * @author DELL
 */
public class DeleteServiceServlet extends HttpServlet {

    private final String VIEW_SERVICE = "ViewServiceListServlet?index=1";
    private final String ERROR = "systemError.html";
    private final String DENY = "accessDenied.jsp";
    private final String LOGIN = "login.jsp";

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String serviceID = request.getParameter("id");
        String url = ERROR;
        try {
            String role = (String) session.getAttribute("ROLEID");
            String identityID = (String) session.getAttribute("IDENTITY_ID");
            ServiceDAO dao = new ServiceDAO();
            ServiceDTO dto = dao.getServiceDetail(serviceID);
            String authorID = dto.getCreatePersonId();
            if (role == null) {
                request.setAttribute("DID_LOGIN", "Bạn cần đăng nhập để thực hiện thao tác này");
                url = LOGIN;
            } else if (identityID.equals(authorID) || "3".equals(role)) {
                boolean result = dao.deleteService(serviceID);
                if (result) {
                    url = VIEW_SERVICE;
                } else {
                    url = ERROR;
                }
            } else {
                url = DENY;
            }
        } catch (NamingException ex) {
            log("DeleteServiceServlet _ Naming: " + ex.getMessage());
            url = ERROR;
        } catch (SQLException ex) {
            log("DeleteServiceServlet _ SQL: " + ex.getMessage());
            url = ERROR;
        } finally {
            response.sendRedirect(url);
            out.close();
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
