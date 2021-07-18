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
        <title>Thống kê phản hồi - Feedback Dashboard</title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="css\dashboard.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="./viewAllAccounts.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <style>
            #side-bar-icon {
                padding-left: 1rem;
                padding-right: 1rem;
            }
            body {
                font-family: 'Niramit', sans-serif;
            }
            .loader {
                position: fixed;
                z-index: 99;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .loader > img {
                width: 100px;
            }

            .loader.hidden {
                animation: fadeOut 1s;
                animation-fill-mode: forwards;
            }

            @keyframes fadeOut {
                100% {
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
    </head>
    <body style="font-family: 'Poppins', sans-serif; font-size: 0.75rem; font-weight: 200; ">
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'manager' && sessionScope.ROLE != 'admin'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>
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
                            <a href="thong-ke-tong-quat" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-tv"></span>
                                <span >Tổng quát</span></a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                        <li style="padding-left:0.25rem">
                            <a href="thong-ke-tai-khoan"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-users"></span>
                                <span>Tài khoản </span></a>
                        </li>
                    </c:if>
<!--                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                            <a href="ViewServiceByStaffServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                                <span>Dịch vụ của tôi</span></a>
                            </c:if>
                    </li>-->
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                            <a href="ViewAllServiceListServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                                <span>Dịch vụ </span></a>
                            </c:if>
                    </li>
<!--                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager'}">
                            <a href="ViewBlogByAuthorServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                                <span>Bài viết của tôi</span></a>
                            </c:if>
                    </li>-->
                    <li style="padding-left:0.25rem">
                        <c:if test="${sessionScope.ROLE eq 'manager' || sessionScope.ROLE eq 'admin'}">
                            <a href="ViewAllBlogListServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                                <span>Bài viết</span></a>
                            </c:if>
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
                            <a href="thong-ke-phan-hoi" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="far fa-comments"></span>
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
                            <h1>${requestScope.ALL_FB}</h1>
                            <span>Phản hồi</span>
                        </div>
                        <div>
                            <span class="far fa-comments"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>${requestScope.AVG_STAR}</h1>
                            <span>Điểm trung bình</span>
                        </div>
                        <div>
                            <span class="fas fa-star"></span>
                        </div>
                    </div>
                </div>

                <jsp:useBean id="service" class="web.models.tblService.ServiceDAO" scope="request"/>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Danh sách phản hồi</h3>
                            </div>
                            <div class="card-body">
                                <div class="col-sm-12 table__wrapper bg-white">
                                    <div class="tab-content" id="v-pills-tabContent">
                                        <div class="tab-pane fade show active bg-white" id="allList" role="tabpanel"
                                             aria-labelledby="v-pills-changePassword-tab">
                                            <table class="table table-striped table-bordered mydatatable">
                                                <thead>
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Dịch vụ</th>
                                                        <th>Mã đơn khám</th>
                                                        <th>Mã khách hàng</th>
                                                        <th>Góp ý khách hàng</th>
                                                        <th>Điểm số</th>
                                                        <th>Xem chi tiết</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>

                                                <tbody id="tableBodyAccepted">
                                                    <c:if test="${not empty requestScope.FEEDBACK_LIST}">
                                                        <c:forEach items="${requestScope.FEEDBACK_LIST}" var="feedbackDTO" varStatus="varStat">
                                                            <tr>
                                                                <td>${varStat.count}</td>
                                                                <c:forEach items="${service.listService}" var="serviceDTO">
                                                                    <c:if test="${feedbackDTO.serviceId == serviceDTO.serviceId}">
                                                                        <td>${serviceDTO.serviceName}</td>
                                                                    </c:if>
                                                                </c:forEach>
                                                                <td>${feedbackDTO.reservationId}</td>
                                                                <td>${feedbackDTO.customerId}</td>
                                                                <td>${feedbackDTO.comment}</td>
                                                                <td>${feedbackDTO.rate}</td>
                                                                <td>
                                                                    <c:url var="viewdetails" value="DispatchServlet">
                                                                        <c:param name="btAction" value="ViewReservationDetails"></c:param>
                                                                        <c:param name="resid" value="${feedbackDTO.reservationId}"></c:param>
                                                                    </c:url>
                                                                    <a href="${viewdetails}">Chi tiết</a>
                                                                </td>
                                                                <td>
                                                                    <c:url var="delete" value="DeleteFeedbackServlet">
                                                                        <c:param name="txtFeedbackId" value="${feedbackDTO.feedbackId}"></c:param>
                                                                    </c:url>
                                                                    <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                                </td>
                                                            </tr>
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
        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            });
        </script>
    </body>
</html>
