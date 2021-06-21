/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblReservation;

import java.io.Serializable;
import java.util.logging.Logger;

/**
 *
 * @author HOANGKHOI
 */
public class ReservationDTO implements Serializable{
    private int reservationId;
    private int customerId;
    private int patientId;
    private int serviceId;
    private int staffAssignId;
    private int timeIntervalId;
    private String checkInDate;
    private String updatedDate;

    public ReservationDTO() {
    }

    public ReservationDTO(int reservationId, int customerId, int patientId, int serviceId, int staffAssignId, int timeIntervalId, String checkInDate, String updatedDate) {
        this.reservationId = reservationId;
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.staffAssignId = staffAssignId;
        this.timeIntervalId = timeIntervalId;
        this.checkInDate = checkInDate;
        this.updatedDate = updatedDate;
    }

    public ReservationDTO(int customerId, int patientId, int serviceId, int timeIntervalId) {
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.timeIntervalId = timeIntervalId;
    }

    public ReservationDTO(int customerId, int patientId, int serviceId, int staffAssignId, int timeIntervalId) {
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.staffAssignId = staffAssignId;
        this.timeIntervalId = timeIntervalId;
    }

    public ReservationDTO(int patientId, int serviceId, int timeIntervalId) {
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.timeIntervalId = timeIntervalId;
    }

    public ReservationDTO(int customerId, int patientId, int serviceId, int staffAssignId, int timeIntervalId, String checkInDate) {
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.staffAssignId = staffAssignId;
        this.timeIntervalId = timeIntervalId;
        this.checkInDate = checkInDate;
    }
    
    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getStaffAssignId() {
        return staffAssignId;
    }

    public void setStaffAssignId(int staffAssignId) {
        this.staffAssignId = staffAssignId;
    }

    public int getTimeIntervalId() {
        return timeIntervalId;
    }

    public void setTimeIntervalId(int timeIntervalId) {
        this.timeIntervalId = timeIntervalId;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    
    

    
    
    
    
    
    
    
    
    
}
