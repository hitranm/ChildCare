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
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogDTO;

/**
 *
 * @author DELL
 */
public class SearchBlogServlet extends HttpServlet {

    private final String SEARCH_PAGE = "searchBlog.jsp";
    private final String ERROR_PAGE = "systemError.html";
    private final String VIEW_BLOG = "bai-viet?trang=1";

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
        String searchValue = request.getParameter("txtSearchBlog");
        String url = SEARCH_PAGE;
        try {
            if (searchValue.trim().length() > 0) {
                BlogDAO dao = new BlogDAO();
                int count = dao.countSearch(searchValue);
                int pageSize = 5;
                int endPage = count / pageSize;
                if (count % pageSize != 0) {
                    endPage++;
                }
                request.setAttribute("PAGE", endPage);
                String indexString = request.getParameter("idx");
                int index = Integer.parseInt(indexString);
                dao.searchBlog(searchValue, index);
                List<BlogDTO> list = dao.getBlogList();
                request.setAttribute("SEARCH_LIST", list);
            } else {
                url = VIEW_BLOG;
            }
        } catch (NamingException ex) {
            log("SearchBlogServlet _ Naming: " + ex.getMessage());
            url = ERROR_PAGE;
        } catch (SQLException ex) {
            log("SearchBlogServlet _ SQL: " + ex.getMessage());
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
