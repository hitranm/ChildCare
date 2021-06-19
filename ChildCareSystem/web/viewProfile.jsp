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
        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
        <jsp:include page="header.jsp"/>

        <c:set var="userProfileDTO" value="${sessionScope.USER_PROFILE}"/>
        <style>
            .wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 4rem 0 6rem 0;
               
            }

            .wrapper form {
                width: 40%;
               
            }

            .wrapper h1 {
                margin-bottom: 20px;
            }
        </style>
        <div class="wrapper px-5">
        <h1>Thông tin tài khoản</h1>
        
        <form action="DispatchServlet" method="POST">
            <div class="form-row">
             <label for="fullNanme">Họ và tên</label>
             <input type="text" name="fullName" class="form-control" value="${userProfileDTO.fullName}" required="true"></div>
            <div class="form-row">  
                <label for="fullNanme">Địa chỉ</label>
                <input type="text" name="address" class="form-control" value="${userProfileDTO.address}" required="true"></div>
                
            <div class="form-row"> 
                <div class="form-group col-md-6">
                <label for="fullNanme">Ngày sinh</label>
                <input type="date" name="birthday" class="form-control" value="${userProfileDTO.birthday}" required="true">
            </div>
            <div class="form-group col-md-6"> 
                <label for="fullNanme">CCCD</label>
                <input type="text" name="citizenID" class="form-control" value="${userProfileDTO.citizenID}" readonly></div>
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
                   <label for="fullNanme">Chuyên khoa</label> <select name="specialtyID" class="form-control" required="true">
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
             <input type="hidden" name="identityID" value="${userProfileDTO.identityDTO.identityID}"> </br>
                <div class="text-center">
            <button type="submit" name="btAction" class="btn btn-primary col-md-4" value="UpdateProfile">Cập nhật</button>
                </div>
        </form>
                <c:if test="${requestScope.SUCCESS !=null}">
                    <div class="alert alert-success"role="alert">
                            ${requestScope.SUCCESS}
                        </div>
                </c:if>

        </div>
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
