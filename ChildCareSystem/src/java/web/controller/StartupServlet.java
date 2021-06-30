/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblSystemSetting.SystemSettingDAO;
import web.models.tblSystemSetting.SystemSettingDTO;

/**
 *
 * @author nguye
 */
public class StartupServlet extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String HOME_PAGE = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            SystemSettingDAO systemDAO = new SystemSettingDAO();
            BlogDAO blogDAO = new BlogDAO();
            int numberOfBlogView =Integer.parseInt(systemDAO.getSettingByName("Max Blog Post On Homepage").getSettingValue());
            List<BlogDTO> listBlog = blogDAO.getTopXBlogList(numberOfBlogView);

            ServiceDAO serviceDAO = new ServiceDAO();
            int numberOfServiceView =Integer.parseInt(systemDAO.getSettingByName("Max Service Post On Homepage").getSettingValue());
            List<ServiceDTO> listService = serviceDAO.getTopXServiceList(numberOfServiceView);

            HttpSession session = request.getSession();
            session.removeAttribute("BLOG_LIST_VIEW");
            session.removeAttribute("SERVICE_LIST_VIEW");
            session.setAttribute("BLOG_LIST_VIEW", listBlog);
            session.setAttribute("SERVICE_LIST_VIEW", listService);
            url = HOME_PAGE;
        } catch (SQLException | NamingException ex) {
            log("Error at StartupServelt: " + ex.getMessage());
        } finally {
//            request.getRequestDispatcher(url).forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StartupServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(StartupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(StartupServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(StartupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
