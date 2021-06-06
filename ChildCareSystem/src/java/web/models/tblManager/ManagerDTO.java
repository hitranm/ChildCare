/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblManager;

/**
 *
 * @author Admin
 */
public class ManagerDTO {
    private String IdentityID;
    private String FullName;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String PhoneNumber;
    
    public ManagerDTO() {
    }

    public ManagerDTO(String IdentityID, String FullName, String Address, String Birthday, String CitizenID, String PhoneNumber) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.PhoneNumber = PhoneNumber;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }
    
    
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
}
