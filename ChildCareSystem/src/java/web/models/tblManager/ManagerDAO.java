/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author Admin
 */
public class ManagerDAO {

    public ManagerDTO queryManager(String phoneNum) throws SQLException, NamingException {
        String fullName = "";
        String email = "";
        String address = "";
        String birthday = "";
        String citizenID = "";
        String roleID = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT FullName, Email, Address, Birthday, CitizenID, RoleID"
                        + " FROM tblManager M, tblIdentity I "
                        + " WHERE M.IdentityID = I.IdentityID AND PhoneNumber=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, phoneNum);
                rs = stm.executeQuery();
                if (rs.next()) {
                    fullName = rs.getString("FullName");
                    email = rs.getString("Email");
                    address = rs.getString("Address");
                    birthday = rs.getString("Birthday");
                    citizenID = rs.getString("CitizenID");
                    roleID = rs.getString("RoleID");
                    ManagerDTO man = new ManagerDTO(fullName, email, address, birthday, citizenID, roleID);
                    return man;
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
        return null;
    }

    public ManagerDTO queryManagerByIdentityId(String identityId) throws SQLException, NamingException {
        String fullName = "";
        String phoneNumber = "";
        String address = "";
        String birthday = "";
        String citizenID = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT FullName, PhoneNumber, Address, Birthday, CitizenID"
                        + " FROM tblManager "
                        + " WHERE IdentityID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, identityId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    fullName = rs.getString("FullName");
                    phoneNumber = rs.getString("PhoneNumber");
                    address = rs.getString("Address");
                    birthday = rs.getString("Birthday");
                    citizenID = rs.getString("CitizenID");
                    ManagerDTO man = new ManagerDTO(identityId, fullName, address, birthday, citizenID, phoneNumber);
                    return man;
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
        return null;
    }

    public boolean update(ManagerDTO man) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblManager SET FullName=?, Address=?, Birthday=? "
                        + " WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, man.getFullName());
                stm.setString(2, man.getAddress());
                stm.setString(3, man.getBirthday());
                stm.setString(4, man.getIdentityID());

                check = stm.executeUpdate() > 0 ? true : false;
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

    public boolean checkCitizenID(String citizenID) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT CitizenID "
                        + " FROM tblManager "
                        + " WHERE CitizenID=?";
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
}
