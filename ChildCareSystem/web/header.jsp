<%-- 
    Document   : header
    Created on : Jun 7, 2021, 5:11:22 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ</title>
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
            * {
                font-family: 'Niramit', sans-serif;
            }
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
                        <a class="navbar-brand top_title" href="trang-chu">
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
                        <c:choose>

                            <c:when test="${sessionScope.ROLE eq 'customer'}">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="DispatchServlet"
                                           >Trang chủ<span class="sr-only"></span
                                            ></a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="bai-viet?trang=1">Bài viết</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dich-vu?trang=1">Dịch vụ</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Hồ sơ bệnh nhân
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="ho-so-benh-nhan">Xem hồ sơ bệnh nhân của bạn</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="tao-ho-so-benh-nhan">Tạo hồ sơ bệnh nhân</a>
                                        </div>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dat-cho-kham-benh">Đặt chỗ khám bệnh</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="phan-hoi">Phản hồi</a>
                                    </li>
                                </ul>
                                <ul class="navbar-nav pr-5">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${sessionScope.LOGIN_USER.fullName}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="xem-lich-su-kham">Xem lịch sử đặt khám</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="thong-tin-ca-nhan">Xem thông tin cá nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="doi-mat-khau">Đổi mật khẩu</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="dang-xuat">Đăng xuất</a>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>

                            <c:when test="${sessionScope.ROLE eq 'staff'}">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="DispatchServlet"
                                           >Trang chủ<span class="sr-only"></span
                                            ></a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="bai-viet?trang=1">Bài viết</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dich-vu?trang=1">Dịch vụ</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="lich-kham-benh">Xem lịch khám bệnh</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Quản lí
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="tao-bai-viet">Tạo bài viết</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="bai-viet-cua-ban">Xem bài viết</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="tao-dich-vu">Tạo dịch vụ</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="dich-vu-cua-ban">Xem dịch vụ</a>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="navbar-nav pr-5">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${sessionScope.LOGIN_USER.fullName}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="thong-tin-ca-nhan">Xem thông tin cá nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="doi-mat-khau">Đổi mật khẩu</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="dang-xuat">Đăng xuất</a>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>

                            <c:when test="${sessionScope.ROLE eq 'manager'}">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="DispatchServlet"
                                           >Trang chủ<span class="sr-only"></span
                                            ></a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="bai-viet?trang=1">Bài viết</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dich-vu?trang=1">Dịch vụ</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Thêm mới
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="tao-chuyen-khoa-moi">Thêm chuyên khoa</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="tao-chu-de-moi">Thêm chủ đề bài viết</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="tao-bai-viet-moi">Tạo bài viết</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="tao-dich-vu">Tạo dịch vụ</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="createStaff.jsp">Tạo tài khoản nhân viên</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Quản lí
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="xem-danh-sach-Chuyen-khoa">Danh sách chuyên khoa</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="Xem-danh-sach-chu-de">Danh sách chủ đề bài viết</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="thong-ke-tong-quat">Thống kê</a>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="navbar-nav pr-5">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${sessionScope.LOGIN_USER.fullName}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="thong-tin-ca-nhan">Xem thông tin cá nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="doi-mat-khau">Đổi mật khẩu</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="dang-xuat">Đăng xuất</a>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>

                            <c:when test="${sessionScope.ROLE eq 'admin'}">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="DispatchServlet"
                                           >Trang chủ<span class="sr-only"></span
                                            ></a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="bai-viet?trang=1">Bài viết</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dich-vu?trang=1">Dịch vụ</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="thong-ke-tong-quat">Quản lí</a>
                                    </li>
                                </ul>
                                <ul class="navbar-nav pr-5">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${sessionScope.LOGIN_USER.fullName}
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="thong-tin-ca-nhan">Xem thông tin cá nhân</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="doi-mat-khau">Đổi mật khẩu</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="dang-xuat">Đăng xuất</a>
                                        </div>
                                    </li>
                                </ul>
                            </c:when>

                            <c:otherwise>
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="DispatchServlet"
                                           >Trang chủ<span class="sr-only"></span
                                            ></a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="bai-viet?trang=1">Bài viết</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dich-vu?trang=1">Dịch vụ</a>
                                    </li>
                                </ul>
                                <ul class="navbar-nav pr-5">
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dang-nhap">Đăng nhập</a>
                                    </li>
                                    <li class="nav-item px-3">
                                        <a class="nav-link" href="dang-ky">Đăng ký</a>
                                    </li>
                                </ul>
                            </c:otherwise>
                        </c:choose>
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
