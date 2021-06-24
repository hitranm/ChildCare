/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblBlog;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import web.controller.ViewBlogServlet;
import web.utils.DBHelpers;

/**
 *
 * @author DELL
 */
public class BlogDAO implements Serializable {

    public boolean createBlog(String thumbnail, String title, String authorID, String description, String categoryID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Insert into "
                        + "tblBlog (Thumbnail, Title, AuthorID, Description, CategoryID, StatusID) "
                        + "Values(?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, thumbnail);
                stm.setString(2, title);
                stm.setString(3, authorID);
                stm.setString(4, description);
                stm.setString(5, categoryID);
                stm.setString(6, "1");
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    private List<BlogDTO> blogList;

    public List<BlogDTO> getBlogList() {
        return blogList;
    }

//    public void viewBlogList() throws SQLException, NamingException {
//        Connection con = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            con = DBHelpers.makeConnection();
//            //if (con != null) {
//            String sql = "Select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, StatusID "
//                    + "From tblBlog";
//            stm = con.prepareStatement(sql);
//            rs = stm.executeQuery();
//            while (rs.next()) {
//                String blogID = rs.getString("BlogID");
//                String thumbnail = rs.getString("Thumbnail");
//                String title = rs.getString("Title");
//                String authorID = rs.getString("AuthorID");
//                String description = rs.getString("Description");
//                String categoryID = rs.getString("CategoryID");
//                String statusID = rs.getString("StatusID");
//                BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID);
//                if (this.blogList == null) {
//                    this.blogList = new ArrayList<>();
//                }
//                this.blogList.add(dto);
//            }
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//    }
    public int countBlog() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect db
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select count(*) "
                        + "From tblBlog";
                //3. create statement and assign value to parameters
                stm = con.prepareStatement(sql);
                //4. execute query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    return rs.getInt(1);
                } //end while traversing result
            } //end if con iss opened
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public BlogDTO getBlogDetail(String blogID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, CreatedDate, UpdatedDate, StatusID "
                        + "From tblBlog Where BlogID = ?";
                stm = con.prepareStatement(sql);

                stm.setString(1, blogID);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String thumbnail = rs.getString("Thumbnail");
                    String title = rs.getString("Title");
                    String authorID = rs.getString("AuthorID");
                    String description = rs.getString("Description");
                    String categoryID = rs.getString("CategoryID");
                    String createdDate = rs.getString("CreatedDate");
                    String updatedDate = rs.getString("UpdatedDate");
                    String statusID = rs.getString("StatusID");
                    BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, createdDate, updatedDate, statusID);
//                    if (this.blogList == null) {
//                        this.blogList = new ArrayList<>();
//                    }
//                    this.blogList.add(dto);
                    return dto;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public boolean updateBlog(String blogID, String title, String body, String categoryID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Update tblBlog "
                        + "Set Title=?, Description=?, StatusID=?, CategoryID=? "
                        + "Where BlogID=?";

                stm = con.prepareStatement(sql);
                stm.setString(1, title);
                stm.setString(2, body);
                //stm.setString(3, cateID);
                stm.setString(3, "1");
                stm.setString(4, categoryID);
                stm.setString(5, blogID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
        return false;
    }

    public boolean deleteBlog(String blogID) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblBlog WHERE BlogID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, blogID);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

//    public void searchBlog(String searchValue) throws NamingException, SQLException {
//        Connection con = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            //1. connect db
//            con = DBHelpers.makeConnection();
//            if (con != null) {
//                //2. create sql string
//                String sql = "Select BlogID, Thumbnail, Title, "
//                        + "AuthorID, Description, CategoryID, StatusID "
//                        + "From tblBlog "
//                        + "Where Title Like ?";
//                //3. create statement and assign value to parameters
//                stm = con.prepareStatement(sql);
//                stm.setString(1, "%" + searchValue + "%");
//                //4. execute query
//                rs = stm.executeQuery();
//                //5. Process result
//                while (rs.next()) {
//                    String blogID = rs.getString("BlogID");
//                    String thumbnail = rs.getString("Thumbnail");
//                    String title = rs.getString("Title");
//                    String authorID = rs.getString("AuthorID");
//                    String description = rs.getString("Description");
//                    String categoryID = rs.getString("CategoryID");
//                    String statusID = rs.getString("StatusID");
//                    BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID);
//                    if (this.blogList == null) {
//                        this.blogList = new ArrayList<>();
//                    }
//                    this.blogList.add(dto);
//                } //end while traversing result
//            } //end if con iss opened
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//    }
    public int countSearch(String searchValue) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect db
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select count(*) "
                        + "From tblBlog "
                        + "Where Title Like ?";
                //3. create statement and assign value to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                //4. execute query
                rs = stm.executeQuery();
                //5. Process result
                while (rs.next()) {
                    return rs.getInt(1);
                } //end while traversing result
            } //end if con iss opened
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }

    public void searchBlog(String searchValue, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            String sql = "select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, CreatedDate, UpdatedDate, StatusID "
                    + "from (select ROW_NUMBER() over (order by BlogID asc) as r, * \n"
                    + "from tblBlog where Title like ?) as x where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            stm.setInt(2, index);
            stm.setInt(3, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                String blogID = rs.getString("BlogID");
                String thumbnail = rs.getString("Thumbnail");
                String title = rs.getString("Title");
                String authorID = rs.getString("AuthorID");
                String description = rs.getString("Description");
                String categoryID = rs.getString("CategoryID");
                String createdDate = rs.getString("CreatedDate");
                String updatedDate = rs.getString("UpdatedDate");
                String statusID = rs.getString("StatusID");
                BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, createdDate, updatedDate, statusID);
                if (this.blogList == null) {
                    this.blogList = new ArrayList<>();
                }
                this.blogList.add(dto);

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        }
    }

    public void viewBlogList(int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, CreatedDate, UpdatedDate, StatusID "
                    + "from (select ROW_NUMBER() over (order by BlogID asc) as r, * \n"
                    + "from tblBlog) as x \n"
                    + "where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setInt(1, index);
            stm.setInt(2, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                String blogID = rs.getString("BlogID");
                String thumbnail = rs.getString("Thumbnail");
                String title = rs.getString("Title");
                String authorID = rs.getString("AuthorID");
                String description = rs.getString("Description");
                String categoryID = rs.getString("CategoryID");
                String createdDate = rs.getString("CreatedDate");
                String updatedDate = rs.getString("UpdatedDate");
                String statusID = rs.getString("StatusID");
                BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, createdDate, updatedDate, statusID);
                if (this.blogList == null) {
                    this.blogList = new ArrayList<>();
                }
                this.blogList.add(dto);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public List<BlogDTO> getTopXBlogList(int top) throws SQLException {
        List<BlogDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP(?)* FROM tblBlog ORDER BY CreatedDate DESC ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, top);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String blogID = rs.getString("BlogID");
                    String thumbnail = rs.getString("Thumbnail");
                    String title = rs.getString("Title");
                    String authorID = rs.getString("AuthorID");
                    String description = rs.getString("Description");
                    String categoryID = rs.getString("CategoryID");
                    String statusID = rs.getString("StatusID");
                    BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID);
                    result.add(dto);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
