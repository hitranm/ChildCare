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
    private String PhoneNum;
    
    public CustomerDTO() {
    }
    
//    public CustomerDTO(String email, String code) {
//        this.PhoneNum = PhoneNum;
//        this.code = code;
//    }
//    
    public CustomerDTO(String identityID ,String fullName, String phoneNum, String address, String birthday, String citizenID) {
        this.IdentityID= identityID;
        this.FullName = fullName;
        this.PhoneNum = phoneNum;
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

    public CustomerDTO(String code, String PhoneNum) {
        this.code = code;
        this.PhoneNum = PhoneNum;
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

    public String getPhoneNum() {
        return PhoneNum;
    }

    public void setPhoneNum(String PhoneNum) {
        this.PhoneNum = PhoneNum;
    }
    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public String toString() {
        return "CustomerDTO{" + "IdentityID=" + IdentityID + ", FullName=" + FullName + ", PhoneNum=" + PhoneNum + ", Address=" + Address + ", Birthday=" + Birthday + ", CitizenID=" + CitizenID + ", code=" + code + '}';
    }
    
    
}
