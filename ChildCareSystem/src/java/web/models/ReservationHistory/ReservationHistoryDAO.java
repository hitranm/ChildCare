/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.ReservationHistory;

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
 * @author nguye
 */
public class ReservationHistoryDAO {
    public List<ReservationHistoryDTO> getAllPatientReservation(String customerID) throws SQLException, NamingException {
        List<ReservationHistoryDTO> result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBHelpers.makeConnection();
            if (conn != null) {
                String sql = "SELECT R.ReservationID, P.PatientName, S.ServiceName, R.CheckInTime, R.CreatedDate "
                        + "FROM tblCustomer C, tblPatient P, tblService S, tblReservation R "
                        + "WHERE C.CustomerID = R.CustomerID AND P.PatientID=R.PatientID AND S.ServiceID=R.ServiceID AND R.CustomerID=? "
                        + "ORDER BY R.CreatedDate DESC";
                stm = conn.prepareStatement(sql);
                stm.setString(1, customerID);
                rs = stm.executeQuery();
                result = new ArrayList<>();
                while (rs.next()) {
                    int reservationID = rs.getInt("ReservationID");
                    String patientName = rs.getString("PatientName");
                    String serviceName = rs.getString("ServiceName");
                    String checkInTime = rs.getString("CheckInTime");
                    String createdDate = rs.getString("CreatedDate");
                    ReservationHistoryDTO history = new ReservationHistoryDTO(reservationID, patientName, serviceName, checkInTime, createdDate);
                    result.add(history);
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
