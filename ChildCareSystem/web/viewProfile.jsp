<%-- 
    Document   : viewProfile
    Created on : Jun 3, 2021, 9:57:49 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <c:set var="userProfileDTO" value="${sessionScope.USER_PROFILE}"/>
        <h1>Your Profile</h1>
        <div> Full Name: ${userProfileDTO.fullName}</div>
        <div> Address: ${userProfileDTO.address}</div>
        <div> Birthday: ${userProfileDTO.birthday}</div>
        <div> CitizenID: ${userProfileDTO.citizenId}</div>
        <div> Email: ${userProfileDTO.identityDTO.email}</div>
        <a href="editProfile.jsp"> Edit Profile </a>
    </body>
</html>
