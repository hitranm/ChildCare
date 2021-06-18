/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.tblAdmin.AdminDAO;
import web.models.tblAdmin.AdminDTO;
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogDTO;
import web.models.tblCustomer.CustomerDAO;
import web.models.tblCustomer.CustomerDTO;
import web.models.tblIdentity.IdentityDAO;
import web.models.tblIdentity.IdentityDTO;
import web.models.tblManager.ManagerDAO;
import web.models.tblManager.ManagerDTO;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;

import web.models.tblStaff.StaffDAO;
import web.models.tblStaff.StaffDTO;

/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

    private static final String SUCCESS = "StartupServlet";
    private static final String ERROR = "login.jsp";

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
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            IdentityDAO dao = new IdentityDAO();
            String epassword = dao.sha256(password);
            CustomerDAO customerDAO = new CustomerDAO();
            ManagerDAO managerDAO = new ManagerDAO();
            StaffDAO staffDAO = new StaffDAO();
            AdminDAO adminDAO = new AdminDAO();
            IdentityDTO identity = dao.checkLogin(email, epassword);

//            BlogDAO blogDAO = new BlogDAO();
//            List<BlogDTO> listBlog = blogDAO.getTop6BlogList();
//
//            ServiceDAO serviceDAO = new ServiceDAO();
//            List<ServiceDTO> listService = serviceDAO.getTop3ServiceList();

            HttpSession session = request.getSession();

//            session.setAttribute("BLOG_LIST_TOP6", listBlog);
//            session.setAttribute("SERVICE_LIST_TOP3", listService);

            if (identity != null) {
                if (identity.getRoleID().equals("3")) {
                    ManagerDTO dto = new ManagerDTO();
                    dto = managerDAO.queryManagerByIdentityId(identity.getIdentityID());
                    session.setAttribute("LOGIN_USER", dto);
                    session.setAttribute("IDENTITY_ID", identity.getIdentityID());
                    session.setAttribute("ROLE", "manager");
                    url = SUCCESS;
                }
                if (identity.getRoleID().equals("2")) {
                    StaffDTO dto = staffDAO.queryStaffByIdentityId(identity.getIdentityID());
                    session.setAttribute("LOGIN_USER", dto);
                    session.setAttribute("IDENTITY_ID", identity.getIdentityID());
                    session.setAttribute("ROLE", "staff");
                    url = SUCCESS;
                }
                if (identity.getRoleID().equals("1")) {
                    CustomerDTO dto = customerDAO.queryCustomerByIdentityId(identity.getIdentityID());
                    session.setAttribute("LOGIN_USER", dto);
                    session.setAttribute("IDENTITY_ID", identity.getIdentityID());
                    session.setAttribute("CUSTOMER_ID", customerDAO.queryCustomerID(email));
                    session.setAttribute("ROLE", "customer");
                    url = SUCCESS;
                }
                if (identity.getRoleID().equals("4")) {
                    AdminDTO dto = adminDAO.queryAdminByIdentityId(identity.getIdentityID());
                    session.setAttribute("LOGIN_USER", dto);
                    session.setAttribute("IDENTITY_ID", identity.getIdentityID());
                    session.setAttribute("ROLE", "admin");
                    url = SUCCESS;
                }

            } else {
                String msg = "Email hoặc mật khẩu không chính xác!";
                request.setAttribute("Message", msg);
            }
        } catch (Exception e) {
            log("Error at LoginServlet:" + e.toString());
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
