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
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <link rel="stylesheet" href="css/homepage.css">
        <title>Profile Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <c:set var="userProfileDTO" value="${sessionScope.USER_PROFILE}"/>
        <h1>Your Profile</h1>
        <h1>${CUSTOMER_ID}</h1>
        <form action="DispatchServlet">
            <div> Full Name:<input type="text" name="fullName" value="${userProfileDTO.fullName}" required="true"></div>
            <div> Address: <input type="text" name="address" value="${userProfileDTO.address}" required="true"></div>
            <div> Birthday: <input type="text" name="birthday" value="${userProfileDTO.birthday}" required="true"></div>
            <div> CitizenID: <input type="text" name="citizenID" value="${userProfileDTO.citizenID}" readonly></div>
            <div> Phone Number: <input type="text" name="phoneNum" value="${userProfileDTO.phoneNumber}" readonly></div>
            <div> Email: <input type="text" name="email" value="${userProfileDTO.identityDTO.email}" readonly></div>
                <c:if test="${userProfileDTO.specialtyID != null}">
                <div> SpecialtyID: <input type="text" name="specialtyID" value="${userProfileDTO.specialtyID}" readonly></div>
                </c:if>
            <button type="submit" name="btAction" value="UpdateProfile">Cập nhật</button>
        </form>
        


        <jsp:include page="footer.jsp"/> 

        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>
        <script>
            $("#navbarDropdown").click(function () {
                $('.dropdown-toggle').dropdown();
            })

        </script>

    </body>
</html>
