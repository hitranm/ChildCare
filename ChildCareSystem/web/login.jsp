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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <title>Login Page</title>

    </head>
    <body>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">PHIẾU ĐĂNG KÝ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <c:set var="errors" value="${requestScope.FOUND_ERROR}"/>
                    <c:if test="${errors}">
                        <script type="text/javascript">
                            $(window).on('load', function () {
                                $('#exampleModal').modal('show');
                            });
                        </script>
                    </c:if>
                    <c:set var="ERROR1" value="${requestScope.ERROR.emailDupError}"/>
                    <c:set var="ERROR2" value="${requestScope.ERROR.passwordError}"/>
                    <c:set var="ERROR3" value="${requestScope.ERROR.citizenIDDupError}"/>
                    <c:set var="ERROR4" value="${requestScope.error.phoneNumDupError}"/>
                    <c:set var="SIGNUP1" value="${requestScope.SIGNUP_ERROR.phoneNumberError}"/>
                    <c:set var="SIGNUP2" value="${requestScope.SIGNUP_ERROR.passwordError}"/>
                    <c:set var="SIGNUP3" value="${requestScope.SIGNUP_ERROR.citizenIDError}"/>


                    <div class="modal-body">
                        <form action="DispatchServlet" method="POST">
                            <div class="form-group">
                                <label for="fullNanme">Họ và tên</label>
                                <input type="text" class="form-control" id="fullName" placeholder="Họ và tên" name="fullName" required="true">
                            </div>
                            <div class="form-row">
                                <div class="col">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required="true">
                                <c:if test="${ERROR1!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${ERROR.emailDupError}
                                    </div>
                                </c:if>
                            </div>
                                </div>
                                <div class="col">
                            <div class="form-group">
                                <label for="phoneNumber">Số điện thoại</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNum" placeholder="Phone" required="true">
                                <c:if test="${SIGNUP1!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${SIGNUP_ERROR.phoneNumberError}
                                    </div>
                                </c:if>
                                <c:if test="${ERROR4!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${error.phoneNumDupError}
                                    </div>
                                </c:if>
                            </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ">
                            </div>
                            
                            <div class="form-row">
                                <div class="col">
                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" class="form-control" id="password" aria-describedby="passwordHelp" name="password" placeholder="Mật khẩu" required="true">
                                <c:if test="${SIGNUP2!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${SIGNUP_ERROR.passwordError}
                                    </div>
                                </c:if>



                                <small id="passwordHelp" class="form-text text-muted">Mật khẩu phải dài ít nhất 6 kí tự và không có kí tự đặc biệt</small>
                            </div>
                                </div>
                                <div class="col">
                            <div class="form-group">
                                <label for="cpassword">Xác nhận mật khẩu</label>
                                <input type="password" class="form-control" id="cpassword" name="cpassword" placeholder="Mật khẩu" required="true">
                                <c:if test="${ERROR2!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${ERROR.passwordError}
                                    </div>
                                </c:if>
                            </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday">Ngày sinh</label>
                                <input type="date" class="form-control" name="birthday" id="birthday">
                            </div>
                            <div class="form-group">
                                <label for="citizenID">CCCD</label>
                                <input type="text" class="form-control" id="citizenID" name="citizenID" aria-describedby="citizenIDHelp" placeholder="CCCD" required="true">
                                <c:if test="${SIGNUP3!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${SIGNUP_ERROR.citizenIDError}
                                    </div>
                                </c:if>

                                <c:if test="${ERROR3!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${ERROR.citizenIDDupError}
                                    </div>
                                </c:if>

                                <small id="citizenIDHelp" class="form-text text-muted">Gồm 12 số</small>
                            </div>
                            <input type="hidden" name="roleID" value="3">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>

                                <button type="submit" class="btn btn-primary" name="btAction" value="Register">Đăng ký</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="center">
            <h1>ĐĂNG NHẬP</h1>
            <form action="DispatchServlet" method="POST">
                <div class="txt_field">
                    <input type="text" name="phoneNum" required="true">
                    
                    <label>SĐT</label>
                </div>
                <div class ="txt_field">
                    <input type="password" name="password" required="true">
                    <span></span>
                    <label>Mật khẩu</label>
                    <c:set var="login_error" value="${requestScope.Message}"/>
                    <c:if test="${Message!=null}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.Message}
                        </div>
                    </c:if>

                </div>
                <button type="submit" class="btn btn-primary" name="btAction" value="Login">Đăng nhập</button></br>
            </form>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Đăng ký 
            </button>





    </body>
</html>
