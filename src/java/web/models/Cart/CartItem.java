/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.Cart;

import java.io.Serializable;

/**
 *
 * @author HOANGKHOI
 */
public class CartItem implements Serializable {
    private int customerId;    
    private int patientId;
    private int serviceId;
    private int timeIntervalId;
    private String checkInTime;
   
    public CartItem() {
    }

    public CartItem(int customerId, int patientId, int serviceId, int timeIntervalId, String checkInTime) {
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.timeIntervalId = timeIntervalId;
        this.checkInTime = checkInTime;
    }
    
    

    public CartItem(int customerId, int patientId, int serviceId, String checkInTime) {
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.checkInTime = checkInTime;
    }
    
    public CartItem(int customerId, int patientId, int serviceId, int timeIntervalId) {
        this.customerId = customerId;
        this.patientId = patientId;
        this.serviceId = serviceId;
        this.timeIntervalId = timeIntervalId;
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

    public int getTimeIntervalId() {
        return timeIntervalId;
    }

    public void setTimeIntervalId(int timeIntervalId) {
        this.timeIntervalId = timeIntervalId;
    }

    public String getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(String checkInTime) {
        this.checkInTime = checkInTime;
    }
    
    

    
    
   

    
    
    
    
    
    
    

    
    
    
}
