/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.utils;

/**
 *
 * @author Admin
 */
public class RegisterValidation {
    private String phoneNumberError;
    private String passwordError;
    private String citizenIDError;



    public String getPhoneNumberError() {
        return phoneNumberError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public String getCitizenIDError() {
        return citizenIDError;
    }



    public void setPhoneNumberError(String phoneNumberError) {
        this.phoneNumberError = phoneNumberError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public void setCitizenIDError(String citizenIDError) {
        this.citizenIDError = citizenIDError;
    }
    
}
