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
import web.tblCustomer.CustomerDAO;
import web.tblCustomer.CustomerDTO;
import web.tblCustomer.CustomerError;
import web.tblIdentity.IdentityDAO;
import web.tblIdentity.IdentityDTO;
import web.tblIdentity.IdentityError;

/**
 *
 * @author Admin
 */
public class AddCustomerServlet extends HttpServlet {
private static final String ERROR="register.jsp";
private static final String SUCCESS="login.jsp";
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
       String url=ERROR;
       try{
           String fullName= request.getParameter("fullName");
           String email= request.getParameter("email");
           String address= request.getParameter("address");
           String phoneNum= request.getParameter("phoneNum");
           String password = request.getParameter("password");
           String cpassword= request.getParameter("cpassword");
           String birthday = request.getParameter("birthday");
           String citizenID= request.getParameter("citizenID");
           String roleID= request.getParameter("roleID");
           CustomerDAO dao= new CustomerDAO();
           CustomerError error= new CustomerError();
           IdentityError error1= new IdentityError();
           boolean check= dao.checkPassword(password, cpassword);
           boolean check2= dao.checkEmail(email);
           if(!check){
               error.setPasswordError("Password and Confirm password are unmatch!!");
               request.setAttribute("ERROR", error);         
           } else{
           boolean check1 = dao.checkCitizenID(citizenID);
           if(check1){
               error.setCitizenIDError("Citizen has been used!!");
               request.setAttribute("ERROR", error);
       }
           if(check2){
               error.setEmailError("Email has been used!!");
               request.setAttribute("ERROR", error);
           }
           
           else {
               IdentityDAO dao1= new IdentityDAO();
               String epassword= dao1.sha256(password);
               boolean check3= dao1.checkPhoneNum(phoneNum);
               if(check3){
                   error1.setPhoneNumError("Phone Number has been used!!");
                   request.setAttribute("ERROR1", error1);
               }else {
               IdentityDTO identity= new IdentityDTO(phoneNum, epassword, roleID);
               dao1.addIdentity(identity);
               String identityID = dao1.queryID(phoneNum);
               CustomerDTO cus= new CustomerDTO(identityID, fullName, email, address, birthday, citizenID);
               dao.addCustomer(cus);
               url=SUCCESS;
                     }
                 }
       }
       }
       catch(Exception e){
       log("Error at CreateController: "+ e.toString());
       } finally{
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
