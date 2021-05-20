/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.tblCustomer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import web.utils.DBHelpers;

/**
 *
 * @author Admin
 */
public class CustomerDAO {
        public boolean addCustomer(CustomerDTO cus) throws ClassNotFoundException, SQLException{
        Connection conn=null;
        PreparedStatement stm=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
                String sql= "INSERT INTO tblCustomer(IdentityID, FullName, Email, Address, Birthday, CitizenID) VALUES(?,?,?,?,?,?)";
                stm=conn.prepareStatement(sql);
                stm.setString(1, cus.getIdentityID());
                stm.setString(2, cus.getFullName());
                stm.setString(3, cus.getEmail());
                stm.setString(4, cus.getAddress());
                stm.setString(5, cus.getBirthday());
                stm.setString(6, cus.getCitizenID());
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
     public boolean checkCitizenID(String citizenID) throws SQLException{
        boolean check=false;
        Connection conn= null;
        PreparedStatement stm= null;
        ResultSet rs=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
            String sql="SELECT CitizenID "
                    + " FROM tblCustomer"
                    +" WHERE CitizenID=?";
           stm=conn.prepareStatement(sql);
           stm.setString(1, citizenID);
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
     public boolean checkPassword(String password, String cpassword){
         boolean check=true;
         if(password.equals(cpassword))
             return check;
         else {
             check=false;
             return check;
             
     }
}
public boolean checkEmail(String email) throws SQLException{
        boolean check=false;
        Connection conn= null;
        PreparedStatement stm= null;
        ResultSet rs=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
            String sql="SELECT Email "
                    + " FROM tblCustomer"
                    +" WHERE Email=?";
           stm=conn.prepareStatement(sql);
           stm.setString(1, email);
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
}
