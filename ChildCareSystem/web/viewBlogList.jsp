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
        <h1>Danh sách bài viết của bạn</h1>

        <c:set var="result" value="${requestScope.BLOG_LIST}"/>
        <c:if test="${not empty result}">
            <c:forEach var="dto" items="${result}">
                <div class="blog-preview">
                    <a href="blogDetail.jsp">
                        <h2>${dto.title}</h2>
                    </a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty result}">
            Bạn chưa có bài viết nào!
        </c:if>
        <a href="home.jsp">Trở về trang chủ</a>    
    </body>
</html>
