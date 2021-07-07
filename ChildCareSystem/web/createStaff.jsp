<%-- 
    Document   : register
    Created on : May 30, 2021, 3:45:08 AM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff</title>
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }
            .wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .wrapper form {
                width: 100%;
            }

            .wrapper h1 {
                margin-bottom: 20px;
            }
        </style>
        
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'manager'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>

        <div class="wrapper container my-5 px-4">
            <h1>Tạo tài khoản nhân viên</h1>
            <form action="DispatchServlet" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Họ và tên</label>
                        <input type="text" class="form-control" id="fullName" value="${param.fullName}" name="fullName" required="true">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="birthday">Ngày sinh</label>
                        <input type="date" class="form-control" name="birthday" value="${param.birthday}" id="birthday">
                    </div>

                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="specialty">Chuyên khoa</label>
                        <select id="specialty" class="form-control" name="specialtyID">
                            <c:forEach var="specailtyDTO" items="${specialty.viewSpecialtyList()}">
                                <option value="${specailtyDTO.specialtyId}">${specailtyDTO.specialtyName}</option>
                            </c:forEach>                               
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" required="true">
                    </div>
                    <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedEmail}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.SIGNUP_ERROR.duplicatedEmail}
                        </div>
                    </c:if>               
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="phoneNumber">Số điện thoại</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNum" value="${param.phoneNum}" required="true">
                    </div>
                    <c:if test="${not empty requestScope.SIGNUP_ERROR.wrongFormatPhoneNumber}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.SIGNUP_ERROR.wrongFormatPhoneNumber}
                        </div>
                    </c:if>
                    <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedPhoneNum}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.SIGNUP_ERROR.duplicatedPhoneNum}
                        </div>
                    </c:if>     

                    <div class="form-group col-md-6">
                        <label for="citizenID">Căn cước công dân</label>
                        <input type="text" class="form-control" id="citizenID" name="citizenID" aria-describedby="citizenIDHelp" value="${param.citizenID}" required="true">
                        <small id="citizenIDHelp" class="form-text text-muted">Gồm 12 số</small>
                    </div>
                    <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedCitizenId}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.SIGNUP_ERROR.duplicatedCitizenId}
                        </div>
                    </c:if>
                </div>

                <div class="form-group">
                    <label for="address">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="address" value="${param.address}">
                </div>

                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" aria-describedby="passwordHelp" name="password" placeholder="Mật khẩu" required="true">
                            <small id="passwordHelp" class="form-text text-muted">Mật khẩu phải dài ít nhất 6 kí tự và không có kí tự đặc biệt</small>
                        </div>
                        <c:if test="${not empty requestScope.SIGNUP_ERROR.wrongFormatPassword}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.SIGNUP_ERROR.wrongFormatPassword}
                            </div>
                        </c:if>
                    </div>

                    <div class="col">
                        <div class="form-group">
                            <label for="cpassword">Xác nhận mật khẩu</label>
                            <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Mật khẩu" required="true">
                        </div>
                        <c:if test="${not empty requestScope.SIGNUP_ERROR.confirmPasswordNotMatch}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.SIGNUP_ERROR.confirmPasswordNotMatch}
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="form-row">

                </div>
                <input type="hidden" name="roleID" value="2">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-md-4" name="btAction" value="AddStaff">Đăng ký</button>
                </div>

            </form>

        </div>

    </div>


    <jsp:include page="footer.jsp"/>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
