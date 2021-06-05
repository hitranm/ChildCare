/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogError;
import web.models.tblBlogCategory.BlogCategoryDAO;
import web.models.tblBlogCategory.BlogCategoryDTO;
import web.models.tblStaff.StaffDAO;

/**
 *
 * @author DELL
 */
public class CreateBlogServlet extends HttpServlet {

    private final String VIEWBLOG = "ViewBlogServlet?index=1";
    private final String ERROR_PAGE = "error.jsp";

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String url = ERROR_PAGE;
        String title = request.getParameter("txtTitle");
        String body = request.getParameter("txtBody");
        String categoryID = request.getParameter("category");
        //String authorID = "200001";
        String authorID;
        BlogError err = new BlogError();
        boolean foundErr = false;
        try {
            if (title.trim().isEmpty()) {
                foundErr = true;
                err.setTitleLengthErr("Bạn không được để trống Tiêu đề!");
            }
            if (body.trim().isEmpty()) {
                foundErr = true;
                err.setDescriptionErr("Bạn không được để trống Nội dụng!");
            }
            if (foundErr) {
                request.setAttribute("CREATE_ERROR", err);
            } else {
                BlogDAO dao = new BlogDAO();
                if (session != null) {
                    String identityID = (String) session.getAttribute("IDENTITY_ID");
                    StaffDAO staffDAO = new StaffDAO();
                    authorID = staffDAO.queryStaff(identityID);
                    boolean result = dao.createBlog(title, authorID, body, categoryID);
                    if (result) {
                        url = VIEWBLOG;
                    }
                }
            }
        } catch (SQLException ex) {
            log("CreateNewAccountServlet _ SQL: " + ex.getMessage());
            url = ERROR_PAGE;
        } catch (NamingException ex) {
            log("CreateNewAccountServlet _ Naming: " + ex.getMessage());
            url = ERROR_PAGE;
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
