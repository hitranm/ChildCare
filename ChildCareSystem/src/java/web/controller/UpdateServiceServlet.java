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
import javax.servlet.http.Part;
import web.models.tblService.CreateServiceError;
import web.models.tblService.ServiceDAO;
import web.models.tblService.ServiceDTO;

/**
 *
 * @author DELL
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class UpdateServiceServlet extends HttpServlet {
    
    private final String VIEW_SERVICE = "chi-tiet-dich-vu";//ViewServiceDetailServlet
    private final String ERROR = "systemError.html";
    private final String UPDATE_SERVICE = "cap-nhat-dich-vu";
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
        PrintWriter out = response.getWriter();
        boolean foundError = false;
        CreateServiceError createServiceErr = new CreateServiceError();
        String serviceID = request.getParameter("txtServiceID");
        String serviceName = request.getParameter("txtTitle");
        String specialtyId = request.getParameter("cboSpecialty");
        String description = request.getParameter("txtServiceContent");
        String thumbnail = uploadFile(request);
        double price = 0;
        String url = ERROR;
        try {
            price = Double.parseDouble(request.getParameter("txtPrice"));
        } catch (NumberFormatException ex) {
            foundError = true;
            createServiceErr.setPriceFormat("Vui lòng nhập số cho giá của dịch vụ.");
        }
        
        try {
            if (serviceName.trim().length() == 0 || serviceName.trim().length() > 100) {
                foundError = true;
                createServiceErr.setTitleLengthError("Tiêu đề không được để trống và có nhiều nhất 100 kí tự.");
            }
            
            if (description.trim().length() == 0 || description.trim().length() > 300) {
                foundError = true;
                createServiceErr.setDescriptionLengthError("Nội dung không được để trống và có nhiều nhất 300 kí tự.");
            }
            
            if (foundError) {
                request.setAttribute("CREATE_SERVICE_ERROR", createServiceErr);
                url = UPDATE_SERVICE + "?id=" + serviceID;
                RequestDispatcher rd = request.getRequestDispatcher(url);
                rd.forward(request, response);
            } else {
                ServiceDAO dao = new ServiceDAO();
                ServiceDTO dto = dao.getServiceDetail(serviceID);
                if (thumbnail.trim().isEmpty()) {
                    thumbnail = dto.getThumbnail();
                }
                ServiceDTO service = new ServiceDTO(serviceID, serviceName,
                        specialtyId, thumbnail, description, price,
                        "0", LocalDateTime.now().toString());
                
                boolean result = dao.updateService(service);
                if (result) {
                    url = VIEW_SERVICE + "?id=" + serviceID;
                } else {
                    url = ERROR;
                }
                response.sendRedirect(url);
            }
        } catch (NamingException ex) {
            log("UpdateServiceServlet_ Naming: " + ex.getMessage());
        } catch (SQLException ex) {
            log("UpdateServiceServlet_SQL: " + ex.getMessage());
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
