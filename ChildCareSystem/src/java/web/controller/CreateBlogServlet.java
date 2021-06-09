/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import web.models.tblBlog.BlogDAO;
import web.models.tblBlog.BlogError;
import web.models.tblBlogCategory.BlogCategoryDAO;
import web.models.tblBlogCategory.BlogCategoryDTO;
import web.models.tblStaff.StaffDAO;

/**
 *
 * @author DELL
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class CreateBlogServlet extends HttpServlet {

    private final String VIEWBLOG = "ViewBlogServlet?index=1";
    private final String ERROR_PAGE = "error.jsp";

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
//        String title = request.getParameter("txtTitle");
//        String body = request.getParameter("txtBody");
//        String categoryID = request.getParameter("category");
        String authorID;
        String filename = "";
        BlogError err = new BlogError();

        boolean foundErr = false;
        try {
//            if (title.trim().isEmpty()) {
//                foundErr = true;
//                err.setTitleLengthErr("Bạn không được để trống Tiêu đề!");
//            }
//            if (body.trim().isEmpty()) {
//                foundErr = true;
//                err.setDescriptionErr("Bạn không được để trống Nội dụng!");
//            }

            if (foundErr) {
                request.setAttribute("CREATE_ERROR", err);
            } else {
                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // Configure a repository (to ensure a secure temp location is used)
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request
                List<FileItem> items = upload.parseRequest(request);

                // Process the uploaded items
                Iterator<FileItem> iter = items.iterator();
                HashMap<String, String> fields = new HashMap<>();
                while (iter.hasNext()) {
                    FileItem item = iter.next();              
                    if (item.isFormField()) {
                        fields.put(item.getFieldName(), item.getString());
                    } else {
                        filename = item.getName();
                        System.out.println("Filename: " + filename);
                        Path path = Paths.get(filename);
                        String storePath = servletContext.getRealPath("/images");
                        File uploadFile = new File(storePath + "/" + path.getFileName());
                        item.write(uploadFile);
                        System.out.println(storePath + "/" + path.getFileName());
                    }
                }

                BlogDAO dao = new BlogDAO();             
                if (session != null) {
                    String identityID = (String) session.getAttribute("IDENTITY_ID");
                    StaffDAO staffDAO = new StaffDAO();
                    authorID = staffDAO.queryStaff(identityID);
                    boolean result = dao.createBlog(filename, fields.get("txtTitle"), authorID, fields.get("txtBody"), fields.get("category"));
                    if (result) {
                        url = VIEWBLOG;
                    }
                }
            }
        }  catch (Exception ex) {
            log("CreateBlogServlet: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
