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

            <c:if test="${sessionScope.ROLE != 'admin'}">
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
                        <a href="DispatchServlet?btAction=ViewMainDashboard"   class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-tv"></span>
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
                        <a href="ViewAllServiceListServlet"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                            <span>Dịch vụ </span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="ViewAllBlogListServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                            <span>Bài viết</span></a>
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
                        <a href="ViewSystemSettingServlet" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-cogs"></span>
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
                    Dashboard
                </h2>
                <div class="search-wrapper">
                    <span class="las la-search"></span>
                    <input type="search"/>
                </div>
                <div class="user-wrapper">

                    <div>
                        <h4>John Doe</h4>
                        <small>Super administrator
                        </small>
                    </div>
                </div>

            </header>
            <main>
                <div class="row">
                    <c:if test="${requestScope.UPDATE_SETTING!=null}">
                        <div class="col-sm">
                        </div>
                        <div class="alert alert-success col-sm" role="alert" style="font-size: large">
                            ${requestScope.UPDATE_SETTING}
                        </div>
                        <div class="col-sm">
                        </div>
                    </c:if>
                </div>
                
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <c:if test="${requestScope.settingList!=null}">
                                        <c:if test="${not empty requestScope.settingList}" var="testEmpty">
                                            <c:forEach items="${requestScope.settingList}" var="dto">
                                                <div class="col-md-6" style="margin-bottom: 3%">
                                                    <form class="col" action="UpdateSystemSettingServlet" method="POST">
                                                        <div class="card" style="text-align: center">
                                                            <div class="card-body">
                                                                <h5 class="card-title"><strong>${dto.settingName}</strong></h5>
                                                                <h5 class="card-title"><input type="text" name="txtID" value="${dto.settingID}" hidden></h5>
                                                                <hr>
                                                                <p class="card-text col-md-12" style="width: 50%;margin-left: 24%">
                                                                    <strong>Giá trị cài đặt</strong><input placeholder="Nhập giá trị" required type="number" name="txtValue" value="${dto.settingValue}" min="0" max="15" step="1"/>
                                                                </p>
                                                                <hr>
                                                                <c:url value="UpdateSystemSettingServlet" var="updateLink">
                                                                    <c:param name="id" value="${dto.settingID}"/>
                                                                </c:url>
                                                                <button type="submit" class="btn btn-primary" href="${updateLink}">Cập nhật</button>
                                                                <button type="reset" class="btn btn-primary" href="ViewSystemSettingServlet">Đặt lại</button>
                                                                <hr>
                                                                <p class="card-text" style="text-align: right; font-size: small">
                                                                    <strong>Cập nhật lần cuối: </strong> ${dto.updatedDate}
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${!testEmpty}">
                                            <h2>No Product here. Create new one below here</h2>
                                        </c:if>
                                    </c:if>
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
        <script src="./js/bootstrap-input-spinner.js"></script>
        <script>
            $("input[type='number']").inputSpinner()
        </script>
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
            });
        </script>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn xóa tài khoản này?");
                return r;
            }
        </script>
    </body>
</html>


