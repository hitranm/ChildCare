/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblStaff;

/**
 *
 * @author DELL
 */
public class StaffDTO {
    private String IdentityID;
    private String StaffID;
    private String FullName;
    private String phoneNumber;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String SpecialtyID;
    
    

    public StaffDTO() {
    }

    public StaffDTO(String IdentityID, String StaffID, String FullName, String phoneNumber, String Address, String Birthday, String CitizenID, String SpecialtyID) {
        this.IdentityID = IdentityID;
        this.StaffID = StaffID;
        this.FullName = FullName;
        this.phoneNumber = phoneNumber;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.SpecialtyID = SpecialtyID;
    }
    
    public StaffDTO(String IdentityID, String FullName, String phoneNumber) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.phoneNumber = phoneNumber;
    }

    public StaffDTO(String FullName, String SpecialtyID) {
        this.FullName = FullName;
        this.SpecialtyID = SpecialtyID;
    }
    
    public StaffDTO(String IdentityID, String FullName, String phoneNumber, String Address, String Birthday, String CitizenID, String SpecialtyID) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.phoneNumber = phoneNumber;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.SpecialtyID = SpecialtyID;
    }
 
    public StaffDTO(String IdentityID, String FullName, String Address, String Birthday) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
    }

    public String getIdentityID() {
        return IdentityID;
    }

    public void setIdentityID(String IdentityID) {
        this.IdentityID = IdentityID;
    }

    public String getFullName() {
        return FullName;
    }
    
    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getBirthday() {
        return Birthday;
    }

    public void setBirthday(String Birthday) {
        this.Birthday = Birthday;
    }

    public String getCitizenID() {
        return CitizenID;
    }

    public void setCitizenID(String CitizenID) {
        this.CitizenID = CitizenID;
    }

    public String getSpecialtyID() {
        return SpecialtyID;
    }
    
    public void setSpecialtyID(String SpecialtyID) {
        this.SpecialtyID = SpecialtyID;
    }

    public String getStaffID() {
        return StaffID;
    }

    public void setStaffID(String StaffID) {
        this.StaffID = StaffID;
    }

    

    

    
    
    
}
