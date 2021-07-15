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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblReservation.ReservationDAO;
import web.models.tblReservation.ReservationDTO;
import web.models.tblStaff.StaffDAO;

/**
 *
 * @author Admin
 */
public class ViewReservationStaffServlet extends HttpServlet {

    private static final String VIEW_RESERVATION = "reservationdashboard.jsp";

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
        String url = VIEW_RESERVATION;
        HttpSession session = request.getSession();

        try {
            if (session.getAttribute("ROLE") == null) {
                request.setAttribute("DID_LOGIN", "Bạn cần đăng nhập để thực hiện thao tác này");
                url = "login.jsp";
            } else if (session.getAttribute("ROLE") != "staff") {
                url = "accessDenied.jsp";
            } else {
                ReservationDAO reservationDAO = new ReservationDAO();
                String identityID = (String) session.getAttribute("IDENTITY_ID");
                StaffDAO dao = new StaffDAO();
                String staffID = dao.queryStaff(identityID);
                List<ReservationDTO> listReservation = reservationDAO.getReservationByStaffID(staffID);
                request.setAttribute("ListReservation", listReservation);
                List<ReservationDTO> listReservationMorning = reservationDAO.getReservationByIntervalTimeIDForStaff(1, 4, staffID);
                request.setAttribute("ListMorning", listReservationMorning);
                List<ReservationDTO> listReservationNoon = reservationDAO.getReservationByIntervalTimeIDForStaff(5, 7, staffID);
                request.setAttribute("ListNoon", listReservationNoon);
                int allRes = reservationDAO.countAllRes();
                request.setAttribute("ALL_RES", allRes);
                int monthlyRes = reservationDAO.countMonthlyRes();
                request.setAttribute("MONTHLY_RES", monthlyRes);
                int weeklyRes = reservationDAO.countWeeklyRes();
                request.setAttribute("WEEKLY_RES", weeklyRes);
            }
        } catch (SQLException | NamingException e) {
            log("ERROR at ViewReservationStaffServlet: " + e.getMessage());
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
