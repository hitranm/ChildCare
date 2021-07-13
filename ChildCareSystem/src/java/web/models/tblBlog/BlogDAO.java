/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblBlog;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
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
                        + "tblBlog (Thumbnail, Title, AuthorID, Description, CategoryID, StatusID, UpdatedDate) "
                        + "Values(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, thumbnail);
                stm.setString(2, title);
                stm.setString(3, authorID);
                stm.setString(4, description);
                stm.setString(5, categoryID);
                stm.setString(6, "0");
                stm.setString(7, LocalDateTime.now().toString());
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

    public boolean createBlogforManager(String thumbnail, String title, String authorID, String description, String categoryID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Insert into "
                        + "tblBlog (Thumbnail, Title, AuthorID, Description, CategoryID, StatusID, UpdatedDate) "
                        + "Values(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, thumbnail);
                stm.setString(2, title);
                stm.setString(3, authorID);
                stm.setString(4, description);
                stm.setString(5, categoryID);
                stm.setString(6, "1");
                stm.setString(7, LocalDateTime.now().toString());
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

    public void viewBlogList() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, StatusID, OnSlider "
                    + "From tblBlog ORDER BY UpdatedDate DESC";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String blogID = rs.getString("BlogID");
                String thumbnail = rs.getString("Thumbnail");
                String title = rs.getString("Title");
                String authorID = rs.getString("AuthorID");
                String description = rs.getString("Description");
                String categoryID = rs.getString("CategoryID");
                String statusID = rs.getString("StatusID");
                boolean onSlider = rs.getBoolean("OnSlider");
                BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID, onSlider);
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

    public int countPublicBlog() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect db
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select count(*) "
                        + "From tblBlog Where StatusID=1";
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

    public int countPublicBlogbyCate(String cateID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. connect db
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Select count(*) "
                        + "From tblBlog Where StatusID=1 AND CategoryID=?";
                //3. create statement and assign value to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, cateID);
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
                    Date createdDate = rs.getDate("CreatedDate");
                    Date updatedDate = rs.getDate("UpdatedDate");
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

    public boolean updateBlog(String blogID, String title, String thumbnail, String body, String categoryID)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Update tblBlog "
                        + "Set Title=?, Description=?, Thumbnail=?, StatusID=?, CategoryID=?, UpdatedDate=? "
                        + "Where BlogID=?";

                stm = con.prepareStatement(sql);
                stm.setString(1, title);
                stm.setString(2, body);
                stm.setString(3, thumbnail);
                stm.setString(4, "0");
                stm.setString(5, categoryID);
                stm.setString(6, LocalDateTime.now().toString());
                stm.setString(7, blogID);
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
                    + "from (select ROW_NUMBER() over (order by UpdatedDate DESC) as r, * \n"
                    + "from tblBlog where Title like ? AND StatusID=1) as x where r between ?*5-4 and ?*5";
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
                Date createdDate = rs.getDate("CreatedDate");
                Date updatedDate = rs.getDate("UpdatedDate");
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
                    + "from (select ROW_NUMBER() over (order by CreatedDate DESC) as r, * \n"
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
                Date createdDate = rs.getDate("CreatedDate");
                Date updatedDate = rs.getDate("UpdatedDate");
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

    public List<BlogDTO> getTopXBlogList(int top) throws SQLException, NamingException {
        List<BlogDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP(?)* FROM tblBlog WHERE StatusID=1 ORDER BY CreatedDate DESC ";
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
                    boolean onSlider = rs.getBoolean("OnSlider");
                    BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID, onSlider);
                    result.add(dto);
                }
            }
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

    public boolean setStatus(String blogID, String statusID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Update tblBlog "
                        + "Set StatusID=? "
                        + "Where BlogID=?";

                stm = con.prepareStatement(sql);
                stm.setString(1, statusID);
                stm.setString(2, blogID);
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

    public void queryBlogListbyStatus(int index, String statusID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, CreatedDate, UpdatedDate, StatusID "
                    + "from (select ROW_NUMBER() over (order by UpdatedDate DESC) as r, * \n"
                    + "from tblBlog where StatusID=?) as x \n"
                    + "where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setString(1, statusID);
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
                Date createdDate = rs.getDate("CreatedDate");
                Date updatedDate = rs.getDate("UpdatedDate");
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

    public void queryBlogbyAuthor(String authorID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, StatusID, OnSlider "
                    + "From tblBlog "
                    + "Where AuthorID=? "
                    + "ORDER BY UpdatedDate DESC";
            stm = con.prepareStatement(sql);
            stm.setString(1, authorID);
            rs = stm.executeQuery();
            while (rs.next()) {
                String blogID = rs.getString("BlogID");
                String thumbnail = rs.getString("Thumbnail");
                String title = rs.getString("Title");
                String description = rs.getString("Description");
                String categoryID = rs.getString("CategoryID");
                String statusID = rs.getString("StatusID");
                boolean onSlider = rs.getBoolean("OnSlider");
                BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID, onSlider);
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

    public void queryBlogbyCate(String cateID, int index) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "select BlogID, Thumbnail, Title, AuthorID, Description, CategoryID, CreatedDate, UpdatedDate, StatusID "
                    + "from (select ROW_NUMBER() over (order by UpdatedDate DESC) as r, * \n"
                    + "from tblBlog where CategoryID=? AND StatusID=?) as x \n"
                    + "where r between ?*5-4 and ?*5";
            stm = con.prepareStatement(sql);
            stm.setString(1, cateID);
            stm.setString(2, "1");
            stm.setInt(3, index);
            stm.setInt(4, index);
            rs = stm.executeQuery();
            while (rs.next()) {
                String blogID = rs.getString("BlogID");
                String thumbnail = rs.getString("Thumbnail");
                String title = rs.getString("Title");
                String description = rs.getString("Description");
                String authorID = rs.getString("AuthorID");
                Date createdDate = rs.getDate("CreatedDate");
                Date updatedDate = rs.getDate("UpdatedDate");
                String statusID = rs.getString("StatusID");
                BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, cateID, createdDate, updatedDate, statusID);
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
        }
    }

    public void updateSlider(int blogId, String onSlider) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelpers.makeConnection();
            String sql = "Update tblBlog "
                    + "Set OnSlider = ? "
                    + "Where BlogID = ?";
            stm = con.prepareStatement(sql);
            if (onSlider != null) {
                stm.setBoolean(1, true);
            } else {
                stm.setBoolean(1, false);
            }

            stm.setInt(2, blogId);
            stm.executeUpdate();

        } finally {
            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }
    }

    public int countAllBlog() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(BlogID) as Total"
                        + " FROM tblBlog ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    sum = rs.getInt("Total");
                }
            }
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
        return sum;
    }

    public int countBlogActive() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(BlogID) as Total"
                        + " FROM tblBlog "
                        + " WHERE StatusID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 1);
                rs = stm.executeQuery();
                if (rs.next()) {
                    sum = rs.getInt("Total");
                }
            }
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
        return sum;
    }

    public int countBlogPending() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(BlogID) as Total"
                        + " FROM tblBlog "
                        + " WHERE StatusID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 0);
                rs = stm.executeQuery();
                if (rs.next()) {
                    sum = rs.getInt("Total");
                }
            }
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
        return sum;
    }

    public List<BlogDTO> getSliderList() throws NamingException, SQLException {
        List<BlogDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * FROM tblBlog "
                        + "Where OnSlider = 1";
                stm = conn.prepareStatement(sql);
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
                    boolean onSlider = rs.getBoolean("OnSlider");
                    BlogDTO dto = new BlogDTO(blogID, thumbnail, title, authorID, description, categoryID, statusID, onSlider);
                    result.add(dto);
                }
            }
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
