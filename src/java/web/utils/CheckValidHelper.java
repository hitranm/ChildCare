/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.utils;

import java.io.Serializable;

/**
 * This static class is used to validate some field
 *
 * @author HOANGKHOI
 */
public class CheckValidHelper implements Serializable {

    public static boolean checkPasswordLength(String password) {
        if (password.trim().length() < 6 || password.trim().length() > 50) {
            return false;
        } else {
            return true;
        }
    }

    public static boolean checkConfirmPassword(String password, String cpassword) {
        return password.equals(cpassword);
    }

    public static boolean IsFormatPassword(String password) {
        return password.matches("(?!.*[!@#&()–[{}]:;',?/*~$^+=<>])[a-z0-9A-Z_-]{6,}$");
    }
    
    public static boolean IsValidCitizenIdLength(String citizenId) {
        return citizenId.length() == 9 || citizenId.length() == 12;
    }
    
    public static boolean IsValidPhoneNumberLength(String phoneNum) {
        return phoneNum.length() == 10;
    }

}
