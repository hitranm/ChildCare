/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblPatient.PatientError;
import web.utils.DateValidator;
import web.utils.DateValidatorUsingDateFormat;

/**
 *
 * @author nguye
 */
public class UpdatePatientProfileByIDServlet extends HttpServlet {

    private static final String SUCCESS = "ViewPatientProfileServlet";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "LoadPatientProfileByIDServlet";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String idURL = "?id=" + request.getParameter("txtID");

        try {
            String id = request.getParameter("txtID");
            String name = request.getParameter("txtName");
            String gender = request.getParameter("txtGender");
            String txtYear = request.getParameter("txtYear");
            String txtMonth = request.getParameter("txtMonth");
            String txtDay = request.getParameter("txtDay");

            String birthday = txtYear + "-" + txtMonth + "-" + txtDay;
            boolean valid = true;
            PatientError errorObj = new PatientError();
            DateValidator validator = new DateValidatorUsingDateFormat("dd/MM/yyyy");

            if (!validator.isValid(birthday)) {
                errorObj.setBirthdayError("Sai thông tin về ngày tháng năm sinh. Vui lòng kiểm tra lại");
                valid = false;
            }
            PatientDAO dao = new PatientDAO();
//            if (dao.getUserByID(userID) != null) {
//                errorObj.setIdError("This User ID is existed. Choose another one");
//                valid = false;
//            }
            HttpSession session = request.getSession();
            String customerID = (String) session.getAttribute("CUSTOMER_ID");
            PatientDTO patient = new PatientDTO(id, name, gender, birthday, customerID);
            if (valid) {
                if (dao.update(patient)) {
                    url = SUCCESS;
                    idURL = "";
                    response.sendRedirect(url);

                } else {
                    request.setAttribute("ERROR", "Update failed, cannot find the User ID: " + id + ", please go back and try again");
                    request.getRequestDispatcher(url).forward(request, response);

                }
            } else {
                url = INVALID + "?id=" + id;
                request.setAttribute("INVALID", errorObj);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (Exception e) {
            log("ERROR at UpdateUserController: " + e.getMessage());
            e.printStackTrace();
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
