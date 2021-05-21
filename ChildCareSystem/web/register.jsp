<%-- 
    Document   : register
    Created on : May 18, 2021, 11:07:47 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        
        <h1>Register Form</h1>
        <form action="DispatchServlet" method="POST">
            FullName<input type="text" name="fullName" value="" required="true"> </br>
            Email<input type="text" name="email" value="" pattern="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$" required="true"></br>
            ${ERROR.emailError}</br>
            Address<input type="text" name="address" value=""></br>
            Phone Number<input type="text" name="phoneNum" required="true"></br>
            ${SIGNUP_ERROR.phoneNumberError}
            ${ERROR1.phoneNumError}</br>
            Password<input type="password" name="password" required="true"></br>
            ${SIGNUP_ERROR.passwordError}
            ${ERROR.passwordError}</br>
            Confirm Password<input type="password" name="cpassword" required="true"></br>
            Birthday<input type="date" name="birthday" value=""></br>
            CitizenID<input type="text" name="citizenID" required="true"></br>
            ${SIGNUP_ERROR.citizenIDError}
            ${ERROR.citizenIDError}</br>
            <input type="hidden" name="roleID" value="3">
            <input type="submit" name="btAction" value="Register">
        </form>
    </body>
</html>
