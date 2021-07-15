/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblIdentity;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.models.tblCustomer.CustomerDTO;
import web.utils.DBHelpers;

/**
 *
 * @author Admin
 */
public class IdentityDAO {

    public boolean addIdentity(IdentityDTO identity) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblIdentity(Email, Password, RoleID) VALUES(?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, identity.getEmail());
                stm.setString(2, identity.getPassword());
                stm.setString(3, identity.getRoleID());
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

    public String sha256(String password) {
        try {
            // Static getInstance method is called with hashing SHA
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            //return array of byte of the password
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            // Convert array of byte digest into hex value
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                // Convert message digest into hex value
                String hex = Integer.toHexString(0xff & b);
                // Pad with leading zeros
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }

    public IdentityDTO checkLogin(String email, String password) throws SQLException, NamingException {
        IdentityDTO identity = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT IdentityID, RoleID, StatusID "
                        + " FROM tblIdentity "
                        + " WHERE Email=? AND Password=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String identityID = rs.getString("IdentityID");
                    String roleID = rs.getString("RoleID");
                    int statusID = rs.getInt("StatusID");
                    identity = new IdentityDTO(identityID, roleID, statusID);
                    return identity;
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

    public String queryIDByEmail(String email) throws SQLException, NamingException {
        String identityID = "";
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT IdentityID"
                        + " FROM tblIdentity "
                        + " WHERE Email=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    identityID = rs.getString("IdentityID");
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
        return identityID;
    }

    public boolean checkPhoneNum(String phoneNum) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT PhoneNumber "
                        + " FROM tblIdentity"
                        + " WHERE PhoneNumber=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, phoneNum);
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
        return false;
    }

    public boolean checkDuplicatedEmail(String email) throws SQLException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT Email "
                        + " FROM tblIdentity"
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

    public boolean updatePass(String pass, String identityID) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblIdentity SET Password=? WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, pass);
                stm.setString(2, identityID);

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

    public int getRoleIDByIdentityID(String identityId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            //2. Create query string
            String sql = "SELECT RoleID "
                    + "From tblIdentity "
                    + "Where IdentityID=?";
            //3. Create statement and assign value
            stm = con.prepareStatement(sql);
            stm.setString(1, identityId);
            //4. Execute query
            rs = stm.executeQuery();
            //5. Process result set
            if (rs.next()) {
                int roleId = rs.getInt("RoleID");
                return roleId;
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
        return -1;
    }

    public IdentityDTO getIdentityDTO(String identityId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            //2. Create query string
            String sql = "SELECT Password, Email, RoleId, StatusID "
                    + "From tblIdentity "
                    + "Where IdentityID=?";
            //3. Create statement and assign value
            stm = con.prepareStatement(sql);
            stm.setString(1, identityId);
            //4. Execute query
            rs = stm.executeQuery();
            //5. Process result set
            if (rs.next()) {
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String roleId = rs.getString("RoleID");
                int statusId = Integer.parseInt(rs.getString("StatusID"));
                IdentityDTO identityDTO = new IdentityDTO(identityId, email, password, roleId, statusId);
                return identityDTO;
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

    public boolean delete(String id) throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblIdentity WHERE IdentityID=?";
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

    public int countAllAccount() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(IdentityID) as Total"
                        + " FROM tblIdentity ";
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

    public int countAllActiveAccount() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(IdentityID) as Total"
                        + " FROM tblIdentity "
                        + " WHERE StatusID=1 ";
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

    public int countAllDeactiveAccount() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(IdentityID) as Total"
                        + " FROM tblIdentity "
                        + " WHERE StatusID=0 ";
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

    public int countCustomerAccount() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(IdentityID) as Total"
                        + " FROM tblIdentity "
                        + " WHERE RoleID=?";
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

    public int countStaffAccount() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(IdentityID) as Total"
                        + " FROM tblIdentity "
                        + " WHERE RoleID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 2);
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

    public int countNewAccountMonthly() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(IdentityID) as Total"
                        + " FROM tblIdentity "
                        + " WHERE MONTH(CreatedDate) = Month(GETDATE())";
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

    public boolean deActiveAccount(int identityId) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblIdentity SET StatusID=0 WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, identityId);
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

    public boolean activeAccount(int identityId) throws NamingException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblIdentity SET StatusID=1 WHERE IdentityID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, identityId);
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

    public String getStaffNameByIdentityId(String identityId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String result;
        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            //2. Create query string
            String sql = "SELECT FullName "
                    + "From tblStaff S "
                    + "Where S.IdentityID=?";
            //3. Create statement and assign value
            stm = con.prepareStatement(sql);
            stm.setString(1, identityId);
            //4. Execute query
            rs = stm.executeQuery();
            //5. Process result set
            if (rs.next()) {
                result = rs.getString("FullName");
                return result;
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

    public String getStaffOrManagerNameByIdentityId(String identityId) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String result = null;
        try {
            if (getStaffNameByIdentityId(identityId) != null) {
                result = getStaffNameByIdentityId(identityId);
            } else {
                //1. Connect DB
                con = DBHelpers.makeConnection();
                //2. Create query string
                String sql = "SELECT FullName "
                        + "From tblManager M "
                        + "Where M.IdentityID=?";
                //3. Create statement and assign value
                stm = con.prepareStatement(sql);
                stm.setString(1, identityId);
                //4. Execute query
                rs = stm.executeQuery();
                //5. Process result set
                if (rs.next()) {
                    result = rs.getString("FullName");
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
        return result;
    }
}
