/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblFeedback;

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
 * @author HOANGKHOI
 */
public class FeedbackDAO implements Serializable {

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

    public FeedbackDTO getFeedbackByReservationId(int id) throws SQLException, NamingException {
        FeedbackDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblFeedback "
                        + " WHERE ReservationID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String comment = rs.getString("Comment");
                    int rate = rs.getInt("Rate");
                    int serviceId = rs.getInt("ServiceID");
                    int customerId = rs.getInt("CustomerID");
                    int feedbackId = rs.getInt("FeedbackID");
                    result = new FeedbackDTO(feedbackId, serviceId, customerId, id, comment, rate);
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
    
    public FeedbackDTO getFeedbackById(int id) throws SQLException, NamingException {
        FeedbackDTO result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblFeedback "
                        + " WHERE FeedbackID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String comment = rs.getString("Comment");
                    int rate = rs.getInt("Rate");
                    int serviceId = rs.getInt("ServiceID");
                    int customerId = rs.getInt("CustomerID");
                    int feedbackId = rs.getInt("FeedbackID");
                    int reservationId = rs.getInt("ReservationID");
                    result = new FeedbackDTO(feedbackId, serviceId, customerId, reservationId, comment, rate);
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

    public List<FeedbackDTO> getFeedbackByServiceId(int id, int top) throws SQLException, NamingException {
        List<FeedbackDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT TOP(?)* "
                        + " FROM tblFeedback "
                        + " WHERE ServiceID=? "
                        + "ORDER BY Rate DESC";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, top);
                stm.setInt(2, id);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String comment = rs.getString("Comment");
                    int rate = rs.getInt("Rate");
                    int reservationId = rs.getInt("ReservationID");
                    int customerId = rs.getInt("CustomerID");
                    int feedbackId = rs.getInt("FeedbackID");
                    FeedbackDTO dto = new FeedbackDTO(feedbackId, id, customerId, reservationId, comment, rate);
                    result.add(dto);
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
    
    

    public List<FeedbackDTO> getFeedbackList() throws SQLException, NamingException {
        List<FeedbackDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT * "
                        + " FROM tblFeedback";
                stm = conn.prepareStatement(sql);

                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    String comment = rs.getString("Comment");
                    int rate = rs.getInt("Rate");
                    int reservationId = rs.getInt("ReservationID");
                    int customerId = rs.getInt("CustomerID");
                    int feedbackId = rs.getInt("FeedbackID");
                    int serviceId = rs.getInt("ServiceID");
                    FeedbackDTO dto = new FeedbackDTO(feedbackId, serviceId, customerId, reservationId, comment, rate);
                    result.add(dto);
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

    public float calcAvgStar() throws SQLException, NamingException {
        float sum = 0;
        float rate = 0;
        float result = 0;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT SUM(Rate) as AvgRate, COUNT(FeedbackID) as Total"
                        + " FROM tblFeedback ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    sum = rs.getFloat("Total");
                    rate = rs.getFloat("AvgRate");
                    result = rate / sum;
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

    public int countAllFeedback() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(FeedbackID) as Total"
                        + " FROM tblFeedback ";
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
}
