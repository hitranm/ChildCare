/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblCustomer;

/**
 *
 * @author Admin
 */
public class CustomerDTO {
    private String IdentityID;
    private String FullName;
    private String Email;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String code;
    private String RoleID;
    
    public CustomerDTO() {
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public CustomerDTO(String email, String code) {
        this.Email = email;
        this.code = code;
    }

  

    public String getFullName() {
        return FullName;
    }

    public String getEmail() {
        return Email;
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

    public void setFullName(String fullName) {
        this.FullName = fullName;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public void setAddress(String address) {
        this.Address = address;
    }

    public void setBirthday(String birthday) {
        this.Birthday = birthday;
    }

    public void setCitizenID(String citizenID) {
        this.CitizenID = citizenID;
    }

    public CustomerDTO(String identityID ,String fullName, String email, String address, String birthday, String citizenID) {
        this.IdentityID= identityID;
        this.FullName = fullName;
        this.Email = email;
        this.Address = address;
        this.Birthday = birthday;
        this.CitizenID = citizenID;
    }

    public String getIdentityID() {
        return IdentityID;
    }

    public void setIdentityID(String identityID) {
        this.IdentityID = identityID;
    }

    public CustomerDTO(String fullName, String email, String address, String birthday, String citizenID, String roleID, String IdentityID) {
        this.FullName = fullName;
        this.Email = email;
        this.Address = address;
        this.Birthday = birthday;
        this.CitizenID = citizenID;
        this.RoleID= roleID;
        this.IdentityID= IdentityID;
    }

    public String getRoleID() {
        return RoleID;
    }

    public void setRoleID(String roleID) {
        this.RoleID = roleID;
    }

    public CustomerDTO(String IdentityID, String FullName, String Address, String Birthday) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Address = Address;
        this.Birthday = Birthday;
    }

   

   
}
