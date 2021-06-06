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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog | ${blog.title}</title>
    </head>
    <body>
        <h1>${blog.title}</h1>
        <input type="hidden" name="txtBlogID" value="${blog.blogID}" />
        <div>
            <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                <c:if test="${blog.categotyID eq dto.categoryID}">
                    Thể loại: ${dto.categoryName}
                </c:if>
            </c:forEach>
        </div>
        <div>${blog.description}</div>
        <a href="UpdateBlogServlet?id=${blog.blogID}" name="btAction">Cập nhật bài viết</a><br>
        <a href="DeleteBlogServlet?id=${blog.blogID}" name="btAction">Xóa</a><br>
        <a href="ViewBlogServlet?index=1">Xem tất cả các bài viết</a>
    </body>
</html>
