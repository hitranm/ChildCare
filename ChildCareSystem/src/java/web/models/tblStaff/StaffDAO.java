/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblStaff;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.models.tblBlog.BlogDAO;
import web.utils.DBHelpers;

/**
 *
 * @author DELL
 */
public class StaffDAO implements Serializable {

    public String queryStaff(String IdentityID) throws NamingException, SQLException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String staffID = "";

        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Select StaffID "
                        + "From tblStaff S, tblIdentity I "
                        + "Where S.IdentityID = I.IdentityID AND I.IndentityID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, IdentityID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    staffID = rs.getString("StaffID");
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
        return staffID;
    }
    
}
