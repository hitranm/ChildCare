<%-- 
    Document   : verify
    Created on : May 26, 2021, 9:43:19 PM
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
        <link rel="stylesheet" href="./css/verify.css">
        <title>Verify Page</title>
    </head>
    <body>
        

        <form action="DispatchServlet" method="POST">
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
                                        <h3>Đã gửi mã xác thực về email. Vui lòng kiểm tra email của bạn.</h3>
                                    </div>
                                    <form action="DispatchServlet?btAction=Verify" method="post">
                                        <div class="form-group first">
                                            <label for="email">Mã xác thực</label>
                                            <input type="text" name="authcode" value="" required="true" class="form-control" id="email">
                                        </div>

                                        <c:set var="WRONG_CODE" value="${requestScope.WRONG_CODE}"/>
                                        <c:if test="${WRONG_CODE!=null}">
                                            <div class="alert alert-danger" role="alert">
                                                ${requestScope.WRONG_CODE}
                                            </div>
                                        </c:if>
                                        <input type="hidden" name="fullName" value="${param.fullName}">
                                        <input type="hidden" name="email" value="${param.email}">
                                        <input type="hidden" name="phoneNum" value="${param.phoneNum}">
                                        <input type="hidden" name="address" value="${param.address}">
                                        <input type="hidden" name="password" value="${param.password}">
                                        <input type="hidden" name="birthday" value="${param.birthday}">
                                        <input type="hidden" name="citizenID" value="${param.citizenID}">
                                        <input type="hidden" name="roleID" value="${param.roleID}">    
                                        <button type="submit" class="btn btn-primary">Xác thực</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    





          <!--  Nhập mã xác thực email <input type="text" name="authcode" ></br>
            <button type="submit" name="btAction" value="Verify">Xác thực </button>


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
