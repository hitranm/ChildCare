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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <title>Đăng nhập</title>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
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
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <img src="./images/background1.png" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-12 col-md-6 contents">
                        <div class="row justify-content-center">
                            <div class=" col-8 col-md-12">
                                <div class="mb-4">
                                    <c:if test="${requestScope.DID_LOGIN!=null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.DID_LOGIN}
                                        </div>
                                    </c:if>
                                    <h3 class="text-center">Đăng nhập</h3>
                                </div>
                                <form action="dang-nhap-loi" method="post" id="registerForm" onsubmit="submitForm(); return false;">
                                    <div class="form-group col-12 first">
                                        <label for="email">Email</label>
                                        <input type="email" name="email" value="" class="form-control" id="email">
                                    </div>
                                    <div class="form-group col-12 last mb-4">
                                        <label for="password">Mật khẩu</label>
                                        <input type="password" class="form-control" name="password" value="" id="password">
                                    </div>
                                    <c:set var="login_error" value="${requestScope.Message}"/>
                                    <c:if test="${Message!=null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.Message}
                                        </div>
                                    </c:if>
                                    <div class="d-flex mb-4 align-items-center">
                                        <a href="register.jsp" style="font-size: 14px">Đăng ký tài khoản</a>
                                        <span class="ml-auto"><a href="forgot_pass.jsp" class="forgot-pass">Quên mật khẩu</a></span>
                                    </div>
                                    <div class="text-center"> 
                                        <button type="submit" name="btAction" value="Login" class="btn btn-primary">Đăng nhập</button>
                                    </div>                              
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

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
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
        </script>
    </body>
</html>
