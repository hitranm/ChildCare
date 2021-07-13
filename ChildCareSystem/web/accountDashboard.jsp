<%-- 
    Document   : dashboard
    Created on : Jul 1, 2021, 1:15:32 AM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html  lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Thống kê tài khoản - Account Dashboard </title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="css\dashboard.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="./viewAllAccounts.css">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }
            
            #side-bar-icon {
                padding-left: 1rem;
                padding-right: 1rem;
            }
        </style>
    </head>
    <body style="font-size: 0.75rem; font-weight: 200; ">
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'manager' && sessionScope.ROLE != 'admin'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar" style: background="#3287a8">
            <div class ="sidebar-brand">
                <a  href="StartupServlet" class="link-primary" style="color: white">
                    <h3><span class="lab la-accusoft"></span><span class="lmao" style="font-size: 1.5rem">Child Care System</span></h3>
                </a>
            </div>
            <div class ="sidebar-menu">
                <ul>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-tong-quat"   class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-tv"></span>
                                <span >Tổng quát</span></a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-tai-khoan" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-users"></span>
                                <span>Tài khoản </span></a>
                        </li>
                    </c:if>
                    <li style="padding-left:0.25rem">
                        <a href="thong-ke-Dich-vu"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                            <span>Dịch vụ </span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="thong-ke-bai-viet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                            <span>Bài viết</span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                            <a href="thong-ke-Don-dat-kham" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                                <span>Đơn đặt khám</span></a>
                            </c:if>
                            <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="don-kham-benh-cua-nhan-vien" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                                <span>Đơn đặt khám</span></a>
                            </c:if>
                    </li>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-phan-hoi" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="far fa-comments"></span>
                                <span>Phản hồi</span></a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="cau-hinh-he-thong" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-cogs"></span>
                                <span>Cấu hình hệ thống</span></a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>
                    Thống kê
                </h2>
            </header>
            <main>
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.TOTAL_ACCOUNT}</h1>
                            <span>Tài khoản</span>
                        </div>
                        <div>
                            <span class="fas fa-users"></span>
                        </div>
                    </div>
                            <div class="card-single">
                        <div>
                            <h1>${requestScope.ACTIVE_ACCOUNT}</h1>
                            <span>Đưa vào hoạt động</span>
                        </div>
                        <div>
                            <span class="fas fa-check-circle"></span>
                        </div>
                    </div>
                            <div class="card-single">
                        <div>
                            <h1>${requestScope.DEACT_ACCOUNT}</h1>
                            <span>Vô hiệu hóa</span>
                        </div>
                        <div>
                            <span class="fas fa-ban"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.CUSTOMER_ACCOUNT}</h1>
                            <span>Khách hàng</span>
                        </div>
                        <div>
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.STAFF_ACCOUNT}</h1>
                            <span>Nhân viên</span>
                        </div>
                        <div>
                            <span class="fas fa-user-md"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.MONTHLY_ACCOUNT}</h1>
                            <span>Tài khoản mới trong tháng</span>
                        </div>
                        <div>
                            <span class="fas fa-user-plus"></span>
                        </div>
                    </div>


                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Danh sách tài khoản đưa vào hoạt động</h3>

                            </div>
                            <div class="card-body">
                                <div class="userPosts__container">
                                    <div class="userPosts__wrapper">
                                        <h2 class="userPosts__title"></h2>
                                        <div class="dropdownButton__wrapper px-3 mb-4">
                                            <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Vai trò
                                            </button>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                                     aria-orientation="vertical">
                                                    <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill"
                                                       href="#allActiveList" role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                                       onclick="toggleButton(this)">Tất cả</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#ActivecustomerList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Khách hàng</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#ActivestaffList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Nhân viên</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#ActivemanagerList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Quản lí</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 table__wrapper bg-white">
                                            <div class="tab-content" id="v-pills-tabContent">
                                                <!--All List-->
                                                <div class="tab-pane fade show active bg-white" id="allActiveList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">

                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyAccepted">
                                                            <c:if test="${requestScope.ListActiveCustomer!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListActiveCustomer}" var="dto" >
                                                                    <tr>
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>
                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-success">Customer</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Vô hiệu hóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                                <c:if test="${requestScope.ListActiveStaff!=null}">
                                                                    <c:forEach items="${requestScope.ListActiveStaff}" var="dto" >
                                                                        <c:set var="count" value="${count+1}"/>
                                                                    <td>${count}</td>

                                                                    <td>${dto.identityID}</td>
                                                                    <td>${dto.fullName}</td>
                                                                    <td>${dto.phoneNumber}</td>
                                                                    <td class="alert alert-warning">Staff</td>
                                                                    <td>
                                                                        <c:url var="viewdetails" value="DispatchServlet">
                                                                            <c:param name="btAction" value="ViewDetails"></c:param>
                                                                            <c:param name="id" value="${dto.identityID}"></c:param>


                                                                        </c:url>
                                                                        <a href="${viewdetails}">Chi tiết</a>
                                                                    </td>
                                                                    <td>
                                                                        <c:url var="delete" value="DispatchServlet">
                                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                            <c:param name="id" value="${dto.identityID}"></c:param>


                                                                        </c:url>
                                                                        <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Vô hiệu hóa</a>
                                                                    </td>
                                                                    </tr>
                                                                </c:forEach>  
                                                                <c:if test="${requestScope.ListActiveManager!=null}">

                                                                    <c:forEach items="${requestScope.ListActiveManager}" var="dto" >

                                                                        <tr>
                                                                            <c:set var="count" value="${count+1}"/>
                                                                            <td>${count}</td>

                                                                            <td>${dto.identityID}</td>
                                                                            <td>${dto.fullName}</td>
                                                                            <td>${dto.phoneNumber}</td>
                                                                            <td class="alert alert-danger">Manager</td>
                                                                            <td>
                                                                                <c:url var="viewdetails" value="DispatchServlet">
                                                                                    <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                    <c:param name="id" value="${dto.identityID}"></c:param>


                                                                                </c:url>
                                                                                <a href="${viewdetails}">Chi tiết</a>
                                                                            </td>
                                                                            <c:if test="${sessionScope.ROLE eq 'admin'}">
                                                                                
                                                                            <td>
                                                                                <c:url var="delete" value="DispatchServlet">
                                                                                    <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                    <c:param name="id" value="${dto.identityID}"></c:param>


                                                                                </c:url>
                                                                                <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Vô hiệu hóa</a>
                                                                            </td>
                                                                            </c:if>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:if>
                                                        </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!--Customer list-->
                                                <div class="tab-pane fade bg-white" id="ActivecustomerList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyWaiting">
                                                            <tr>
                                                                <c:if test="${requestScope.ListActiveCustomer!=null}">
                                                                    <c:set var="count" value="0"/>
                                                                    <c:forEach items="${requestScope.ListActiveCustomer}" var="dto" >
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>
                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-success">Khách hàng</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Vô hiệu hóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>

                                                </div>

                                                <!--staff list-->
                                                <div class="tab-pane fade bg-white" id="ActivestaffList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyRejected">
                                                            <c:if test="${requestScope.ListActiveStaff!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListActiveStaff}" var="dto" >
                                                                    <tr>
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>
                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-warning">Nhân viên</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Vô hiệu hóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!--Manager list-->
                                                <div class="tab-pane fade bg-white" id="ActivemanagerList" role="tabpanel"
                                                     >
                                                    <table class="table table-striped table-bordered mydatatable" id="tableAll">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody id="tableBodyAll">
                                                            <c:if test="${requestScope.ListActiveManager!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListActiveManager}" var="dto" >
                                                                    <tr>
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>

                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-danger">Quản lí</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>


                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <c:if test="${sessionScope.ROLE eq 'admin'}">
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Vô hiệu hóa</a>
                                                                        </td>
                                                                        </c:if>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                        <tfoot></tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Deactive List -->
                        <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Danh sách tài khoản bị vô hiệu hóa</h3>

                            </div>
                            <div class="card-body">
                                <div class="userPosts__container">
                                    <div class="userPosts__wrapper">
                                        <h2 class="userPosts__title"></h2>
                                        <div class="dropdownButton__wrapper px-3 mb-4">
                                            <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Vai trò
                                            </button>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                                     aria-orientation="vertical">
                                                    <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill"
                                                       href="#allDeactList" role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                                       onclick="toggleButton(this)">Tất cả</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#DeactcustomerList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Khách hàng</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#DeactstaffList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Nhân viên</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#DeactmanagerList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Quản lí</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 table__wrapper bg-white">
                                            <div class="tab-content" id="v-pills-tabContent">
                                                <!--All List-->
                                                <div class="tab-pane fade show active bg-white" id="allDeactList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">

                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyAccepted">
                                                            <c:if test="${requestScope.ListDeactiveCustomer!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListDeactiveCustomer}" var="dto" >
                                                                    <tr>
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>
                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-success">Customer</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ActiveAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a class="btn btn-success" onclick="return confirmation1()" href="${delete}" role="button">Kích hoạt</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                                <c:if test="${requestScope.ListDeactiveStaff!=null}">
                                                                    <c:forEach items="${requestScope.ListDeactiveStaff}" var="dto" >
                                                                        <c:set var="count" value="${count+1}"/>
                                                                    <td>${count}</td>

                                                                    <td>${dto.identityID}</td>
                                                                    <td>${dto.fullName}</td>
                                                                    <td>${dto.phoneNumber}</td>
                                                                    <td class="alert alert-warning">Staff</td>
                                                                    <td>
                                                                        <c:url var="viewdetails" value="DispatchServlet">
                                                                            <c:param name="btAction" value="ViewDetails"></c:param>
                                                                            <c:param name="id" value="${dto.identityID}"></c:param>


                                                                        </c:url>
                                                                        <a href="${viewdetails}">Chi tiết</a>
                                                                    </td>
                                                                    <td>
                                                                        <c:url var="delete" value="DispatchServlet">
                                                                            <c:param name="btAction" value="ActiveAccount"></c:param>
                                                                            <c:param name="id" value="${dto.identityID}"></c:param>


                                                                        </c:url>
                                                                        <a onclick="return confirmation1()" class="btn btn-success" href="${delete}" role="button">Kích hoạt</a>
                                                                    </td>
                                                                    </tr>
                                                                </c:forEach>  
                                                                <c:if test="${requestScope.ListDeactiveManager!=null}">

                                                                    <c:forEach items="${requestScope.ListDeactiveManager}" var="dto" >

                                                                        <tr>
                                                                            <c:set var="count" value="${count+1}"/>
                                                                            <td>${count}</td>

                                                                            <td>${dto.identityID}</td>
                                                                            <td>${dto.fullName}</td>
                                                                            <td>${dto.phoneNumber}</td>
                                                                            <td class="alert alert-danger">Manager</td>
                                                                            <td>
                                                                                <c:url var="viewdetails" value="DispatchServlet">
                                                                                    <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                    <c:param name="id" value="${dto.identityID}"></c:param>


                                                                                </c:url>
                                                                                <a href="${viewdetails}">Chi tiết</a>
                                                                            </td>
                                                                            <c:if test="${sessionScope.ROLE eq 'admin'}">
                                                                                
                                                                            <td>
                                                                                <c:url var="delete" value="DispatchServlet">
                                                                                    <c:param name="btAction" value="ActiveAccount"></c:param>
                                                                                    <c:param name="id" value="${dto.identityID}"></c:param>


                                                                                </c:url>
                                                                                <a onclick="return confirmation1()" class="btn btn-success" href="${delete}" role="button">Kích hoạt</a>
                                                                            </td>
                                                                            </c:if>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </c:if>
                                                            </c:if>
                                                        </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!--Customer list-->
                                                <div class="tab-pane fade bg-white" id="DeactcustomerList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyWaiting">
                                                            <tr>
                                                                <c:if test="${requestScope.ListDeactiveCustomer!=null}">
                                                                    <c:set var="count" value="0"/>
                                                                    <c:forEach items="${requestScope.ListDeactiveCustomer}" var="dto" >
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>
                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-success">Khách hàng</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ActiveAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a onclick="return confirmation1()" class="btn btn-success" href="${delete}" role="button">Kích hoạt</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>

                                                </div>

                                                <!--staff list-->
                                                <div class="tab-pane fade bg-white" id="DeactstaffList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyRejected">
                                                            <c:if test="${requestScope.ListDeactiveStaff!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListDeactiveStaff}" var="dto" >
                                                                    <tr>
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>
                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-warning">Nhân viên</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ActiveAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a onclick="return confirmation1()" class="btn btn-success" href="${delete}" role="button">Kích hoạt</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!--Manager list-->
                                                <div class="tab-pane fade bg-white" id="DeactmanagerList" role="tabpanel"
                                                     >
                                                    <table class="table table-striped table-bordered mydatatable" id="tableAll">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Họ tên</th>
                                                                <th>Số điện thoại</th>
                                                                <th>Vai trò</th>
                                                                <th>Xem chi tiết</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody id="tableBodyAll">
                                                            <c:if test="${requestScope.ListDeactiveManager!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListDeactiveManager}" var="dto" >
                                                                    <tr>
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <td>${count}</td>

                                                                        <td>${dto.identityID}</td>
                                                                        <td>${dto.fullName}</td>
                                                                        <td>${dto.phoneNumber}</td>
                                                                        <td class="alert alert-danger">Quản lí</td>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>


                                                                            </c:url>
                                                                            <a href="${viewdetails}">Chi tiết</a>
                                                                        </td>
                                                                        <c:if test="${sessionScope.ROLE eq 'admin'}">
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="ActiveAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>
                                                                            </c:url>
                                                                            <a onclick="return confirmation1()" class="btn btn-success" href="${delete}" role="button">Kích hoạt</a>
                                                                        </td>
                                                                        </c:if>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                        <tfoot></tfoot>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <!--JQuery-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <!--Custom JS-->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
        <script>
                                                                                $(".mydatatable").DataTable();
        </script>


        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            })
        </script>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn vô hiệu hóa tài khoản này?");
                return r;
            }
        </script>
         <script>
            function confirmation1() {
                var r = confirm("Bạn có chắc muốn kích hoạt tài khoản này?");
                return r;
            }
        </script>
    </body>
</html>
