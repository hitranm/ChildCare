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
import web.models.tblCustomer.CustomerDTO;
import web.utils.DBHelpers;

/**
 *
 * @author Admin
 */
public class IdentityDAO {
     public boolean addIdentity(IdentityDTO identity) throws ClassNotFoundException, SQLException{
        Connection conn=null;
        PreparedStatement stm=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
                String sql= "INSERT INTO tblIdentity(PhoneNumber, Password, RoleID) VALUES(?,?,?)";
                stm=conn.prepareStatement(sql);
                stm.setString(1, identity.getPhoneNum());
                stm.setString(2, identity.getPassword());
                stm.setString(3, identity.getRoleID());
                int row= stm.executeUpdate();
                if(row>0)
                    return true;
            }
            
            
    }catch(Exception e){
        e.printStackTrace();
    }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
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
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (Exception ex) {
            throw new RuntimeException(ex);
        }
    }
         public IdentityDTO checkLogin(String phoneNum, String password) throws SQLException{
        IdentityDTO identity = null;
        Connection conn=null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBHelpers.makeConnection();
            if(conn!=null){
                String sql = "SELECT IdentityID, RoleID "
                        + " FROM tblIdentity "
                        +" WHERE PhoneNumber=? AND password=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, phoneNum);
                stm.setString(2, password);
                rs= stm.executeQuery();
                if(rs.next()){
                    String identityID = rs.getString("IdentityID");
                    String roleID = rs.getString("RoleID");
                    identity= new IdentityDTO(identityID, roleID);
                }
            }
        }catch(Exception e){}
        finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();            
        }
        return identity;
    }
          public String queryID(String phoneNum) throws SQLException{
        String identityID="";
        Connection conn=null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            conn = DBHelpers.makeConnection();
            if(conn!=null){
                String sql = "SELECT IdentityID"
                        + " FROM tblIdentity "
                        +" WHERE PhoneNumber=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, phoneNum);
                rs= stm.executeQuery();
                if(rs.next()){
                    identityID = rs.getString("IdentityID");
                    
                }
            }
        }catch(Exception e){}
        finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();            
        }
        return identityID;
    }
          public boolean checkPhoneNum(String phoneNum) throws SQLException{
        boolean check=false;
        Connection conn= null;
        PreparedStatement stm= null;
        ResultSet rs=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
            String sql="SELECT PhoneNumber "
                    + " FROM tblIdentity"
                    +" WHERE PhoneNumber=?";
           stm=conn.prepareStatement(sql);
           stm.setString(1, phoneNum);
           rs=stm.executeQuery();
           if(rs.next()){
               check=true;
           }
      }  
      }catch(Exception e) {
            
        }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
            }
        return check;
        }
          public boolean updatePass(String pass, String phoneNum) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn=DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblIdentity SET Password=? WHERE PhoneNumber=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, pass);
                stm.setString(2, phoneNum);
                
                int row= stm.executeUpdate();
                if(row>0)
                    return true;
                
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
        } return false;
       }
}
