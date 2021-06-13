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
    </head>
    <body>
        <header>
            <div class="header_wrapper px-5 py-2">
                <div class="header_top">
                    <nav class="navbar navbar-light bg-light">
                        <a class="navbar-brand top_title" href="#">
                            <img
                                src="/docs/4.0/assets/brand/bootstrap-solid.svg"
                                width="30"
                                height="30"
                                class="d-inline-block align-top"
                                alt=""
                                />
                            Child Care System
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
                                <a class="nav-link" href="home.jsp"
                                   >Trang chủ<span class="sr-only"></span
                                    ></a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="ViewBlogServlet?index=1">Bài viết</a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="ViewPatientProfileServlet">Hồ sơ bệnh nhân</a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="#">Liên hệ</a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="DispatchServlet?btAction=LoadSpecialty&view=CreateStaff">Tạo staff account</a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="createService.jsp">Tạo dịch vụ</a>
                            </li>
                            <li class="nav-item px-3">
                                <a class="nav-link" href="#">Phản hồi</a>
                            </li>
                        </ul>
                        <ul class="navbar-nav">
                            <c:choose>
                                <c:when test="${not empty sessionScope.LOGIN_USER}">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${sessionScope.LOGIN_USER.fullName}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="DispatchServlet?btAction=ViewUserProfile">Xem thông tin cá nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="createService.jsp">Tạo dịch vụ</a>
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
    </body>
</html>
