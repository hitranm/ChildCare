/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblPatient;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.models.tblCustomer.CustomerDTO;
import web.utils.DBHelpers;

/**
 *
 * @author nguye
 */
public class PatientDAO {

    public boolean addPatient(PatientDTO patient) throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblPatient(PatientName, Gender, CustomerID, Birthday) VALUES(?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setNString(1, patient.getPatientName());
                stm.setByte(2, Byte.parseByte(patient.getGender()));
                stm.setString(3, patient.getCustomerID());
                stm.setString(4, patient.getBirthday());
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

    public List<PatientDTO> getAllPatientProfile(String id) throws SQLException {
        List<PatientDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblPatient"
                        + " WHERE CustomerID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String patientID = rs.getString("PatientID");
                    String name = rs.getString("PatientName");
                    String genderID = rs.getString("Gender");
                    String gender;
                    if (genderID.equalsIgnoreCase("1")) {
                        gender = "female";
                    } else {
                        gender = "male";
                    }
                    String birthday = rs.getString("Birthday");
                    String customerID = rs.getString("CustomerID");
                    PatientDTO patient = new PatientDTO(patientID, name, gender, birthday, customerID);
                    result.add(patient);
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

    public PatientDTO getPatientByID(String id) throws Exception {
        PatientDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblPatient "
                        + " WHERE PatientID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String patientName = rs.getString("PatientName");
                    String genderID = rs.getString("Gender");
                    String gender;
                    if (genderID.equalsIgnoreCase("1")) {
                        gender = "female";
                    } else {
                        gender = "male";
                    }
                    String birthday = rs.getString("Birthday");
                    String customerID = rs.getString("CustomerID");
                    result = new PatientDTO(id, patientName, gender, birthday, customerID);
                }
            }
        } catch (SQLException | NamingException e) {
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
