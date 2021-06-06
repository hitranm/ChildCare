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
    private String Email;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String code;
    
    public CustomerDTO() {
    }
    
    public CustomerDTO(String email, String code) {
        this.Email = email;
        this.code = code;
    }
    
    public CustomerDTO(String identityID ,String fullName, String email, String address, String birthday, String citizenID) {
        this.IdentityID= identityID;
        this.FullName = fullName;
        this.Email = email;
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
    
    //    public CustomerDTO(String identityID ,String fullName, String email, String address, String birthday, String citizenID, String roleID) {
//        this.FullName = fullName;
//        this.Email = email;
//        this.Address = address;
//        this.Birthday = birthday;
//        this.CitizenID = citizenID;
//        this.RoleID= roleID;
//        this.IdentityID= identityID;
//    }

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

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
    
    
    
    @Override
    public String toString() {
        return "CustomerDTO{" + "IdentityID=" + IdentityID + ", FullName=" + FullName + ", Email=" + Email + ", Address=" + Address + ", Birthday=" + Birthday + ", CitizenID=" + CitizenID + '}';
    }
}
