/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.utils;

import java.io.Serializable;

/**
 *This static class is used to validate some field
 * @author HOANGKHOI
 */
public class CheckValidHelper implements Serializable {

    public static boolean checkPassword(String password, String cpassword) {
        boolean check = true;
        if (password.equals(cpassword)) {
            return check;
        } else {
            check = false;
            return check;
        }
    }
    
    public static boolean checkPasswordLength(String password) {
        if (password.trim().length() < 6 || password.trim().length() > 50) {
            return false;
        } else return true;
    }
}
