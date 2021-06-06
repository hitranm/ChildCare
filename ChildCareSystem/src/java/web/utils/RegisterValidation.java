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
    private String wrongFormatPhoneNumber;
    private String wrongFormatPassword;
    private String wrongFormatCitizenId;
    private String duplicatedPhoneNum;
    private String duplicatedCitizenId;
    private String duplicatedEmail;
    private String confirmPasswordNotMatch;

    public String getDuplicatedEmail() {
        return duplicatedEmail;
    }

    public void setDuplicatedEmail(String duplicatedEmail) {
        this.duplicatedEmail = duplicatedEmail;
    }

    public String getWrongFormatPhoneNumber() {
        return wrongFormatPhoneNumber;
    }

    public void setWrongFormatPhoneNumber(String wrongFormatPhoneNumber) {
        this.wrongFormatPhoneNumber = wrongFormatPhoneNumber;
    }

    public String getWrongFormatPassword() {
        return wrongFormatPassword;
    }

    public void setWrongFormatPassword(String wrongFormatPassword) {
        this.wrongFormatPassword = wrongFormatPassword;
    }

    public String getWrongFormatCitizenId() {
        return wrongFormatCitizenId;
    }

    public void setWrongFormatCitizenId(String wrongFormatCitizenId) {
        this.wrongFormatCitizenId = wrongFormatCitizenId;
    }

    public String getDuplicatedPhoneNum() {
        return duplicatedPhoneNum;
    }

    public void setDuplicatedPhoneNum(String duplicatedPhoneNum) {
        this.duplicatedPhoneNum = duplicatedPhoneNum;
    }

    public String getDuplicatedCitizenId() {
        return duplicatedCitizenId;
    }

    public void setDuplicatedCitizenId(String duplicatedCitizenId) {
        this.duplicatedCitizenId = duplicatedCitizenId;
    }

    public String getConfirmPasswordNotMatch() {
        return confirmPasswordNotMatch;
    }

    public void setConfirmPasswordNotMatch(String confirmPasswordNotMatch) {
        this.confirmPasswordNotMatch = confirmPasswordNotMatch;
    }
    
    


    
    
    
    
}
