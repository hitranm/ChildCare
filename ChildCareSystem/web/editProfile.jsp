<%-- 
    Document   : editProfile
    Created on : Jun 3, 2021, 10:18:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile Page</title>
    </head>
    <body>
        <form action="DispatchServlet">
        
        Full Name <input type="text" name="fullName" value="${sessionScope.LOGIN_USER.fullName}" required="true"></br>
        Email <input type="text" name="email" value="${sessionScope.LOGIN_USER.email}" readonly></br>
        Address<input type="text" name="address" value="${sessionScope.LOGIN_USER.address}" required="true"></br>
        Birthday <input type="date" name="birthday" value="${sessionScope.LOGIN_USER.birthday}"></br>
        CitizenID<input type="text" name="citizenID" value="${sessionScope.LOGIN_USER.citizenID}" readonly></br>
        
        <input type="hidden" name="roleID" value="${sessionScope.LOGIN_USER.roleID}">
        <input type="hidden" name="identityID" value="${sessionScope.IDENTITYID}">
        <button type="submit" name="btAction" value="UpdateProfile">Cập nhật</button>
        </form>
    </body>
</html>
