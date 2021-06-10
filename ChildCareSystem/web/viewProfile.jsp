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
        <form action="DispatchServlet">
        <div> Full Name:<input type="text" name="fullName" value="${userProfileDTO.fullName}" required="true"></div>
        <div> Address: <input type="text" name="address" value="${userProfileDTO.address}" required="true"></div>
        <div> Birthday: <input type="text" name="birthday" value="${userProfileDTO.birthday}" required="true"></div>
        <div> CitizenID: <input type="text" name="citizenID" value="${userProfileDTO.citizenID}" readonly></div>
        <div> Phone Number: <input type="text" name="phoneNum" value="${userProfileDTO.phoneNumber}" readonly></div>
        <c:if test="${userProfileDTO.specialtyID != null}">
        <div> SpecialtyID: <input type="text" name="specialtyID" value="${userProfileDTO.specialtyID}" readonly></div>
        </c:if>
        <button type="submit" name="btAction" value="UpdateProfile">Cập nhật</button>
        </form>
        <a href="home.jsp">Back to Homepage</a>
    </body>
</html>
