/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblIdentity;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class IdentityDTO implements Serializable {

    private String identityID;
    private String email;
    private String password;
    private String roleID;
    private int statusID;

    public IdentityDTO(String identityID, String email, String password, String roleID, int statusID) {
        this.identityID = identityID;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public IdentityDTO(String identityID, String roleID) {
        this.identityID = identityID;
        this.roleID = roleID;
    }

    public IdentityDTO(String email, String password, String roleID) {
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }

    public IdentityDTO(String identityID, String roleID, int statusID) {
        this.identityID = identityID;
        this.roleID = roleID;
        this.statusID = statusID;
    }

    public IdentityDTO(String identityID, String email, String password, String roleID) {
        this.identityID = identityID;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getIdentityID() {
        return identityID;
    }

    public void setIdentityID(String identityID) {
        this.identityID = identityID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

}
