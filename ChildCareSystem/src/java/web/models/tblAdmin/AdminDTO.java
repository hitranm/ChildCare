/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblAdmin;

import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class AdminDTO {
    private String IdentityID;
    private String FullName;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String phoneNumber;

    public String getIdentityID() {
        return IdentityID;
    }

    public String getFullName() {
        return FullName;
    }



    public String getAddress() {
        return Address;
    }

    public String getBirthday() {
        return Birthday;
    }

    public String getCitizenID() {
        return CitizenID;
    }

    public void setIdentityID(String IdentityID) {
        this.IdentityID = IdentityID;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }


    public void setAddress(String Address) {
        this.Address = Address;
    }

    public void setBirthday(String Birthday) {
        this.Birthday = Birthday;
    }

    public void setCitizenID(String CitizenID) {
        this.CitizenID = CitizenID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public AdminDTO(String IdentityID, String FullName, String Address, String Birthday, String CitizenID, String phoneNumber) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.phoneNumber = phoneNumber;
    }

    public AdminDTO(String FullName, String Address, String Birthday, String CitizenID, String phoneNumber) {
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.phoneNumber = phoneNumber;
    }


    
    
    
}
