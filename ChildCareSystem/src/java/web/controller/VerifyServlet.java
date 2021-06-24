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
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblIdentity.IdentityDTO;

/**
 *
 * @author Admin
 */
public class VerifyServlet extends HttpServlet {

    private static final String ERROR = "verify.jsp";
    private static final String SUCCESS = "StartupServlet";

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
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            //CustomerDTO cus = (CustomerDTO) session.getAttribute("authcode");
            String verifyCode = (String) session.getAttribute("authcode");
            String code = request.getParameter("authcode");
            if (code.equals(verifyCode)) {
                url = SUCCESS;
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String phoneNum = request.getParameter("phoneNum");
                String password = request.getParameter("password");
                String birthday = request.getParameter("birthday");
                String citizenID = request.getParameter("citizenID");
                String roleID = request.getParameter("roleID");

                IdentityDAO identityDAO = new IdentityDAO();
                CustomerDAO customerDAO = new CustomerDAO();
                String epassword = identityDAO.sha256(password);
                IdentityDTO identity = new IdentityDTO(email, epassword, roleID);
                boolean resultAddIdentity = identityDAO.addIdentity(identity);
                if (resultAddIdentity) {
                    String identityID = identityDAO.queryIDByEmail(email);
                    CustomerDTO cus1 = new CustomerDTO(identityID, fullName, phoneNum, address, birthday, citizenID);
                    boolean flag1 = customerDAO.addCustomer(cus1);
                    if (flag1) {
                        session.setAttribute("LOGIN_USER", cus1);
                        session.setAttribute("IDENTITY_ID", identityID);
                        session.setAttribute("CUSTOMER_ID", customerDAO.queryCustomerID(email));
                        session.setAttribute("ROLE", "customer");
                    }
                }
            } else {
                String msg = "Mã số xác thực không đúng vui lòng kiểm tra lại";
                request.setAttribute("WRONG_CODE", msg);
            }
        } catch (Exception e) {
            log("Error at VerifyServlet: " + e.toString());
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
