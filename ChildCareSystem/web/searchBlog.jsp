<%-- 
    Document   : searchBlog
    Created on : Jun 4, 2021, 11:49:00 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Blog</title>
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
        <link rel="stylesheet" href="./css/viewblog.css" />
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="body-top d-flex">
                <div class="search col-9">
                    <form action="SearchBlogServlet?idx=1" method="POST">
                        <b>Tìm kiếm bài viết:</b> <input type="text" name="txtSearchBlog" value="${param.txtSearchBlog}" />
                        <input type="submit" value="Search" name="btAction">
                    </form>
                </div>
                <div class="create-blog col-4">
                    <a href="createBlog.jsp">Tạo bài viết</a>
                </div>
            </div>
            <div class="main-wrapper">
                <div class="body-left col-9">
                    <c:set var="searchValue" value="${param.txtSearchBlog}"/>
                    <c:if test="${not empty searchValue}">
                        <c:set var="searchResult" value="${requestScope.SEARCH_LIST}"/>
                        <c:if test="${not empty searchResult}">
                            <c:forEach var="dto" items="${searchResult}">
                                <div class="blog-preview d-flex">
                                    <div class="blog-thumbnail">
                                        <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                                            <img src="${dto.thumbnail}" />
                                        </a>
                                    </div>
                                    <div>
                                        <div class="preview-title">
                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                                                <h4>${dto.title}</h4>
                                            </a>
                                        </div>
                                        <div class="date">
                                            Ngày 10 tháng Sáu năm 2021
                                        </div>
                                        <div class="author">
                                            Tác giả: 
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="paging" align="center">
                                <c:forEach begin="1" end="${END_PAGE}" var="i">
                                    <a href="SearchBlogServlet?idx=${i}&txtSearchBlog=${SEARCH_VAR}">${i}</a>
                                </c:forEach>
                            </div>
                        </c:if>
                        <c:if test="${empty searchResult}">
                            Không tìm thấy kết quả!
                        </c:if>

                    </c:if>
                    <c:if test="${empty searchValue}">
                        <jsp:forward page = "ViewBlogServlet?index=1"/>
                    </c:if>
                </div>
                <div class="main-right d-none d-lg-flex col-lg-3">
                    <div class="right-post-section">
                        <h4>Bài viết mới nhất</h4>
                        <div class="right-post-card">
                            <h5>LOREM, IPSUM DOLOR SIT AMET</h5>
                            <div class="right-post-content">
                                Enim accusantium commodi deleniti excepturi voluptates quas voluptatibus expedita laboriosam ipsam tempore saepe beatae non velit, labore pariatur, ipsum autem consequatur! Consequatur.
                            </div>
                            <div class="right-post-date">
                                24 Tháng Năm, 2021`
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

                </div>
                <%--<c:if test="${empty result}">--%>
                <!--Bạn chưa có bài viết nào!-->
                <%--</c:if>--%>

            </div> 
        </div>
        <jsp:include page="footer.jsp"/>

    </body>
</html>
