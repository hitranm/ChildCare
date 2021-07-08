/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblMedicalExamination;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class MedicalExaminationDAO implements Serializable {
    public boolean addExamination(MedicalExaminationDTO examination) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblMedicalExamination(ReservationID, ServiceID, Prescription, CreatedDate, UpdatedDate) VALUES(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);

                stm.setInt(1, examination.getReservationId());
                stm.setInt(2, examination.getServiceId());
                stm.setString(3, examination.getPrescription());
                stm.setDate(4, examination.getCreatedDate());
                stm.setDate(5, examination.getUpdatedDate());
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
    
    public boolean deleteExamination(int id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblMedicalExamination WHERE ExaminationID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
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
    
    
    public boolean updateExamination(int examinationId, String prescription, Date updatedDate) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblMedicalExamination SET prescription=?, updatedDate=? WHERE ExaminationID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, prescription);
                stm.setDate(2, updatedDate);
                stm.setInt(3, examinationId);
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
    
    public MedicalExaminationDTO getExaminationByReservationId(int id) throws SQLException, NamingException {
        MedicalExaminationDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblMedicalExamination "
                        + " WHERE ReservationID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    String prescription = rs.getString("Prescription");
                    int examinationId = rs.getInt("ExaminationID");
                    int serviceId = rs.getInt("ServiceID");
                    Date createdDate = rs.getDate("CreatedDate");
                    Date updatedDate = rs.getDate("UpdatedDate");
                    result = new MedicalExaminationDTO(examinationId, id, serviceId, prescription, updatedDate, createdDate);
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
    
}
