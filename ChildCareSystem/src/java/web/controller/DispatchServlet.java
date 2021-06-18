/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HOANGKHOI
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class DispatchServlet extends HttpServlet {

    private static final String HOME_PAGE = "StartupServlet";
    private static final String ADD = "AddCustomerServlet";
    private static final String LOGIN = "LoginServlet";
    private static final String LOGOUT = "LogOutServlet";
    private static final String ERROR = "error.jsp";
    private static final String VERIFY = "VerifyServlet";
    private static final String FORGOT = "ForgotPassServlet";
    private static final String RESETPASSWORD = "ResetPassServlet";
    private static final String SETNEWPASSWORD = "SetNewPassServlet";
    private static final String ADDNEWPATIENT = "AddNewPatientProfileServlet";
    private static final String UPDATEPATIENTPROFILE = "UpdatePatientProfileByIDServlet";
    private static final String ADD_STAFF = "AddStaffServlet";
    private static final String CREATE_BLOG = "CreateBlogServlet";
    private static final String VIEW_BLOG = "ViewBlogServlet";
    private static final String UPDATEPROFILE = "UpdateProfileServlet";
    private static final String EDIT_BLOG = "UpdateBlogServlet";
    private static final String SEARCH_BLOG = "SearchBlogServlet";
    private static final String LOAD_SPECIALTY = "LoadSpecialtyListServlet";
    private static final String VIEW_USER_PROFILE = "ViewUserProfileServlet";
    private static final String CREATE_SERVICE = "CreateServiceServlet";
    private static final String VIEW_ACCOUNT = "ViewAccountsServlet";
    private static final String VIEW_DETAILS = "ViewAccountDetailsServlet";
    private static final String UPDATE_DETAILS = "UpdateAccountDetailsServlet";
    private static final String DELETE_ACCOUNT = "DeleteAccountServlet";

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
        String url = ERROR;
        String button = request.getParameter("btAction");

        try {

            if (button == null) {
                url = HOME_PAGE;
            } else if (button.equalsIgnoreCase("Login")) {
                url = LOGIN;
            } else if (button.equalsIgnoreCase("Register")) {
                url = ADD;
            } else if (button.equalsIgnoreCase("LogOut")) {
                url = LOGOUT;
            } else if (button.equalsIgnoreCase("Verify")) {
                url = VERIFY;
            } else if (button.equalsIgnoreCase("VerifyPass")) {
                url = RESETPASSWORD;
            } else if (button.equalsIgnoreCase("ResetPass")) {
                url = SETNEWPASSWORD;
            } else if (button.equalsIgnoreCase("Forgot")) {
                url = FORGOT;
            } else if (button.equalsIgnoreCase("AddNewPatientProfile")) {
                url = ADDNEWPATIENT;
            } else if (button.equalsIgnoreCase("UpdatePatientProfile")) {
                url = UPDATEPATIENTPROFILE;
            } else if (button.equalsIgnoreCase("AddStaff")) {
                url = ADD_STAFF;
            } else if (button.equalsIgnoreCase("CreateBlog")) {
                url = CREATE_BLOG;
            } else if (button.equalsIgnoreCase("ViewBlog")) {
                url = VIEW_BLOG;
            } else if (button.equalsIgnoreCase("UpdateProfile")) {
                url = UPDATEPROFILE;
            } else if (button.equalsIgnoreCase("UpdateBlog")) {
                url = EDIT_BLOG;
            } else if (button.equalsIgnoreCase("LoadSpecialty")) {
                url = LOAD_SPECIALTY;
            } else if (button.equalsIgnoreCase("ViewUserProfile")) {
                url = VIEW_USER_PROFILE;
            } else if (button.equalsIgnoreCase("CreateService")) {
                url = CREATE_SERVICE;
            } else if (button.equalsIgnoreCase("ViewAccount")) {
                url = VIEW_ACCOUNT;
            } else if (button.equalsIgnoreCase("ViewDetails")) {
                url = VIEW_DETAILS;
            } else if (button.equalsIgnoreCase("UpdateDetails")) {
                url = UPDATE_DETAILS;
            } else if (button.equalsIgnoreCase("DeleteAccount")) {
                url = DELETE_ACCOUNT;
            }
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
