/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblBlogCategory;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author DELL
 */
public class BlogCategoryDAO implements Serializable {

    public List<BlogCategoryDTO> viewBlogCategory() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            //if (con != null) {
            String sql = "Select CategoryID, CategoryName "
                    + "From tblBlogCategory";
            stm = con.prepareStatement(sql);
            rs = stm.executeQuery();
            List<BlogCategoryDTO> list = new ArrayList<>();
            while (rs.next()) {
                String cateID = rs.getString("CategoryID");
                String cateName = rs.getString("CategoryName");
                BlogCategoryDTO dto = new BlogCategoryDTO(cateID, cateName);
                list.add(dto);
            }
            return list;
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

    public boolean addCategory(String cateName) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblBlogCategory "
                        + "(CategoryName) values(?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, cateName);
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

    public boolean deleteCategory(String cateID) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblBlogCategory WHERE CategoryID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cateID);
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

    public boolean updateSpecialty(String cateID, String cateName) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblBlogCategory SET CategoryName=? "
                        + " WHERE CategoryID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, cateName);
                stm.setString(2, cateID);
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
}
