/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblPatient.PatientDAO;
import web.models.tblPatient.PatientDTO;
import web.models.tblPatient.PatientError;

/**
 *
 * @author nguye
 */
public class AddNewPatientProfileServlet extends HttpServlet {

    private static final String SUCCESS = "ViewPatientProfileServlet";
    private static final String ERROR = "error.jsp";
    private static final String INVALID = "addNewPatient.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("txtName");
            String gender = request.getParameter("txtGender");
            String birthday = request.getParameter("txtBirthday");

            boolean valid = true;
            PatientError errorObj = new PatientError();
            if (name.trim().isEmpty()) {
                errorObj.setPatientNameError("Patient Name is not supposed to be empty");
                valid = false;
            }
            if (gender.trim().isEmpty()) {
                errorObj.setGenderError("Patient Gender is not supposed to be empty");
                valid = false;
            }
            if (birthday.trim().isEmpty()) {
                errorObj.setBirthdayError("Patient Birthday is not supposed to be empty");
                valid = false;
            }
            PatientDAO dao = new PatientDAO();
//            if (dao.getCategoryByID(id) != null) {
//                errorObj.setIdError("This Category ID is existed. Choose another one");
//                valid = false;
//            }
            HttpSession session = request.getSession();
            String customerID = (String) session.getAttribute("CUSTOMER_ID");
            System.out.println(customerID);
            PatientDTO patient = new PatientDTO(name, gender, birthday, customerID);
            if (valid) {
                if (dao.addPatient(patient)) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Insert failed, please go back and try again");
                }
            } else {
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
            }
        } catch (ClassNotFoundException | SQLException e) {
            log("ERROR at AddNewPatientServlet: " + e.getMessage());
            e.printStackTrace();
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
