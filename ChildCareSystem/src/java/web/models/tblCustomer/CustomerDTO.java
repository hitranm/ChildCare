/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblCustomer;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class CustomerDTO implements Serializable{
    private String IdentityID;
    private String FullName;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String code;
    private String phoneNumber;
    
    public CustomerDTO() {
    }
    
//    public CustomerDTO(String email, String code) {
//        this.PhoneNum = PhoneNum;
//        this.code = code;
//    }
//    
    public CustomerDTO(String identityID ,String fullName, String phoneNumber, String address, String birthday, String citizenID) {
        this.IdentityID= identityID;
        this.FullName = fullName;
        this.phoneNumber = phoneNumber;
        this.Address = address;
        this.Birthday = birthday;
        this.CitizenID = citizenID;
    }
    
    public CustomerDTO(String IdentityID, String FullName, String Address, String Birthday) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
    }

    public CustomerDTO(String code, String phoneNumber) {
        this.code = code;
        this.phoneNumber = phoneNumber;
    }

    public CustomerDTO(String IdentityID, String FullName, String phoneNumber) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.phoneNumber = phoneNumber;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "CustomerDTO{" + "IdentityID=" + IdentityID + ", FullName=" + FullName + ", PhoneNum=" + phoneNumber + ", Address=" + Address + ", Birthday=" + Birthday + ", CitizenID=" + CitizenID + ", code=" + code + '}';
    }
    
    
}
