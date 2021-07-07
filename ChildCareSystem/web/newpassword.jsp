<%-- 
    Document   : newpassword
    Created on : May 29, 2021, 8:38:32 PM
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
        <title>Cài đặt mật khẩu mới</title>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
        </style>
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
                                    <h3>Đặt lại mật khẩu mới</h3>
                                </div>
                                <form action="DispatchServlet?btAction=ResetPass" method="post">
                                    <div class="form-group first">
                                        <label for="email">Mật khẩu mới</label>
                                        <input type="password" name="password" value="" required="true"  class="form-control" id="email">
                                    </div>
                                    <div class="form-group last mb-4">
                                        <label for="password">Xác nhận mật khẩu</label>
                                        <input type="password" class="form-control" name="cpassword" value="" required="true" id="password">
                                    </div>
                                    <c:if test="${requestScope.ERROR_PASS!=null}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.ERROR_PASS}
                                        </div>
                                    </c:if>
                                    <input type="hidden" name="email" value="${param.email}">
                                    <button type="submit" class="btn btn-primary">Thay đổi</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>






        <!--   <form action="DispatchServlet" method="POST">
   
               Mật khẩu mới <input type="password" name="password" placeholder="Mật khẩu" required="true">
               Xác nhận mật khẩu <input type="password" name="cpassword" placeholder="Mật khẩu" required="true">
               <input type="hidden" name="email" value="${param.email}">
               <button  type="submit" name="btAction" value="ResetPass">Xác nhận </button>
           </form>
        -->

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
        </script>
    </body>
</html>
