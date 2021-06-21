<%--
    Document   : register
    Created on : May 18, 2021, 10:55:18 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/login.css">


        <title>Login Page</title>

    </head>
    <body>
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="./images/background1.png" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class="col-md-8">
                                <div class="mb-4">
                                    <c:if test="${requestScope.DID_LOGIN!=null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.DID_LOGIN}
                                        </div>
                                    </c:if>
                                    <h3>Đăng nhập</h3>
                                </div>
                                <form action="DispatchServlet" method="post" id="registerForm" onsubmit="submitForm(); return false;">
                                    <div class="form-group first">
                                        <label for="email">Email</label>
                                        <input type="email" name="email" value="" class="form-control" id="email">
                                    </div>
                                    <div class="form-group last mb-4">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" name="password" value="" id="password">
                                    </div>
                                    <c:set var="login_error" value="${requestScope.Message}"/>
                                    <c:if test="${Message!=null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.Message}
                                        </div>
                                    </c:if>
                                    <div class="d-flex mb-5 align-items-center">
                                        <span class="ml-auto"><a href="forgot_pass.jsp" class="forgot-pass">Quên mật khẩu</a></span>
                                    </div>
                                    <!--                                    <input name="btAction" value="Login" hidden/>-->
                                    <button type="submit" name="btAction" value="Login" class="btn btn-primary">Đăng nhập</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $(function () {
                'use strict';

                $('.form-control').on('input', function () {
                    var $field = $(this).closest('.form-group');
                    if (this.value) {
                        $field.addClass('field--not-empty');
                    } else {
                        $field.removeClass('field--not-empty');
                    }
                });

            });

            function submitForm() {
                $("#registerForm").submit();
            }
        </script>
        <!--        <script>
                    if (window.history.replaceState) {
                        window.history.replaceState(null, null, window.location.href);
                    }
                </script>-->
    </body>
</html>
