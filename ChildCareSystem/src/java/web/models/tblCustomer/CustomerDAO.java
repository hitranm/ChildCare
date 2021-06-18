/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblCustomer;

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
 * @author Admin
 */
public class CustomerDAO {
    private CustomerDTO customer;
    public CustomerDTO getCustomer() {
        return this.customer;
    } 

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }
    
    public boolean addCustomer(CustomerDTO cus) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblCustomer(IdentityID, FullName, PhoneNumber, Address, Birthday, CitizenID) VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cus.getIdentityID());
                stm.setString(2, cus.getFullName());
                stm.setString(3, cus.getPhoneNumber());
                stm.setString(4, cus.getAddress());
                stm.setString(5, cus.getBirthday());
                stm.setString(6, cus.getCitizenID());
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

    public boolean checkCitizenID(String citizenID) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT CitizenID "
                        + " FROM tblCustomer"
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
    
    public boolean checkDuplicatedPhoneNumber(String phoneNum) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT PhoneNumber "
                        + " FROM tblCustomer"
                        + " WHERE CitizenID=?";
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
//       Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBHelpers.makeConnection();
//            if (conn != null) {
//                String sql = "SELECT Email "
//                        + " FROM tblCustomer"
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

//    public CustomerDTO queryCustomer(String phoneNum) throws SQLException, NamingException {
//        String fullName = "";
//        String email = "";
//        String address = "";
//        String birthday = "";
//        String citizenID = "";
//        String roleID = "";
//        String identityID = "";
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBHelpers.makeConnection();
//            if (conn != null) {
//                String sql = "SELECT IdentityID, FullName, Email, Address, Birthday, CitizenID, RoleID "
//                        + " FROM tblCustomer C, tblIdentity I "
//                        + " WHERE C.IdentityID = I.IdentityID AND I.PhoneNumber=?";
//                stm = conn.prepareStatement(sql);
//                stm.setString(1, phoneNum);
//                rs = stm.executeQuery();
//                if (rs.next()) {
//                    identityID = rs.getString("IdentityID");
//                    fullName = rs.getString("FullName");
//                    email = rs.getString("Email");
//                    address = rs.getString("Address");
//                    birthday = rs.getString("Birthday");
//                    citizenID = rs.getString("CitizenID");
//                    roleID = rs.getString("RoleID");
//                    CustomerDTO cus = new CustomerDTO(identityID, fullName, email, address, birthday, citizenID, roleID);
//                    return cus;
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

    public CustomerDTO queryCustomerByIdentityId(String identityId) throws SQLException, NamingException {
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
                String sql = "SELECT IdentityID, FullName, PhoneNumber, Address, Birthday, CitizenID"
                        + " FROM tblCustomer"
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
                    CustomerDTO cus = new CustomerDTO(identityId, fullName, phoneNum, address, birthday, citizenID);
                    return cus;
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

    public String queryCustomerID(String email) throws SQLException, NamingException {
        String CustomerID = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT CustomerID "
                        + " FROM tblCustomer C, tblIdentity I "
                        + " WHERE C.IdentityID = I.IdentityID AND Email=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    CustomerID = rs.getString("CustomerID");
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
        return CustomerID;
    }

    public boolean update(CustomerDTO cus) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblCustomer SET FullName=?, Address=?, Birthday=? "
                        + " WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, cus.getFullName());
                stm.setString(2, cus.getAddress());
                stm.setString(3, cus.getBirthday());
                stm.setString(4, cus.getIdentityID());
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
     public List<CustomerDTO> getAllCustomerProfile() throws SQLException {
        List<CustomerDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT IdentityID, FullName, PhoneNumber "
                        + " FROM tblCustomer  ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String identityID = rs.getString("IdentityID");
                    String fullName = rs.getString("FullName");
                    String phoneNumber = rs.getString("PhoneNumber");
                    CustomerDTO cus = new CustomerDTO(identityID, fullName, phoneNumber);
                    result.add(cus);
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
     public boolean delete(String id) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblCustomer WHERE IdentityID=?";
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
