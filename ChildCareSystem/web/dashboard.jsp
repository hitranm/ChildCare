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
    </head>
    <body style="font-family: 'Poppins', sans-serif; font-size: 0.75rem; font-weight: 200; ">
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar" style: background="#3287a8">
            <div class ="sidebar-brand">
                <h3><span class="lab la-accusoft"> 
                    </span>
                    <span class="lmao" style="font-size: 1.5rem">
                        Child Care System
                    </span></h3>

            </div>
            <div class ="sidebar-menu">
                <ul>
                    <li>
                        <a href="dashboard.jsp" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-igloo"></span>
                            <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="DispatchServlet?btAction=ViewAccount" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-users"></span>
                            <span>Account </span></a>
                    </li>
                    <li>
                        <a href="serviceDashboard.jsp" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-clipboard-list"></span>
                            <span>Service </span></a>
                    </li>
                    <li>
                        <a href="blogDashboard.jsp" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-shopping-bag"></span>
                            <span>Blog</span></a>
                    </li>
                    <li>
                        <a href="DispatchServlet?btAction=ViewReservationForManager" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-receipt"></span>
                            <span>Reservation</span></a>
                    </li>
                    <li>
                        <a href="feedbackDashboard.jsp" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-user-circle"></span>
                            <span>Feedback</span></a>
                    </li>
                    <li>
                        <a href="ViewSystemSettingServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-user-circle"></span>
                            <span>System Settings</span></a>
                    </li>
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
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1>100</h1>
                            <span>Tài khoản</span>
                        </div>
                        <div>
                            <span class="las la-users"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>20</h1>
                            <span>Dịch vụ</span>
                        </div>
                        <div>
                            <span class="las la-clipboard-list"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>30</h1>
                            <span>Blog</span>
                        </div>
                        <div>
                            <span class="las la-shopping-bag"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>40</h1>
                            <span>Đơn hẹn khám</span>
                        </div>
                        <div>
                            <span class="las la-google-wallet"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>20</h1>
                            <span>Phản hồi</span>
                        </div>
                        <div>
                            <span class="las la-users"></span>
                        </div>
                    </div>

                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                    <%--        <div class="card-header">
                                <h3>Accounts List</h3>
                                
                            </div>
                            <div class="card-body">
                                <div class="userPosts__container">
                                    <div class="userPosts__wrapper">
                                        <h2 class="userPosts__title"></h2>
                                        <div class="dropdownButton__wrapper">
                                            <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Role
                                            </button>

                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                                <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                                     aria-orientation="vertical">
                                                    <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill"
                                                       href="#allList" role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                                       onclick="toggleButton(this)">All</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#customerList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Customer</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#staffList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Staff</a>
                                                    <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#managerList"
                                                       role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                                       onclick="toggleButton(this)">Manager</a>
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
                                                                <th>No</th>
                                                                <th>IdentityID</th>
                                                                <th>Full Name</th>
                                                                <th>Phone Number</th>
                                                                <th> Role</th>
                                                                <th>View details</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>

                                                        <tbody id="tableBodyAccepted">
                                                            <c:if test="${requestScope.ListCustomer!=null}">
                                                                <c:set var="count" value="0"/>
                                                                <c:forEach items="${requestScope.ListCustomer}" var="dto" >

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
                                                                            <a href="${viewdetails}">See details</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>


                                                                            </c:url>
                                                                            <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                                <c:if test="${requestScope.ListStaff!=null}">

                                                                    <c:forEach items="${requestScope.ListStaff}" var="dto" >

                                                                        <tr>
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
                                                                                <a href="${viewdetails}">See details</a>
                                                                            </td>
                                                                            <td>
                                                                                <c:url var="delete" value="DispatchServlet">
                                                                                    <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                    <c:param name="id" value="${dto.identityID}"></c:param>


                                                                                </c:url>
                                                                                <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>  
                                                                    <c:if test="${requestScope.ListManager!=null}">

                                                                        <c:forEach items="${requestScope.ListManager}" var="dto" >

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
                                                                                    <a href="${viewdetails}">See details</a>
                                                                                </td>
                                                                                <td>
                                                                                    <c:url var="delete" value="DispatchServlet">
                                                                                        <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                        <c:param name="id" value="${dto.identityID}"></c:param>


                                                                                    </c:url>
                                                                                    <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                                                </td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:if>
                                                        </tbody>
                                                    </table>

                                                </div>

                                                <!--WaitingList-->
                                                <div class="tab-pane fade bg-white" id="customerList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">


                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>No</th>
                                                                <th>IdentityID</th>
                                                                <th>Full Name</th>
                                                                <th>Phone Number</th>
                                                                <th>Role</th>
                                                                <th>View details</th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody id="tableBodyWaiting">
                                                            <tr>
                                                                <c:if test="${requestScope.ListCustomer!=null}">
                                                                    <c:set var="count" value="0"/>
                                                                    <c:forEach items="${requestScope.ListCustomer}" var="dto" >

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
                                                                            <a href="${viewdetails}">See details</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>


                                                                            </c:url>
                                                                            <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>

                                                            </c:if>
                                                        </tbody>
                                                    </table>

                                                </div>

                                                <!--RejectedList-->
                                                <div class="tab-pane fade bg-white" id="staffList" role="tabpanel"
                                                     aria-labelledby="v-pills-changePassword-tab">


                                                    <table class="table table-striped table-bordered mydatatable">
                                                        <thead>
                                                            <tr>
                                                                <th>No</th>
                                                                <th>IdentityID</th>
                                                                <th>Full Name</th>
                                                                <th>Phone Number</th>
                                                                <th>Role</th>
                                                                <th>View details</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>

                                                        <tbody id="tableBodyRejected">
                                                            <tr>
                                                                <c:if test="${requestScope.ListStaff!=null}">
                                                                    <c:set var="count" value="0"/>
                                                                    <c:forEach items="${requestScope.ListStaff}" var="dto" >

                                                                    <tr>
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
                                                                            <a href="${viewdetails}">See details</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>


                                                                            </c:url>
                                                                            <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </c:if>
                                                        </tbody>
                                                    </table>

                                                </div>

                                                <!--All-->
                                                <div class="tab-pane fade bg-white" id="managerList" role="tabpanel"
                                                     >
                                                    <table class="table table-striped table-bordered mydatatable" id="tableAll">
                                                        <thead>
                                                            <tr>
                                                                <th>No</th>
                                                                <th>IdentityID</th>
                                                                <th>Full Name</th>
                                                                <th>Phone Number</th>
                                                                <th>Role</th>
                                                                <th>View details</th>
                                                                <th></th>

                                                            </tr>
                                                        </thead>

                                                        <tbody id="tableBodyAll">
                                                            <tr>
                                                                <c:if test="${requestScope.ListManager!=null}">
                                                                    <c:set var="count" value="0"/>
                                                                    <c:forEach items="${requestScope.ListManager}" var="dto" >

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
                                                                            <a href="${viewdetails}">See details</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="delete" value="DispatchServlet">
                                                                                <c:param name="btAction" value="DeleteAccount"></c:param>
                                                                                <c:param name="id" value="${dto.identityID}"></c:param>


                                                                            </c:url>
                                                                            <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                                        </td>
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
--%>
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

