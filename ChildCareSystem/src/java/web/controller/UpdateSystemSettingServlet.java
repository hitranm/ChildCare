/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.models.tblSystemSetting.SystemSettingDAO;

/**
 *
 * @author nguye
 */
public class UpdateSystemSettingServlet extends HttpServlet {

    private static final String SUCCESS = "ViewSystemSettingServlet";
    private static final String ERROR = "systemError.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;

        try {
            String id = request.getParameter("txtID");
            String value = request.getParameter("txtValue");
            boolean valid = true;
            String regex = "^[0-9]{1,2}$";
            if (value.matches(regex)) {
                int valueCheck = Integer.parseInt(value);
                if (valueCheck <= 1 || valueCheck >= 15) {
                    valid = false;
                }
            } else {
                valid = false;
            }
            SystemSettingDAO dao = new SystemSettingDAO();
            if (valid) {
                if (dao.updateSystemSetting(value, id)) {
                    url = SUCCESS;
                    request.setAttribute("UPDATE_SETTING", "Đã cập nhật thành công");
                    request.getRequestDispatcher(url).forward(request, response);

                } else {
                    request.setAttribute("ERROR", "Update failed, cannot find the Setting ID: " + id + ", please go back and try again");
                    request.setAttribute("UPDATE_SETTING", "Cập nhật thất bại, vui lòng thử lại");
                    request.getRequestDispatcher(url).forward(request, response);

                }
            } else {
                url = SUCCESS;
                request.setAttribute("UPDATE_SETTING", "Vui lòng nhập giá trị từ 2 tới 12 ");
                request.getRequestDispatcher(url).forward(request, response);
            }

        } catch (IOException | NumberFormatException | SQLException | NamingException | ServletException e) {
            log("ERROR at UpdateSystemSettingServlet: " + e.getMessage());
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
