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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;

/**
 *
 * @author DELL
 */
public class SearchServiceServlet extends HttpServlet {

    private final String SEARCH_PAGE = "searchService.jsp";
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
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String searchValue = request.getParameter("txtSearchService");
        String url = SEARCH_PAGE;
        try {
            if (searchValue.trim().length() > 0) {
                ServiceDAO dao = new ServiceDAO();
                int count = dao.countSearch(searchValue);
                int pageSize = 5;
                int endPage = count / pageSize;
                if (count % pageSize != 0) {
                    endPage++;
                }
                request.setAttribute("END_PAGE", endPage);
                String indexString = request.getParameter("idx");
                int index = Integer.parseInt(indexString);
                dao.searchService(searchValue, index);
                List<ServiceDTO> list = dao.getServiceList();
                request.setAttribute("SEARCH_LIST", list);
                request.setAttribute("SEARCH_VAR", searchValue);
            }
        } catch (SQLException ex) {
            log("SearchServiceServlet _ SQL: " + ex.getMessage());
            url = ERROR_PAGE;
        } catch (NamingException ex) {
            log("SearchServiceServlet _ Naming: " + ex.getMessage());
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
