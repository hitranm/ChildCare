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
import java.util.ArrayList;
import java.util.List;
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
            String phoneNum,
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
                        + "tblStaff (IdentityID, FullName, PhoneNumber, Address, Birthday, CitizenID, SpecialtyID) "
                        + "VALUES (?,?,?,?,?,?,?)";
                //3. Create statement and assign value
                stm = con.prepareStatement(sql);
                stm.setString(1, identityID);
                stm.setString(2, fullname);
                stm.setString(3, phoneNum);
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
                        + "FROM tblStaff "
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
    
    public boolean checkDuplicatedPhoneNumber(String phoneNum) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT PhoneNumber "
                        + " FROM tblStaff"
                        + " WHERE PhoneNumber=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, phoneNum);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }

//    public boolean checkEmail(String email) throws SQLException, NamingException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBHelpers.makeConnection();
//            if (conn != null) {
//                String sql = "SELECT Email "
//                        + " FROM tblStaff"
//                        + " WHERE Email=?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, email);
//                rs = stm.executeQuery();
//                if (rs.next()) {
//                    check = true;
//                }
//            }
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }

    public String queryStaff(String identityID) throws NamingException, SQLException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String staffID = "";

        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "Select StaffID "
                        + "From tblStaff "
                        + "Where IdentityID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, identityID);
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

//    public StaffDTO queryStaff1(String phoneNum) throws SQLException, NamingException {
//        String fullName = "";
//        String email = "";
//        String address = "";
//        String birthday = "";
//        String citizenID = "";
//        String roleID = "";
//        String specialtyID = "";
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBHelpers.makeConnection();
//            if (conn != null) {
//                String sql = "SELECT FullName, Email, Address, Birthday, CitizenID, RoleID, SpecialtyID "
//                        + " FROM tblStaff S, tblIdentity I "
//                        + " WHERE S.IdentityID = I.IdentityID AND PhoneNumber=?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, phoneNum);
//                rs = stm.executeQuery();
//                if (rs.next()) {
//                    fullName = rs.getString("FullName");
//                    email = rs.getString("Email");
//                    address = rs.getString("Address");
//                    birthday = rs.getString("Birthday");
//                    citizenID = rs.getString("CitizenID");
//                    roleID = rs.getString("RoleID");
//                    specialtyID = rs.getString("SpecialtyID");
//                    StaffDTO staff = new StaffDTO(fullName, email, address, birthday, citizenID, roleID, "", specialtyID);
//                    return staff;
//                }
//            }
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return null;
//    }
    
    public StaffDTO queryStaffByIdentityId(String identityId) throws SQLException, NamingException {
        String fullName;
        String phoneNum;
        String address;
        String birthday;
        String citizenID;
        String specialtyID;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT FullName, PhoneNumber, Address, Birthday, CitizenID, SpecialtyID "
                        + " FROM tblStaff S "
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
                    specialtyID = rs.getString("SpecialtyID");
                    StaffDTO staff = new StaffDTO(identityId, fullName, phoneNum, address, birthday, citizenID, specialtyID);
                    return staff;
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
    
    

    public boolean update(StaffDTO staff) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblStaff SET FullName=?, Address=?, Birthday=? "
                        + " WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, staff.getFullName());
                stm.setString(2, staff.getAddress());
                stm.setString(3, staff.getBirthday());
                stm.setString(4, staff.getIdentityID());

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
    public List<StaffDTO> getAllStaffProfile() throws SQLException {
        List<StaffDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblStaff" ;
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String identityID = rs.getString("IdentityID");
                    String fullName = rs.getString("FullName");
                    String phoneNumber = rs.getString("PhoneNumber");
                    StaffDTO staff = new StaffDTO(identityID, fullName, phoneNumber);
                    result.add(staff);
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
