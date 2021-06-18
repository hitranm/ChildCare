<%-- 
    Document   : viewDetails
    Created on : Jun 17, 2021, 11:53:02 PM
    Author     : Admin
--%>

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
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Child Care System</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
            integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
            crossorigin="anonymous"
            />
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./css/homepage.css" />
        <link rel="stylesheet" href="css/footer.css"/>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main> 
            <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
            <c:set var="userProfileDTO" value="${sessionScope.USER_PROFILE}"/>

            <h1>Profile</h1>

            <form action="DispatchServlet" method="POST">
                <div> IdentityID: <input type="text" name="identityID" value="${userProfileDTO.identityDTO.identityID}" readonly></div>
                <div> Full Name:<input type="text" name="fullName" value="${userProfileDTO.fullName}" required="true"></div>
                <div> Address: <input type="text" name="address" value="${userProfileDTO.address}" required="true"></div>
                <div> Birthday: <input type="date" name="birthday" value="${userProfileDTO.birthday}" required="true"></div>
                <div> CitizenID: <input type="text" name="citizenID" value="${userProfileDTO.citizenID}" readonly></div>
                <div> Phone Number: <input type="text" name="phoneNum" value="${userProfileDTO.phoneNumber}" readonly></div>
                <div> Email: <input type="text" name="email" value="${userProfileDTO.identityDTO.email}" readonly></div>
                    <c:if test="${userProfileDTO.specialtyID != null}">
                    <div>   Chuyên khoa <select name="specialtyID" required="true">
                            <option>-Chuyên khoa-</option>
                            <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                                <c:if test="${userProfileDTO.specialtyID eq dto.specialtyId}">
                                    <option value="${dto.specialtyId}" selected>${dto.specialtyName}</option>
                                </c:if>
                                <c:if test="${userProfileDTO.specialtyID != dto.specialtyId}">
                                    <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                                </c:if>
                            </c:forEach>
                    </select>
                        </div>
                </c:if>
                
                <button type="submit" name="btAction" value="UpdateDetails"> Cập nhật</button>
            </form>


            <c:if test="${requestScope.SUCCESS !=null}">
                <div class="alert alert-success"role="alert">
                    ${requestScope.SUCCESS}
                </div>
            </c:if>
        </main>

        <jsp:include page="footer.jsp"/>        
        <a href="#" class="back-to-top"><i class="fas fa-arrow-up"></i></a>

        <!-- <script
          src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
          integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
          crossorigin="anonymous"
        ></script> -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>
        <!--Custom JS-->
        <script src="./js/main.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script>
            src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity = "sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin = "anonymous"
        </script>
        <script>
            $("#navbarDropdown").click(function () {
                $('.dropdown-toggle').dropdown();
            })

        </script>

    </body>
</html>

