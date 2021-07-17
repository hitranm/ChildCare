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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/homepage.css" />
        <link rel="stylesheet" href="css/footer.css"/>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            .wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 4rem 0 6rem 0;

            }

            .wrapper form {
                width: 30%;

            }

            .wrapper h1 {
                margin-bottom: 20px;
            }
            .loader {
                position: fixed;
                z-index: 99;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .loader > img {
                width: 100px;
            }

            .loader.hidden {
                animation: fadeOut 1s;
                animation-fill-mode: forwards;
            }

            @keyframes fadeOut {
                100% {
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main> 
            <div class="loader">
                <img src="images/loading.gif" alt="Loading..." />
            </div>
            <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
            <c:set var="userProfileDTO" value="${sessionScope.USER_PROFILE1}"/>

            <div class="wrapper px-5">
                <h1>Thông tin tài khoản</h1>

                <form action="DispatchServlet?btAction=UpdateDetails" method="POST">
                    <div class="form-row">
                        <label for="fullNanme">IdentityID</label>
                        <input type="text" name="identityID" class="form-control" value="${userProfileDTO.identityDTO.identityID}" readonly>
                    </div>
                    <div class="form-row">
                        <label for="fullNanme">Họ và tên</label>
                        <input type="text" name="fullName" class="form-control" value="${userProfileDTO.fullName}" required="true">
                    </div>
                    <div class="form-row">
                        <label for="fullNanme">Địa chỉ</label>
                        <input type="text" name="address" class="form-control" value="${userProfileDTO.address}" required="true">
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="fullNanme">Ngày sinh</label>
                            <input type="date" name="birthday" class="form-control" value="${userProfileDTO.birthday}" required="true">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="fullNanme">CCCD</label>
                            <input type="text" name="citizenID" class="form-control" value="${userProfileDTO.citizenID}" readonly>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="fullNanme">Số điện thoại</label> 
                            <input type="text" name="phoneNum" class="form-control" value="${userProfileDTO.phoneNumber}" readonly>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="fullNanme">Email</label> 
                            <input type="text" name="email" class="form-control" value="${userProfileDTO.identityDTO.email}" readonly>
                        </div>
                    </div>
                    <c:if test="${userProfileDTO.specialtyID != null}">
                        <div class="form-row">  
                            <label for="fullNanme">Chuyên khoa</label>
                            <select name="specialtyID" class="form-control" required="true">
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
                    </br>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary col-md-4"> Cập nhật</button>
                    </div>
                </form>


                <c:if test="${requestScope.SUCCESS !=null}">
                    <div class="alert alert-success"role="alert">
                        ${requestScope.SUCCESS}
                    </div>
                </c:if>
        </main>
    </div>
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
    <script>
        window.addEventListener('load', function () {
            const loader = document.querySelector(".loader");
            loader.className += " hidden"; // class "loader hidden"
        });
    </script>

</body>
</html>

