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
        <title>Child care System Dashboard </title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="css\dashboard.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="./viewAllAccounts.css">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <style>
            #side-bar-icon {
                padding-left: 1rem;
                padding-right: 1rem;
            }
        </style>
    </head>
    <body style="font-family: 'Poppins', sans-serif; font-size: 0.75rem; font-weight: 200; ">
              <c:if test="${empty sessionScope.ROLE}">
                <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
                <jsp:forward page="login.jsp"/>
            </c:if>

            <c:if test="${sessionScope.ROLE eq 'customer'}">
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
                    <c:if test="${sessionScope.ROLE eq 'manager'}">
                    <li style="padding-left:0.25rem">
                        <a href="DispatchServlet?btAction=ViewMainDashboard" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-tv"></span>
                            <span >Tổng quát</span></a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'manager'}">
                    <li style="padding-left:0.25rem">
                        <a href="DispatchServlet?btAction=ViewAccount"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-users"></span>
                            <span>Tài khoản </span></a>
                    </li>
                    </c:if>
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="ViewServiceByStaffServlet" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                            <span>Dịch vụ </span></a>
                        </c:if>
                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                            <a href="ViewAllServiceListServlet" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                            <span>Dịch vụ </span></a>
                        </c:if>
                    </li>
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="ViewBlogByAuthorServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                            <span>Bài viết</span></a>
                        </c:if>
                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                            <a href="ViewAllBlogListServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                            <span>Bài viết</span></a>
                        </c:if>
                    </li>
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                        <a href="DispatchServlet?btAction=ViewReservationForManager" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                        <span>Đơn đặt khám</span></a>
                        </c:if>
                        <c:if test="${sessionScope.ROLE eq 'staff'}">
                            <a href="DispatchServlet?btAction=ViewReservationForStaff" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                            <span>Đơn đặt khám</span></a>
                            </c:if>
                    </li>
                    <c:if test="${sessionScope.ROLE eq 'manager'}">
                    <li style="padding-left:0.25rem">
                        <a href="ViewAllFeedbackServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="far fa-comments"></span>
                            <span>Phản hồi</span></a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'admin'}">
                    <li style="padding-left:0.25rem">
                        <a href="ViewSystemSettingServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-cogs"></span>
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
                            <h1>${requestScope.ALL_SERVICE}</h1>
                            <span>Dịch vụ</span>
                        </div>
                        <div>
                            <span class="fas fa-first-aid"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.ACTIVE_SERVICE}</h1>
                            <span>Đang hoạt động</span>
                        </div>
                        <div>
                            <span class="fas fa-eye"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.DENY_SERVICE}</h1>
                            <span>Tạm ngưng</span>
                        </div>
                        <div>
                            <span class="fas fa-eye-slash"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1 style="font-size: 1.5rem">${requestScope.POPULAR_SERVICE}</h1>
                            <span>Dịch vụ đặt nhiều nhất</span>
                        </div>
                        <div>
                            <span class="fas fa-chart-line"></span>
                        </div>
                    </div>


                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Danh sách dịch vụ</h3>
                            </div>
                            <div class="card-body">
                                <div class="userPosts__container">
                                    <div class="userPosts__wrapper">
                                        <h2 class="userPosts__title"></h2>
                                        <div class="dropdownButton__wrapper px-3 my-4">
                                            <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Trạng thái
                                            </button>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                                     aria-orientation="vertical">
                                                    <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill"
                                                       href="#allList" role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                                       onclick="toggleButton(this)">Tất cả</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#publicList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Đang hoạt động</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#waitingList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Đang chờ</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#rejectList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Tạm ngưng</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 table__wrapper bg-white">
                                            <div class="tab-content" id="v-pills-tabContent">

                                                <!--All List-->
                                                <div class="tab-pane fade show active bg-white" id="allList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Dịch vụ</th>
                                                                <th>Giá tiền</th>
                                                                <th>Trạng thái</th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyAccepted">
                                                            <c:if test="${not empty requestScope.SERVICE_LIST}">
                                                                <c:forEach items="${requestScope.SERVICE_LIST}" var="dto" varStatus="countVar">
                                                                    <tr>
                                                                        <td>${countVar.count}</td>
                                                                        <td>${dto.serviceId}</td>
                                                                        <td>${dto.serviceName}</td>
                                                                        <td>${dto.price}00</td>
                                                                        <c:choose>
                                                                            <c:when test="${dto.statusId eq 0}">
                                                                                <td class="alert alert-warning">Đang chờ</td>
                                                                            </c:when>
                                                                            <c:when test="${dto.statusId eq 1}">
                                                                                <td class="alert alert-success">Đang hoạt động</td>
                                                                            </c:when>
                                                                            <c:when test="${dto.statusId eq 2}">
                                                                                <td class="alert alert-danger">Từ chối</td>
                                                                            </c:when>
                                                                        </c:choose>
                                                                        <td>
                                                                            <c:url var="viewdetails" value="ViewServiceDetailServlet">
                                                                                <c:param name="id" value="${dto.serviceId}"/>
                                                                            </c:url>
                                                                            <a href="${viewdetails}">Xem chi tiết</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DeleteServiceServlet">
                                                                                <c:param name="id" value="${dto.serviceId}"/>
                                                                            </c:url>
                                                                            <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>                                                              
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!--Public list-->
                                                <div class="tab-pane fade bg-white" id="publicList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Dịch vụ</th>
                                                                <th>Giá tiền</th>
                                                                <th>Trạng thái</th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyAccepted">
                                                            <c:set var="count" value="0"/>
                                                            <c:if test="${not empty requestScope.SERVICE_LIST}">
                                                                <c:forEach items="${requestScope.SERVICE_LIST}" var="dto">
                                                                    <c:if test="${dto.statusId eq 1}">
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <tr>
                                                                            <td>${count}</td>
                                                                            <td>${dto.serviceId}</td>
                                                                            <td>${dto.serviceName}</td>
                                                                            <td>${dto.price}00</td>
                                                                            <td class="alert alert-success">Đang hoạt động</td>
                                                                            <td>
                                                                                <c:url var="viewdetails" value="ViewServiceDetailServlet">
                                                                                    <c:param name="id" value="${dto.serviceId}"/>
                                                                                </c:url>
                                                                                <a href="${viewdetails}">Xem chi tiết</a>
                                                                            </td>
                                                                            <td>
                                                                                <c:url var="delete" value="DeleteServiceServlet">
                                                                                    <c:param name="id" value="${dto.serviceId}"/>
                                                                                </c:url>
                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </c:if>                                                              
                                                        </tbody>
                                                    </table>
                                                </div>


                                                <!-- Waiting list -->
                                                <div class="tab-pane fade bg-white" id="waitingList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Dịch vụ</th>
                                                                <th>Giá tiền</th>
                                                                <th>Trạng thái</th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyAccepted">
                                                            <c:set var="count" value="0"/>
                                                            <c:if test="${not empty requestScope.SERVICE_LIST}">
                                                                <c:forEach items="${requestScope.SERVICE_LIST}" var="dto">
                                                                    <c:if test="${dto.statusId eq 0}">
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <tr>
                                                                            <td>${count}</td>
                                                                            <td>${dto.serviceId}</td>
                                                                            <td>${dto.serviceName}</td>
                                                                            <td>${dto.price}00</td>
                                                                            <td class="alert alert-warning">Đang chờ</td>
                                                                            <td>
                                                                                <c:url var="viewdetails" value="ViewServiceDetailServlet">
                                                                                    <c:param name="id" value="${dto.serviceId}"/>
                                                                                </c:url>
                                                                                <a href="${viewdetails}">Chi tiết</a>
                                                                            </td>
                                                                            <td>
                                                                                <c:url var="delete" value="DeleteServiceServlet">
                                                                                    <c:param name="id" value="${dto.serviceId}"/>
                                                                                </c:url>
                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </c:if>                                                              
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <!--RejectedList-->
                                                <div class="tab-pane fade bg-white" id="rejectList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">
                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>ID</th>
                                                                <th>Dịch vụ</th>
                                                                <th>Giá tiền</th>
                                                                <th>Trạng thái</th>
                                                                <th></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyAccepted">
                                                            <c:set var="count" value="0"/>
                                                            <c:if test="${not empty requestScope.SERVICE_LIST}">
                                                                <c:forEach items="${requestScope.SERVICE_LIST}" var="dto">
                                                                    <c:if test="${dto.statusId eq 2}">
                                                                        <c:set var="count" value="${count+1}"/>
                                                                        <tr>
                                                                            <td>${count}</td>
                                                                            <td>${dto.serviceId}</td>
                                                                            <td>${dto.serviceName}</td>
                                                                            <td>${dto.price}00</td>
                                                                            <td class="alert alert-danger">Tạm ngưng</td>
                                                                            <td>
                                                                                <c:url var="viewdetails" value="ViewServiceDetailServlet">
                                                                                    <c:param name="id" value="${dto.serviceId}"/>
                                                                                </c:url>
                                                                                <a href="${viewdetails}">Xem chi tiết</a>
                                                                            </td>
                                                                            <td>
                                                                                <c:url var="delete" value="DeleteServiceServlet">
                                                                                    <c:param name="id" value="${dto.serviceId}"/>
                                                                                </c:url>
                                                                                <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>                                                              
                                                        </tbody>
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
                var r = confirm("Bạn có chắc muốn xóa tài khoản này?");
                return r;
            }
        </script>
    </body>
</html>

