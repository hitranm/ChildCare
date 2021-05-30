/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblPatient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import web.models.tblCustomer.CustomerDTO;
import web.utils.DBHelpers;

/**
 *
 * @author nguye
 */
public class PatientDAO {
    public boolean addPatient(PatientDTO patient) throws ClassNotFoundException, SQLException{
        Connection conn=null;
        PreparedStatement stm=null;
        try{
            conn=DBHelpers.makeConnection();
            if(conn!=null){
                String sql= "INSERT INTO tblPatient(PatientName, Gender, CustomerID, Birthday) VALUES(?,?,?,?)";
                stm=conn.prepareStatement(sql);
                stm.setNString(1, patient.getPatientName());
                stm.setByte(2, Byte.parseByte(patient.getGender()));
                stm.setString(3, patient.getCustomerID());
                stm.setString(4, patient.getBirthday());
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
}
