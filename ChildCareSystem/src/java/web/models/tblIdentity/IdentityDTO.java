/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblIdentity;

/**
 *
 * @author Admin
 */
public class IdentityDTO {
    private String identityID;
    private String phoneNum;
    private String password;
    private String roleID;

    public String getPhoneNum() {
        return phoneNum;
    }

    public String getPassword() {
        return password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public IdentityDTO(String phoneNum, String password, String roleID) {
        this.phoneNum = phoneNum;
        this.password = password;
        this.roleID = roleID;
    }

    public String getIdentityID() {
        return identityID;
    }

    public void setIdentityID(String identityID) {
        this.identityID = identityID;
    }

    public IdentityDTO(String identityID, String roleID) {
        this.identityID = identityID;
        this.roleID = roleID;
    }
    
}
