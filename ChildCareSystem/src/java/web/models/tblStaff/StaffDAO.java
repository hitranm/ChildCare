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

    public boolean addStaff(String identityID,
            String fullname,
            String email,
            String address,
            String birthday,
            String citizenID,
            String specialtyID) throws NamingException, SQLException {

        Connection con = null;
        PreparedStatement stm = null;
        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create query string
                String sql = "INSERT INTO "
                        + "tblStaff (IdentityID, FullName, Email, Address, Birthday, CitizenID, SpecialtyID) "
                        + "VALUES (?,?,?,?,?,?,?)";
                //3. Create statement and assign value
                stm = con.prepareStatement(sql);
                stm.setString(1, identityID);
                stm.setString(2, fullname);
                stm.setString(3, email);
                stm.setString(4, address);
                stm.setString(5, birthday);
                stm.setString(6, citizenID);
                stm.setString(7, specialtyID);

                //4. Execute query
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

    public boolean checkCitizenID(String citizenID) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT CitizenID "
                        + "FROM tblCustomer "
                        + "WHERE CitizenID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, citizenID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public boolean checkEmail(String email) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT Email "
                        + " FROM tblStaff"
                        + " WHERE Email=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

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
