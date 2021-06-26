/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblFeedback;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class FeedbackDAO implements Serializable{
    public boolean addFeedback(FeedbackDTO feedback) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblFeedback(ServiceID, ReservationID, CustomerID, Comment, Rate) VALUES(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                
                stm.setInt(1, feedback.getServiceId());
                stm.setInt(2, feedback.getReservationId());
                stm.setInt(3, feedback.getCustomerId());
                stm.setString(4, feedback.getComment());
                stm.setInt(5, feedback.getRate());
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
    
    public boolean deleteFeedback(int id) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "DELETE FROM tblFeedback WHERE FeedbackID=?";
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
    
    public boolean updateFeedback(int feedbackId, String comment, int rate) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblFeedback SET Comment=?, Rate=? WHERE FeedbackID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, comment);
                stm.setInt(2, rate);
                stm.setInt(3, feedbackId);
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
}
