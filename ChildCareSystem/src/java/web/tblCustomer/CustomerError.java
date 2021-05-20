/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.tblCustomer;

/**
 *
 * @author Admin
 */
public class CustomerError {
    private String citizenIDError;
    private String passwordError;
    private String emailError;

    public CustomerError() {
    }

    public String getCitizenIDError() {
        return citizenIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setCitizenIDError(String citizenIDError) {
        this.citizenIDError = citizenIDError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }
    
}
