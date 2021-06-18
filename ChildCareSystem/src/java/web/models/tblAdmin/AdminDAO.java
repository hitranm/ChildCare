/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblAdmin;

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
public class AdminDAO {
/*     public AdminDTO queryAdmin(String phoneNum) throws SQLException, NamingException {
        String fullName = "";
        String email="";
        String address="";
        String birthday="";
        String citizenID="";
        String roleID="";

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT FullName, Email, Address, Birthday, CitizenID, RoleID "
                        + " FROM tblAdmin A, tblIdentity I "
                        + " WHERE A.IdentityID = I.IdentityID AND PhoneNumber=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, phoneNum);
                rs = stm.executeQuery();
                if (rs.next()) {
                    fullName = rs.getString("FullName");
                    email = rs.getString("Email");
                    address = rs.getString("Address");
                    birthday = rs.getString("Birthday");
                    citizenID= rs.getString("CitizenID");
                    roleID = rs.getString("RoleID");
                    
                    AdminDTO admin = new AdminDTO(fullName, email, address, birthday, citizenID, roleID);
                    return admin;
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
    }*/
     public boolean update(AdminDTO admin) throws SQLException, NamingException{
        boolean check=false;
        Connection conn=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
                String sql= "UPDATE tblAdmin SET FullName=?, Address=?, Birthday=? "
                        + " WHERE IdentityID=?";
                stm=conn.prepareStatement(sql);
                stm.setString(1, admin.getFullName());
                stm.setString(2, admin.getAddress());
                stm.setString(3, admin.getBirthday());
                stm.setString(4, admin.getIdentityID());
                
                check= stm.executeUpdate()>0?true:false;
            }
            
        }
        finally{
             if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
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
                        + " FROM tblAdmin "
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
       public AdminDTO queryAdminByIdentityId(String identityId) throws SQLException, NamingException {
        String fullName;
        String phoneNum;
        String address;
        String birthday;
        String citizenID;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT FullName, PhoneNumber, Address, Birthday, CitizenID "
                        + " FROM tblAdmin A "
                        + " WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, identityId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    fullName = rs.getString("FullName");
                    phoneNum = rs.getString("PhoneNumber");
                    address = rs.getString("Address");
                    birthday = rs.getString("Birthday");
                    citizenID = rs.getString("CitizenID");
                    AdminDTO admin = new AdminDTO(identityId, fullName, phoneNum, address, birthday, citizenID);
                    return admin;
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
       public boolean delete(String id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblAdmin WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
}
