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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogDTO;
import web.models.tblStaff.StaffDAO;

/**
 *
 * @author DELL
 */
public class LoadBlogServlet extends HttpServlet {

    private final String UPDATE_BLOG = "updateBlog.jsp";
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
        String blogID = request.getParameter("id");
        String url = ERROR;
        try {
            String role = (String) session.getAttribute("ROLEID");
            String identityID = (String) session.getAttribute("IDENTITY_ID");
            StaffDAO staffDAO = new StaffDAO();
            String staffID = staffDAO.queryStaff(identityID);
            BlogDAO dao = new BlogDAO();
            BlogDTO blog = dao.getBlogDetail(blogID);
            String authorID = blog.getAuthorID();
            if (role == null) {
                request.setAttribute("DID_LOGIN", "Bạn cần đăng nhập để thực hiện thao tác này");
                url = LOGIN;
            } else if (!staffID.equals(authorID)) {
                url = DENY;
            } else {
                request.setAttribute("BLOG", blog);
                url = UPDATE_BLOG;
            }

        } catch (NamingException ex) {
            log("LoadBlogServlet _ Naming: " + ex.getMessage());
            url = ERROR;
        } catch (SQLException ex) {
            log("LoadBlogServlet _ SQL: " + ex.getMessage());
            url = ERROR;
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
