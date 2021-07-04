/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblReservation;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import web.models.tblBlog.BlogDTO;
import web.utils.DBHelpers;

/**
 *
 * @author HOANGKHOI
 */
public class ReservationDAO implements Serializable {

    private List<ReservationDTO> waitingList = new ArrayList<>();

    public List<ReservationDTO> getWaitingList() {
        return waitingList;
    }

    public boolean getReservationByInfo(int staffId, int serviceId, String checkInTime) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID "
                        + " FROM tblReservation "
                        + "Where StaffAssignedID=? AND ServiceID=? AND CheckInTime=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, staffId);
                stm.setInt(2, serviceId);
                stm.setString(3, checkInTime);
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

    public boolean checkExistedReervation(int patientId, int serviceId, String checkInTime) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID "
                        + " FROM tblReservation "
                        + "Where PatientID=? AND ServiceID=? AND CheckInTime=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, patientId);
                stm.setInt(2, serviceId);
                stm.setString(3, checkInTime);
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

    public void AddReservation() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create query string
                String sql = "INSERT INTO "
                        + "tblReservation (CustomerID, PatientID, ServiceID, StaffAssignedID, IntervalTimeID, CheckInTime, Price) "
                        + "VALUES (?,?,?,?,?,?)";
                //3. Create statement and assign value
                stm = con.prepareStatement(sql);
                for (ReservationDTO reservation : this.getWaitingList()) {
                    stm.setInt(1, reservation.getCustomerId());
                    stm.setInt(2, reservation.getPatientId());
                    stm.setInt(3, reservation.getServiceId());
                    stm.setInt(4, reservation.getStaffAssignId());
                    stm.setInt(5, reservation.getTimeIntervalId());
                    stm.setString(6, reservation.getCheckInDate());
                    stm.setFloat(7, reservation.getPrice());
                    stm.addBatch();
                }
                stm.executeBatch();
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public List<ReservationDTO> getAllReservation() throws SQLException, NamingException {
        List<ReservationDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID, CustomerID, StaffAssignedID, CheckInTime"
                        + " FROM tblReservation ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int reservationID = rs.getInt("ReservationID");
                    int customerID = rs.getInt("CustomerID");
                    int staffAssignedID = rs.getInt("StaffAssignedID");
                    String checkInTime = rs.getString("CheckInTime");
                    float price = rs.getFloat("Price");
                    ReservationDTO res = new ReservationDTO(reservationID, customerID, staffAssignedID, checkInTime, price);
                    result.add(res);
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

    public List<ReservationDTO> getAllReservationByIntervalTimeID(int x, int y) throws SQLException, NamingException {
        List<ReservationDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID, CustomerID, StaffAssignedID, CheckInTime"
                        + " FROM tblReservation "
                        + " WHERE IntervalTimeID BETWEEN ? AND ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, x);
                stm.setInt(2, y);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int reservationID = rs.getInt("ReservationID");
                    int customerID = rs.getInt("CustomerID");
                    int staffAssignedID = rs.getInt("StaffAssignedID");
                    String checkInTime = rs.getString("CheckInTime");
                    float price = rs.getFloat("Price");
                    ReservationDTO res = new ReservationDTO(reservationID, customerID, staffAssignedID, checkInTime, price);
                    result.add(res);
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

    public ReservationDTO queryResById(String id) throws SQLException, NamingException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID, CustomerID, PatientID, ServiceID, StaffAssignedID, CheckInTime "
                        + " FROM tblReservation "
                        + " WHERE ReservationID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int customerID = rs.getInt("CustomerID");
                    int patientID = rs.getInt("PatientID");
                    int serviceID = rs.getInt("ServiceID");
                    int staffAssignID = rs.getInt("StaffAssignedID");
                    String checkInDate = rs.getString("CheckInTime");
                    int reservationId = rs.getInt("ReservationID");
                    float price = rs.getFloat("Price");
                    ReservationDTO res = new ReservationDTO(customerID, patientID, serviceID, staffAssignID, checkInDate, reservationId, price);
                    return res;
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

    public List<ReservationDTO> getReservationByStaffID(String id) throws SQLException, NamingException {
        List<ReservationDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID, CustomerID, StaffAssignedID, CheckInTime"
                        + " FROM tblReservation "
                        + " WHERE StaffAssignedID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int reservationID = rs.getInt("ReservationID");
                    int customerID = rs.getInt("CustomerID");
                    int staffAssignedID = rs.getInt("StaffAssignedID");
                    String checkInTime = rs.getString("CheckInTime");
                    float price = rs.getFloat("Price");
                    ReservationDTO res = new ReservationDTO(reservationID, customerID, staffAssignedID, checkInTime, price);
                    result.add(res);
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

    public List<ReservationDTO> getReservationByIntervalTimeIDForStaff(int x, int y, String id) throws SQLException, NamingException {
        List<ReservationDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT ReservationID, CustomerID, StaffAssignedID, CheckInTime"
                        + " FROM tblReservation "
                        + " WHERE IntervalTimeID BETWEEN ? AND ? AND StaffAssignedID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, x);
                stm.setInt(2, y);
                stm.setString(3, id);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int reservationID = rs.getInt("ReservationID");
                    int customerID = rs.getInt("CustomerID");
                    int staffAssignedID = rs.getInt("StaffAssignedID");
                    String checkInTime = rs.getString("CheckInTime");
                    float price = rs.getFloat("Price");
                    ReservationDTO res = new ReservationDTO(reservationID, customerID, staffAssignedID, checkInTime, price);
                    result.add(res);
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

    public int countAllRes() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ReservationID) as Total"
                        + " FROM tblReservation ";
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

    public int countMonthlyRes() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ReservationID) as Total"
                        + " FROM tblReservation "
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

    public int countWeeklyRes() throws SQLException, NamingException {
        int sum = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(ReservationID) as Total"
                        + " FROM tblReservation "
                        + " WHERE CreatedDate >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) "
                        + " AND CreatedDate <  dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))";
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
