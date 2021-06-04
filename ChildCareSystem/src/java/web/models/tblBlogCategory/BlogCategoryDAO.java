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
import web.models.tblBlog.BlogDTO;
import web.utils.DBHelpers;

/**
 *
 * @author DELL
 */
public class BlogCategoryDAO implements Serializable {
    private List<BlogCategoryDTO> blogCategoryList;
    public List<BlogCategoryDTO> getBlogCategoryList() {
        return blogCategoryList;
    }
    public void viewBlogCategory() throws NamingException, SQLException {
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
            while (rs.next()) {
                String cateID = rs.getString("CategoryID");
                String cateName = rs.getString("CategoryName");
                BlogCategoryDTO dto = new BlogCategoryDTO(cateID, cateName);
                if (this.blogCategoryList == null) {
                    this.blogCategoryList = new ArrayList<>();
                }
                this.blogCategoryList.add(dto);
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
    
}
