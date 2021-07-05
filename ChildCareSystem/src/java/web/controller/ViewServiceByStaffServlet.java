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
import javax.servlet.http.HttpSession;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;

/**
 *
 * @author DELL
 */
public class ViewServiceByStaffServlet extends HttpServlet {

    private final String VIEW_SERVICE = "serviceDashboard.jsp";
    private final String ERROR = "systemError.html";

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
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        String url = VIEW_SERVICE;
        StaffDAO staffDAO = new StaffDAO();
        ServiceDAO serviceDAO = new ServiceDAO();
        try {
            if (session != null) {
                String identityID = (String) session.getAttribute("IDENTITY_ID");
                StaffDTO staff = staffDAO.queryStaffByIdentityId(identityID);
                String staffID = staff.getStaffID();
                serviceDAO.getServicebyStaff(staffID);
                List<ServiceDTO> service = serviceDAO.getServiceList();
                request.setAttribute("SERVICE_LIST", service);

                int activeServiceCount = serviceDAO.countServiceActive();
                request.setAttribute("ACTIVE_SERVICE", activeServiceCount);
                int allServiceCount = serviceDAO.countAllService();
                request.setAttribute("ALL_SERVICE", allServiceCount);
                String topServiceCount = serviceDAO.countMostUseService();
                request.setAttribute("POPULAR_SERVICE", topServiceCount);
            }
        } catch (NamingException | SQLException ex) {
            log("ViewServiceByStaffServlet: " + ex.getMessage());
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
