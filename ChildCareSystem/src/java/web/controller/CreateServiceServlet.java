/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import web.models.tblService.CreateServiceError;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;

/**
 *
 * @author HOANGKHOI
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class CreateServiceServlet extends HttpServlet {

    private static final String VIEW_SERVICE = "xem-dich-vu-cua-nhan-vien";//"ViewServiceByStaffServlet";
    private static final String CREATE_SERVICE_PAGE = "createService.jsp";
    private static final String ERROR_PAGE = "systemError.html";
    private static final String UPLOAD_DIR = "images/service";

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String url = ERROR_PAGE;
        boolean foundError = false;
        CreateServiceError createServiceErr = new CreateServiceError();

        // Get form parameters
        String serviceName = request.getParameter("txtTitle");
        String specialtyId = request.getParameter("cboSpecialty");
        String description = request.getParameter("txtServiceContent");
        double price = 0;
        try {
            price = Double.parseDouble(request.getParameter("txtPrice"));
        } catch (NumberFormatException ex) {
            foundError = true;
            createServiceErr.setPriceFormat("Vui lòng nhập số cho giá của dịch vụ.");
        }

        String thumbnail = uploadFile(request);
        try {
            //Validate field
            if (serviceName.trim().length() == 0 || serviceName.trim().length() > 100) {
                foundError = true;
                createServiceErr.setTitleLengthError("Tiêu đề không được để trống và có nhiều nhất 100 kí tự.");
            }

            if (description.trim().length() == 0 || description.trim().length() > 300) {
                foundError = true;
                createServiceErr.setDescriptionLengthError("Nội dung không được để trống và có nhiều nhất 300 kí tự.");
            }
            if (thumbnail.trim().isEmpty()) {
                foundError = true;
                createServiceErr.setImageError("Vui lòng tải ảnh lên");
            }
            if (foundError) {
                url = CREATE_SERVICE_PAGE;
                request.setAttribute("CREATE_SERVICE_ERROR", createServiceErr);
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                //Get identity from session
                String identityId = (String) session.getAttribute("IDENTITY_ID");
                String roleID = (String) session.getAttribute("ROLEID");
                ServiceDAO serviceDAO = new ServiceDAO();
                boolean result;
                if (roleID.equals("3")) {
                    ServiceDTO serviceDTO = new ServiceDTO(serviceName, specialtyId,
                            thumbnail, description, price, "1",
                            identityId, LocalDateTime.now().toString(), LocalDateTime.now().toString());
                    result = serviceDAO.createServicebyManager(serviceDTO);
                } else {
                    ServiceDTO serviceDTO = new ServiceDTO(serviceName, specialtyId,
                            thumbnail, description, price, "0",
                            identityId, LocalDateTime.now().toString(), LocalDateTime.now().toString());
                    result = serviceDAO.AddNewService(serviceDTO);
                }
                // Process to add new service
                if (result) {
                    url = VIEW_SERVICE;
                } else {
                    url = ERROR_PAGE;
                }
                response.sendRedirect(url);
            }
        } catch (NamingException | SQLException ex) {
            log("Error at CreateServiceServlet: " + ex.getMessage());
        } finally {
            out.close();
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName;
        try {
            Part filePart = request.getPart("fImage");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            int end = applicationPath.lastIndexOf("build");
            String truePath = applicationPath.substring(0, end) + "web";
            String basePath = truePath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
