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

    public StaffDTO queryStaffByIdentityId(String identityId) throws SQLException, NamingException {
        String fullName;
        String phoneNum;
        String address;
        String birthday;
        String citizenID;
        String specialtyID;
        String staffID;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT StaffID, FullName, PhoneNumber, Address, Birthday, CitizenID, SpecialtyID "
                        + " FROM tblStaff S "
                        + " WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, identityId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    staffID = rs.getString("StaffID");
                    fullName = rs.getString("FullName");
                    phoneNum = rs.getString("PhoneNumber");
                    address = rs.getString("Address");
                    birthday = rs.getString("Birthday");
                    citizenID = rs.getString("CitizenID");
                    specialtyID = rs.getString("SpecialtyID");
                    StaffDTO staff = new StaffDTO(identityId, staffID, fullName, phoneNum, address, birthday, citizenID, specialtyID);
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
                String sql = "UPDATE tblStaff SET FullName=?, Address=?, Birthday=?, SpecialtyID=?"
                        + " WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, staff.getFullName());
                stm.setString(2, staff.getAddress());
                stm.setString(3, staff.getBirthday());
                stm.setString(4, staff.getSpecialtyID());
                stm.setString(5, staff.getIdentityID());

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

    public List<StaffDTO> getAllActiveStaffProfile() throws SQLException, NamingException {
        List<StaffDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT S.IdentityID, StaffID, FullName, PhoneNumber, Address, Birthday, CitizenID, SpecialtyID "
                        + " FROM tblStaff S, tblIdentity I "
                        + " WHERE S.IdentityID = I.IdentityID AND StatusID=1";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String identityID = rs.getString("IdentityID");
                    String staffID = rs.getString("StaffID");
                    String fullName = rs.getString("FullName");
                    String phoneNum = rs.getString("PhoneNumber");
                    String address = rs.getString("Address");
                    String birthday = rs.getString("Birthday");
                    String citizenID = rs.getString("CitizenID");
                    String specialtyID = rs.getString("SpecialtyID");
                    StaffDTO staff = new StaffDTO(identityID, staffID, fullName, phoneNum, address, birthday, citizenID, specialtyID);
                    result.add(staff);
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

    public List<StaffDTO> getStaffListBySpecialtyId(int specialtyID) throws SQLException, NamingException {
        List<StaffDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT StaffID, IdentityID, FullName, Address, Birthday, CitizenID, PhoneNumber, SpecialtyID "
                        + " FROM tblStaff "
                        + "Where SpecialtyID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, specialtyID);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String identityID = rs.getString("IdentityID");
                    String staffId = rs.getString("StaffID");
                    String specialtyId = rs.getString("SpecialtyID");
                    String fullName = rs.getString("FullName");
                    String address = rs.getString("Address");
                    String birthday = rs.getString("Birthday");
                    String citizenId = rs.getString("CitizenID");
                    String phoneNumber = rs.getString("PhoneNumber");
                    StaffDTO staff = new StaffDTO(identityID, staffId, fullName, phoneNumber, address, birthday, citizenId, specialtyId);
                    result.add(staff);
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

    public boolean delete(String id) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblStaff WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
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

    public StaffDTO queryStaffById(int id) throws SQLException, NamingException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT FullName, SpecialtyID "
                        + " FROM tblStaff S "
                        + " WHERE StaffID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("FullName");

                    String specialtyID = rs.getString("SpecialtyID");
                    StaffDTO staff = new StaffDTO(fullName, specialtyID);
                    return staff;
                }
            }
        } finally {
            if(rs != null) {
                rs.close();
            }
            
            if(stm != null) {
                stm.close();
            }
            
            if(conn != null) {
                conn.close();
            }
        }
        return null;
    }

    public String getStaffName(String staffID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "SELECT FullName "
                        + " FROM tblStaff "
                        + "Where StaffID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, staffID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String staffName = rs.getString("FullName");
                    return staffName;
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
}
