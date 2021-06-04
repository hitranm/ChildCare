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
    </head>
    <body>
        <h1>Danh sách bài viết</h1>
        <form action="SearchBlogServlet?idx=1" method="POST">
            Tìm kiếm: <input type="text" name="txtSearchBlog" value="${param.txtSearchBlog}" />
            <input type="submit" value="Search" name="btAction">
        </form>
        <c:set var="searchValue" value="${param.txtSearchBlog}"/>
        <c:if test="${not empty searchValue}">
            <c:set var="searchResult" value="${requestScope.SEARCH_LIST}"/>
            <c:if test="${not empty searchResult}">
                <c:forEach var="dto" items="${searchResult}">
                    <div class="blog-preview">
                        <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                            <h2>${dto.title}</h2>
                        </a>
                    </div>
                </c:forEach>
                <div class="paging">
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
        <a href="createBlog.jsp">Tạo bài viết</a>
        <a href="home.jsp">Trở về trang chủ</a> 
    </body>
</html>
