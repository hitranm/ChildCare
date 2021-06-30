<%-- 
    Document   : viewBlogList
    Created on : May 27, 2021, 1:31:39 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog List</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <div class="container">
                <h1 class="text-center mb-2">BÀI VIẾT</h1> 
                <div class="body-top d-flex">
                    <div class="search col-9">
                        <form action="SearchBlogServlet?idx=1" method="POST">
                            <input type="text" class="form-group" placeholder="Tìm kiếm" name="txtSearchBlog" value="${param.txtSearchBlog}" />
                            <button id="search-button" type="text" value="Search" class="btn btn-primary" name="btAction">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                    <div class="create-blog col-3">
                        <a class="btn btn-primary" href="createBlog.jsp">Tạo bài viết</a>
                    </div>
                </div>
                <div class="main-wrapper">
                    <div class="body-left col-lg-9 col-12">
                        <c:if test="${empty searchValue}">
                            <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
                            <c:set var="list" value="${requestScope.BLOG_LIST}"/>
                            <c:if test="${not empty list}">
                                <c:forEach var="dto" items="${list}">
                                    <div class="blog-preview d-flex">
                                        <div class="blog-thumbnail">
                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                                                <img src="./images/blog/${dto.thumbnail}" />
                                            </a>
                                        </div>
                                        <div>
                                            <div class="preview-title ">
                                                <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                                                    <h4>${dto.title}</h4>
                                                </a>
                                            </div>
                                            <div class="date">
                                                ${dto.createdDate}
                                            </div>

                                            <div class="author">
                                                Tác giả: 
                                            </div>
                                            <div class="cate" style="position: absolute;right: 0; margin-right: 2em;" >
                                                <c:forEach items="${cate.viewBlogCategory()}" var="category">
                                                    <c:if test="${category.categoryID eq dto.categotyID}">
                                                        <a class="btn btn-link btn-sm" href="#">#${category.categoryName}</a>
                                                    </c:if>
                                                </c:forEach>
                                            </div>

                                        </div>

                                    </div>
                                </c:forEach>
                                <div class="paging mb-2" align="center">
                                    <c:forEach begin="1" end="${PAGE}" var="i">
                                        <a href="ViewBlogServlet?index=${i}">${i}</a>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <c:if test="${empty list}">
                                Bạn chưa có bài viết nào!
                            </c:if>

                        </c:if>

                    </div>
                    <!--                    <div class="main-right d-none d-lg-flex col-lg-3 mt-3">
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
                    <%--<c:if test="${empty result}">--%>
                    <!--Bạn chưa có bài viết nào!-->
                    <%--</c:if>--%>

                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
