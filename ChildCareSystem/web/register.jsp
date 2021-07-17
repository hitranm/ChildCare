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
        <title>Trang đăng kí</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            * {
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
        

        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>
        <div class="wrapper container my-5 px-4">
            <h1>Phiếu đăng ký</h1>
            <form action="DispatchServlet?btAction=Register" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Họ và tên</label>
                        <input type="text" class="form-control" id="fullName" value="${param.fullName}" name="fullName" required="true">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="citizenID">Căn cước công dân</label>
                        <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedCitizenId}">
                            <span class="text-danger" role="alert" style="text-align:right">
                                ${requestScope.SIGNUP_ERROR.duplicatedCitizenId}
                            </span>
                        </c:if>
                        <input type="text" class="form-control" id="citizenID" name="citizenID" aria-describedby="citizenIDHelp" value="${param.citizenID}" required="true">
                        <small id="citizenIDHelp" class="form-text text-muted">Gồm 12 số</small>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${param.email}" required="true">

                        <c:if test="${not empty requestScope.SIGNUP_ERROR.duplicatedEmail}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.SIGNUP_ERROR.duplicatedEmail}
                            </div>
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="phoneNumber">Số điện thoại</label>
                        <input type="text" class="form-control" id="phoneNumber" name="phoneNum" value="${param.phoneNum}" required="true">

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
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="address">Địa chỉ</label>
                        <input type="text" class="form-control" id="address" name="address" value="${param.address}">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="birthday">Ngày sinh</label>
                        <input type="date" class="form-control" name="birthday" value="${param.birthday}" id="birthday">
                    </div>
                </div>

                <div class="form-row">
                    <div class="col">
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" aria-describedby="passwordHelp" name="password" required="true">
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
                            <input type="password" class="form-control" id="cpassword" name="cpassword" required="true">
                        </div>
                        <c:if test="${not empty requestScope.SIGNUP_ERROR.confirmPasswordNotMatch}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.SIGNUP_ERROR.confirmPasswordNotMatch}
                            </div>
                        </c:if>
                    </div>
                </div>

                <input type="hidden" name="roleID" value="1">
                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-md-4">Đăng ký</button>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>




        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
    </body>
</html>
