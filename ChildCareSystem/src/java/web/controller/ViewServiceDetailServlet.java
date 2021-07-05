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
import web.models.tblFeedback.FeedbackDAO;
import web.models.tblFeedback.FeedbackDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;
import web.models.tblStaff.StaffDAO;

/**
 *
 * @author DELL
 */
public class ViewServiceDetailServlet extends HttpServlet {

    private final String SERVICE_DETAIL_PAGE = "serviceDetail.jsp";
    private final String ERROR_PAGE = "systemError.html";
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String serviceID = request.getParameter("id");
        String url = SERVICE_DETAIL_PAGE;
        try {
            String role = (String) session.getAttribute("ROLEID");
            String identityID = (String) session.getAttribute("IDENTITY_ID");
            StaffDAO staffDAO = new StaffDAO();
            String staffID = staffDAO.queryStaff(identityID);
            ServiceDAO dao = new ServiceDAO();
            ServiceDTO service = dao.getServiceDetail(serviceID);
            String authorID = service.getCreatePersonId();
            String statusID = service.getStatusId();
            if (role == null) {
                request.setAttribute("DID_LOGIN", "Bạn cần đăng nhập để thực hiện thao tác này");
                url = LOGIN;
            } else if ("1".equals(statusID) || "3".equals(role) || staffID.equals(authorID)) {
                FeedbackDAO feedbackDAO = new FeedbackDAO();
                List<FeedbackDTO> feedbackList = feedbackDAO.getFeedbackByServiceId(Integer.parseInt(serviceID), 3);
                if (!feedbackList.isEmpty()) {
                    request.setAttribute("FEEDBACK_LIST", feedbackList);
                }
                request.setAttribute("SERVICE_DETAIL", service);
                request.setAttribute("STAFFID", staffID);
                url = SERVICE_DETAIL_PAGE;
            } else {
                url = DENY;
            }
        } catch (NamingException ex) {
            log("ViewServiceDetailServlet _ Naming: " + ex.getMessage());
            url = ERROR_PAGE;
        } catch (SQLException ex) {
            log("ViewServiceDetailServlet _ SQL: " + ex.getMessage());
            url = ERROR_PAGE;
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
