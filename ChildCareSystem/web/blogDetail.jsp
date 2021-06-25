<%-- 
    Document   : blogDetail
    Created on : May 28, 2021, 10:09:12 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="blog" value="${sessionScope.BLOG_DETAIL}"/>
        <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
        <jsp:useBean id="staff" class="web.models.tblStaff.StaffDAO" scope="request"/>
        <jsp:useBean id="status" class="web.models.tblStatus.StatusDAO" scope="request"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="./css/blog/blogdetail.css" />
        <title>Blog | ${blog.title}</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="body-top row">
                <div class="blog-title col-9">
                    <h1>${blog.title}</h1>
                </div>
                <div class="col-3 text-center">
                    <div>
                        <a class="btn btn-primary" href="UpdateBlogServlet?id=${blog.blogID}" name="btAction">Cập nhật bài viết</a><br>
                    </div>
                    <div>
                        <a class="btn btn-danger mt-2" onclick="return deleteConfirm()" href="DeleteBlogServlet?id=${blog.blogID}" name="btAction">Xóa</a><br>
                    </div>
                    <c:set var="role" value="${sessionScope.ROLEID}"/>
                    <c:if test="${role eq 3}">
                        <div class="blog-status mt-4">
                            <form action="UpdateBlogStatusServlet" method="POST">
                                <input type="hidden" name="txtBlogID" value="${blog.blogID}" />
                                <c:choose>
                                    <c:when test="${blog.statusID eq 0}">
                                        <button class="btn btn-outline-primary" type="submit" value="1" name="status">Duyệt bài</button>
                                        <button class="btn btn-outline-primary" type="submit" value="2" name="status">Từ chối</button>
                                    </c:when>
                                    <c:when test="${blog.statusID eq 1}">
                                        <button class="btn btn-outline-primary" type="submit" value="0" name="status">Ẩn bài đăng</button>
                                    </c:when>
                                    <c:when test="${blog.statusID eq 2}">
                                        <button class="btn btn-outline-primary" type="submit" value="1" name="status">Hiện bài đăng</button>
                                    </c:when>
                                </c:choose>
                                <!--                            <label for="status">Trạng thái</label>
                                                            <select class="form-control" aria-label="Default select example" name="status" id="status">
                                <c:forEach items="${status.viewBlogCategory()}" var="dto">
                                    <c:if test="${dto.statusID eq blog.statusID}">
                                        <option value="${dto.statusID}" selected>${dto.statusName}</option>
                                    </c:if>
                                    <c:if test="${dto.statusID != blog.statusID}">
                                        <option value="${dto.statusID}">${dto.statusName}</option>
                                    </c:if>
                                </c:forEach>
                            </select>-->
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="row">
                <div class="body-left col-lg-9 col-12">
                    <input type="hidden" name="txtBlogID" value="${blog.blogID}" />
                    <div class="blog-date text-right">
                        ${blog.createdDate}
                    </div>
                    <div class="blog-cate mb-5" style="position: absolute; margin-bottom: 2em;">
                        <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                            <c:if test="${blog.categotyID eq dto.categoryID}">
                                <a class="btn btn-link btn-sm" href="#">#${dto.categoryName}</a>
                            </c:if>
                        </c:forEach>
                    </div> <br><br>
                    <div class="">
                        <div class="blog-thumb mb-3">
                            <img src="./images/blog/${blog.thumbnail}"/>
                        </div>
                        <div class="blog-body">
                            ${blog.description}
                        </div>
                    </div>
                    <div class="blog-author text-right mb-5">
                        <c:set var="staffID" value="${blog.authorID}"/>
                        <i>Tác giả: ${staff.getStaffName(staffID)}</i>
                    </div>
                </div>

                <!--                <div class="main-right d-none d-lg-flex col-lg-3 mt-3">
                                    <div class="right-post-section">
                                        <h4>Bài viết mới nhất</h4>
                                        <div class="right-post-card">
                                            <h5>LOREM, IPSUM DOLOR SIT AMET</h5>
                                            <div class="right-post-content">
                                                Enim accusantium commodi deleniti excepturi voluptates quas voluptatibus expedita laboriosam ipsam tempore saepe beatae non velit, labore pariatur, ipsum autem consequatur! Consequatur.
                                            </div>
                                            <div class="right-post-date">
                                                24 Tháng Năm, 2021
                                            </div>
                                        </div>

                                        <div class="right-post-card">
                                            <h5>LOREM, IPSUM DOLOR SIT AMET</h5>
                                            <div class="right-post-content">
                                                Enim accusantium commodi deleniti excepturi voluptates quas voluptatibus expedita laboriosam ipsam tempore saepe beatae non velit, labore pariatur, ipsum autem consequatur! Consequatur.
                                            </div>
                                            <div class="right-post-date">
                                                24 Tháng Năm, 2021
                                            </div>
                                        </div>
                                    </div>

                                </div>-->
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <!--        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
                <script
                    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                    integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                    crossorigin="anonymous"
                ></script>
                <script>
                                    $("#navbarDropdown").click(function () {
                        $('.dropdown-toggle').dropdown();
                    })
                </script>-->
        <script src="./js/main.js"></script>
    </body>
</html>
