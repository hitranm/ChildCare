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
        <h1>Danh sách bài viết</h1>
        <form action="SearchBlogServlet?idx=1" method="POST">
            Tìm kiếm: <input type="text" name="txtSearchBlog" value="${param.txtSearchBlog}" />
            <input type="submit" value="Search" name="btAction">
        </form>
            
        <c:if test="${empty searchValue}">
            <c:set var="list" value="${requestScope.BLOG_LIST}"/>
            <c:if test="${not empty list}">
                <c:forEach var="dto" items="${list}">
                    <div class="blog-preview">
                        <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                            <h2>${dto.title}</h2>
                        </a>
                    </div>
                </c:forEach>
                <div class="paging">
                    <c:forEach begin="1" end="${PAGE}" var="i">
                        <a href="ViewBlogServlet?index=${i}">${i}</a>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty list}">
                Bạn chưa có bài viết nào!
            </c:if>

        </c:if>
        <%--<c:if test="${empty result}">--%>
        <!--Bạn chưa có bài viết nào!-->
        <%--</c:if>--%>
        <br>
        <a href="createBlog.jsp">Tạo bài viết</a>
        <a href="home.jsp">Trở về trang chủ</a>    
    </body>
</html>
