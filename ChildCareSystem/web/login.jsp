<%-- 
    Document   : register
    Created on : May 18, 2021, 10:55:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo Page</title>
    </head>
    <body>
        <form action="DispatchServlet" method="POST">
            PhoneNum <input type="text" name="phoneNum" value="" pattern="[0-9]{10}" required="true"> </br>
            Password<input type="password" name="password" value="" required="true"> </br>
            ${requestScope.MSG}</br>
            <input type="submit" name="btAction" value="Login">
        </form>
        
        <a href="register.jsp">Register</a>
    </body>
</html>
