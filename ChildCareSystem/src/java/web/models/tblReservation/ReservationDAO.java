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

    public void AddReservation() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            //1. Connect DB
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create query string
                String sql = "INSERT INTO "
                        + "tblReservation (CustomerID, PatientID, ServiceID, StaffAssignedID, IntervalTimeID, CheckInTime) "
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
}
