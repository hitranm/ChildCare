/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.viewModels.Reservation;

/**
 *
 * @author nguye
 */
public class ReservationHistoryDTO {
    private int reservationID;
    private String patientName;
    private String serviceName;
    private String checkInTime;
    private String createdDate;

    public ReservationHistoryDTO() {
    }

    public ReservationHistoryDTO(int reservationID, String patientName, String serviceName, String checkInTime, String createdDate) {
        this.reservationID = reservationID;
        this.patientName = patientName;
        this.serviceName = serviceName;
        this.checkInTime = checkInTime;
        this.createdDate = createdDate;
    }

    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        this.checkInTime = checkInTime;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

   
    
}
