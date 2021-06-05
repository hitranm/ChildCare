<%-- 
    Document   : viewProfile
    Created on : Jun 3, 2021, 9:57:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <h1>Your Profile</h1>
        <div> Full Name: ${sessionScope.LOGIN_USER.fullName}</div>
        <div> Address: ${sessionScope.LOGIN_USER.address}</div>
        <div> Birthday: ${sessionScope.LOGIN_USER.birthday}</div>
        <div> CitizenID: ${sessionScope.LOGIN_USER.citizenID}</div>
        <div> Email: ${sessionScope.LOGIN_USER.email}</div>
        <a href="editProfile.jsp"> Edit Profile </a>
    </body>
</html>
