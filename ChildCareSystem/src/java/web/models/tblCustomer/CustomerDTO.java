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
    private String identityID;
    private String fullName;
    private String email;
    private String address;
    private String birthday;
    private String citizenID;

    public CustomerDTO() {
    }

  

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public String getBirthday() {
        return birthday;
    }

    public String getCitizenID() {
        return citizenID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setCitizenID(String citizenID) {
        this.citizenID = citizenID;
    }

    public CustomerDTO(String identityID ,String fullName, String email, String address, String birthday, String citizenID) {
        this.identityID= identityID;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.birthday = birthday;
        this.citizenID = citizenID;
    }

    public String getIdentityID() {
        return identityID;
    }

    public void setIdentityID(String identityID) {
        this.identityID = identityID;
    }

   
}
