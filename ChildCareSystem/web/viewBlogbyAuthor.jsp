<%-- 
    Document   : viewAllBlog
    Created on : Jun 29, 2021, 10:52:33 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài viết</title>
       
        <link rel="stylesheet" href="./viewAllAccounts.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            * {
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
    <body>
        <jsp:include page="header.jsp"/>
        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>
        <!-- Authorize -->
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'staff' or sessionScope.ROLE != 'manager'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <!-- -->
        
        <main>
            <div class="blog-container">
                <div class="userPosts__wrapper">
                    <h1 class="text-center mb-2">Bài viết của tôi</h1> 
                    <div class="status-dropdown">
                        <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Trạng thái
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                 aria-orientation="vertical">
                                <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill" href="#all" 
                                   role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                   onclick="toggleButton(this)">Tất cả</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#public"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Chấp nhận</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#pending"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Đang chờ</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#deny"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Từ chối</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 table__wrapper bg-white">
                        <div class="tab-content" id="v-pills-tabContent">
                            <c:if test="${not empty requestScope.BLOG_LIST}">
                                <!--All-->
                                <div class="tab-pane fade show active bg-white" id="all" role="tabpanel"
                                     aria-labelledby="v-pills-changePassword-tab">
                                    <table class="table table-striped table-bordered mydatatable">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>

                                        <tbody id="tableBodyAccepted">
                                            <c:set var="count" value="0"/>
                                            <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                <tr>
                                                    <c:if test="${dto.statusID eq 1}">
                                                        <c:set var="count" value="${count+1}"/>
                                                        <td>
                                                            ${count}
                                                        </td>

                                                        <td>${dto.blogID}</td>
                                                        <td>${dto.title}</td>
                                                        <td class="alert alert-success">Chấp nhận</td>
                                                        <!--                                            <td class="alert alert-success">Customer</td>-->
                                                        <td>
                                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${dto.statusID eq 0}">
                                                        <c:set var="count" value="${count+1}"/>
                                                        <td>
                                                            ${count}
                                                        </td>
                                                        <td>${dto.blogID}</td>
                                                        <td>${dto.title}</td>
                                                        <td class="alert alert-warning">Đang chờ</td>
                                                        <!--                                            <td class="alert alert-success">Customer</td>-->
                                                        <td>
                                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                        </td>
                                                    </c:if>
                                                    <c:if test="${dto.statusID eq 2}">
                                                        <c:set var="count" value="${count+1}"/>
                                                        <td>
                                                            ${count}
                                                        </td>
                                                        <td>${dto.blogID}</td>
                                                        <td>${dto.title}</td>
                                                        <td class="alert alert-danger">Từ chối</td>
                                                        <td>
                                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                        </td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!--Public-->
                                <div class="tab-pane fade show bg-white" id="public" role="tabpanel"
                                     aria-labelledby="v-pills-changePassword-tab">
                                    <table class="table table-striped table-bordered mydatatable">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Trạng thái</th>

                                            </tr>
                                        </thead>

                                        <tbody id="tableBodyAccepted">
                                            <c:set var="count" value="0"/>
                                            <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                <c:if test="${dto.statusID eq 1}">
                                                    <c:set var="count" value="${count+1}"/>
                                                    <tr>
                                                        <td>
                                                            ${count}
                                                        </td>
                                                        <td>${dto.blogID}</td>
                                                        <td>${dto.title}</td>
                                                        <td class="alert alert-success">Chấp nhận</td>
                                                        <!--                                            <td class="alert alert-success">Customer</td>-->
                                                        <td>
                                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>                    
                                <!--Pending-->
                                <div class="tab-pane fade show bg-white" id="pending" role="tabpanel"
                                     aria-labelledby="v-pills-changePassword-tab">
                                    <table class="table table-striped table-bordered mydatatable">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>

                                        <tbody id="tableBodyAccepted">
                                            <c:set var="count" value="0"/>
                                            <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                <c:if test="${dto.statusID eq 0}">
                                                    <c:set var="count" value="${count+1}"/>
                                                    <tr>
                                                        <td>
                                                            ${count}
                                                        </td>
                                                        <td>${dto.blogID}</td>
                                                        <td>${dto.title}</td>
                                                        <td class="alert alert-warning">Đang chờ</td>
                                                        <!--                                            <td class="alert alert-success">Customer</td>-->
                                                        <td>
                                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                                <!--deny-->
                                <div class="tab-pane fade show bg-white" id="deny" role="tabpanel"
                                     aria-labelledby="v-pills-changePassword-tab">

                                    <table class="table table-striped table-bordered mydatatable">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Trạng thái</th>
                                            </tr>
                                        </thead>

                                        <tbody id="tableBodyAccepted">
                                            <c:set var="count" value="0"/>
                                            <c:forEach items="${requestScope.BLOG_LIST}" var="dto" varStatus="counter">
                                                <c:if test="${dto.statusID eq 2}">
                                                    <c:set var="count" value="${count+1}"/>
                                                    <tr>
                                                        <td>
                                                            ${count}
                                                        </td>
                                                        <td>${dto.blogID}</td>
                                                        <td>${dto.title}</td>
                                                        <td class="alert alert-danger">Từ chối</td>
                                                        <!--                                            <td class="alert alert-success">Customer</td>-->
                                                        <td>
                                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">Xem chi tiết</a>
                                                        </td>
                                                        <td>
                                                            <a class="btn btn-danger" onclick="return confirmation()" href="DeleteBlogServlet?id=${dto.blogID}" role="button">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn xóa bài viết này?");
                return r;
            }
        </script>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
