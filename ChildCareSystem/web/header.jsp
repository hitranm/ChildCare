<%-- 
    Document   : header
    Created on : Jun 7, 2021, 5:11:22 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
            integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
            crossorigin="anonymous"
            />
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />

        <style>
            .navbar-brand {
                font-size: 1.5rem;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="header_wrapper px-5 py-2">
                <div class="header_top">
                    <nav class="navbar navbar-light bg-light">
                        <a class="navbar-brand top_title" href="home.jsp">
                            <img
                                src="./images/logo.png"
                                width="60"
                                height="60"
                                class="d-inline-block align-top"
                                alt=""
                                />
                            Trung tâm chăm sóc trẻ em CCS
                        </a>
                    </nav>
                </div>

                <nav class="navbar navbar-expand-lg navbar-dark bg-primary px-5">
                    <button
                        class="navbar-toggler float-right"
                        type="button"
                        data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                        >
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item px-3">
                                <a class="nav-link" href="DispatchServlet"
                                   >Trang chủ<span class="sr-only"></span
                                    ></a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="ViewBlogServlet?index=1">Bài viết</a>
                            </li>
                            
                            <li class="nav-item px-3">
                                <a class="nav-link" href="ViewServiceListServlet?index=1">Dịch vụ</a>
                            </li>
                            
                            <li class="nav-item px-3">
                                <a class="nav-link" href="#">Phản hồi</a>
                            </li>


                            <!-- Authorize menu -->
                            <c:choose>                              
                                <c:when test="${sessionScope.ROLE eq 'customer'}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Dịch vụ
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="ViewServiceListServlet?index=1">Xem tất cả dịch vụ</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="DispatchServlet?btAction=ChooseServiceReserve">Đặt chỗ khám bệnh</a>
                                        </div>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="ViewPatientProfileServlet">Hồ sơ bệnh nhân</a>
                                    </li>
                                </c:when>

                                <c:when test="${sessionScope.ROLE eq 'staff'}">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="DispatchServlet?btAction=ViewReservationForStaff">Xem lịch khám bệnh</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="#">Hồ sơ bệnh nhân</a>
                                    </li>
                                </c:when>

                                <c:when test="${sessionScope.ROLE eq 'manager'}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Quản lí
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="DispatchServlet?btAction=ViewAccount">Xem tất cả tài khoản</a>       
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="createStaff.jsp">Tạo tài khoản nhân viên</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Hồ sơ bệnh nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="DispatchServlet?btAction=ViewReservationForManager">Đơn đặt khám bệnh</a>
                                        </div>
                                    </li>
                                </c:when>
                                    
                                <c:when test="${sessionScope.ROLE eq 'admin'}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Hệ thống
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="nav-link" href="#">Cấu hình hệ thống</a>       
                                            <div class="dropdown-divider"></div>
                                            <a class="nav-link" href="addManager.jsp">Tạo tài khoản cho quản lí</a>
                                            <div class="dropdown-divider"></div>
                                        </div>
                                    </li>
                                </c:when>


                            </c:choose>
                            <!-- ------------------------------- -->

                            
                            
                        </ul>
                        <ul class="navbar-nav pr-5">
                            <c:choose>
                                <c:when test="${not empty sessionScope.LOGIN_USER}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${sessionScope.LOGIN_USER.fullName}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="DispatchServlet?btAction=ViewUserProfile">Xem thông tin cá nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="newpassword.jsp">Đổi mật khẩu</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="LogOutServlet">Đăng xuất</a>
                                        </div>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="login.jsp">Đăng nhập</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="register.jsp">Đăng ký</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>


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
    </body>
</html>
