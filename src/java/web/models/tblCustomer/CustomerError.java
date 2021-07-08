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
public class CustomerError {
    private String citizenIDDupError;
    private String passwordError;
    private String emailDupError;

    public CustomerError() {
    }

    public String getCitizenIDDupError() {
        return citizenIDDupError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setCitizenIDDupError(String citizenIDDupError) {
        this.citizenIDDupError = citizenIDDupError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getEmailDupError() {
        return emailDupError;
    }

    public void setEmailDupError(String emailDupError) {
        this.emailDupError = emailDupError;
    }
    
}
