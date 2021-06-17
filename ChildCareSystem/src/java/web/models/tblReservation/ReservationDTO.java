/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblReservation;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class ReservationDTO implements Serializable{
    private String customerName;
    private String customerEmail;
    private String phoneNumber;
    private String patientName;
    private String patientBirthday;
    private boolean patienGender;
    private String serviceId;
    private String staffAssignedId;
    private String intervalTimeId;
    private String checkInTime;
    private String updatedDate;
    public ReservationDTO() {
    }

    public ReservationDTO(String customerName, String customerEmail, String phoneNumber, String patientName, String patientBirthday, boolean patienGender, String serviceId, String staffAssignedId, String intervalTimeId, String checkInTime, String updatedDate) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.phoneNumber = phoneNumber;
        this.patientName = patientName;
        this.patientBirthday = patientBirthday;
        this.patienGender = patienGender;
        this.serviceId = serviceId;
        this.staffAssignedId = staffAssignedId;
        this.intervalTimeId = intervalTimeId;
        this.checkInTime = checkInTime;
        this.updatedDate = updatedDate;
    }

    public ReservationDTO(String customerName, String customerEmail, String phoneNumber, String patientName, String patientBirthday, boolean patienGender, String serviceId) {
        this.customerName = customerName;
        this.customerEmail = customerEmail;
        this.phoneNumber = phoneNumber;
        this.patientName = patientName;
        this.patientBirthday = patientBirthday;
        this.patienGender = patienGender;
        this.serviceId = serviceId;
    }
    
    

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientBirthday() {
        return patientBirthday;
    }

    public void setPatientBirthday(String patientBirthday) {
        this.patientBirthday = patientBirthday;
    }

    public boolean isPatienGender() {
        return patienGender;
    }

    public void setPatienGender(boolean patienGender) {
        this.patienGender = patienGender;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getStaffAssignedId() {
        return staffAssignedId;
    }

    public void setStaffAssignedId(String staffAssignedId) {
        this.staffAssignedId = staffAssignedId;
    }

    public String getIntervalTimeId() {
        return intervalTimeId;
    }

    public void setIntervalTimeId(String intervalTimeId) {
        this.intervalTimeId = intervalTimeId;
    }

    public String getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        this.checkInTime = checkInTime;
    }

    public String getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(String updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    
    
    
    
    
    
}
