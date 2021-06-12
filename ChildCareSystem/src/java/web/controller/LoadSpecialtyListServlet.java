/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.models.tblSpecialty.SpecialtyDAO;
import web.models.tblSpecialty.SpecialtyDTO;

/**
 *
 * @author HOANGKHOI
 */
public class LoadSpecialtyListServlet extends HttpServlet {
    private final String CREATE_STAFF_PAGE = "createStaff.jsp";
    private final String CREATE_SERVVICE_PAGE = "createService.jsp";
    private final String ERROR_PAGE = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("view");
        String url  = "";
//        if (action.equalsIgnoreCase("CreateStaff")) {
//            url = CREATE_STAFF_PAGE;
//        } else if (action.equalsIgnoreCase("CreateService")) {
//            url = CREATE_SERVVICE_PAGE;
//        }
         url = CREATE_SERVVICE_PAGE;
        
        try {
            SpecialtyDAO specialtyDAO = new SpecialtyDAO();
            specialtyDAO.displaySpecialtyList();
            List<SpecialtyDTO> specialtyList = specialtyDAO.getListSpecialty();
            request.setAttribute("SPECIALTY_LIST", specialtyList);
        } catch (Exception e) {
            log("Error at LoadSpecialtyListServlet:" + e.toString());
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
