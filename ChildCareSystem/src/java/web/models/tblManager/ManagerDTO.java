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
    private String Email;
    private String Address;
    private String Birthday;
    private String CitizenID;
    private String RoleID;

    public String getIdentityID() {
        return IdentityID;
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

    public void setIdentityID(String IdentityID) {
        this.IdentityID = IdentityID;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public void setEmail(String Email) {
        this.Email = Email;
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

    public ManagerDTO(String FullName, String Email, String Address, String Birthday, String CitizenID, String RoleID) {
        this.FullName = FullName;
        this.Email = Email;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.RoleID= RoleID;
    }

    public ManagerDTO() {
    }

    public String getRoleID() {
        return RoleID;
    }

    public void setRoleID(String roleID) {
        this.RoleID = roleID;
    }

    public ManagerDTO(String IdentityID, String FullName, String Email, String Address, String Birthday, String CitizenID, String RoleID) {
        this.IdentityID = IdentityID;
        this.FullName = FullName;
        this.Email = Email;
        this.Address = Address;
        this.Birthday = Birthday;
        this.CitizenID = CitizenID;
        this.RoleID = RoleID;
    }

   
}
