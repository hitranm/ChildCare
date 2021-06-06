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
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>


        <h1>Phiếu đăng ký</h1>
        <form action="DispatchServlet" method="POST">
            <div class="form-group">
                <label for="fullNanme">Họ và tên</label>
                <input type="text" class="form-control" id="fullName" value="${param.fullName}" placeholder="Họ và tên" name="fullName" required="true">
            </div>
            <div class="form-row">
                <div class="col">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" placeholder="Email" required="true">
                    </div>
                    <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedEmail}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.SIGNUP_ERROR.duplicatedEmail}
                        </div>
                    </c:if>
                </div>

                <div class="col">
                    <div class="form-group">
                        <label for="phoneNumber">Số điện thoại</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNum" value="${param.phoneNum}" placeholder="Số điện thoại" required="true">
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
                </div>

            </div>
            <div class="form-group">
                <label for="address">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ" value="${param.address}">
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

            <div class="form-group">
                <label for="birthday">Ngày sinh</label>
                <input type="date" class="form-control" name="birthday" value="${param.birthday}" id="birthday">
            </div>

            <div class="form-group">
                <label for="citizenID">CCCD</label>
                <input type="text" class="form-control" id="citizenID" name="citizenID" aria-describedby="citizenIDHelp" placeholder="CCCD" value="${param.citizenID}" required="true">
                <small id="citizenIDHelp" class="form-text text-muted">Gồm 12 số</small>
            </div>
            <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedCitizenId}">
                <div class="alert alert-danger" role="alert">
                    ${requestScope.SIGNUP_ERROR.duplicatedCitizenId}
                </div>
            </c:if>
            <input type="hidden" name="roleID" value="1">
            </div>
            <button type="submit" class="btn btn-primary" name="btAction" value="Register">Đăng ký</button>
        </form>



        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
