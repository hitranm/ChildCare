<%-- 
    Document   : home
    Created on : May 21, 2021, 11:19:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME PAGE</title>
    </head>
    <body>
        <h1>Welcome ${sessionScope.LOGIN_USER}</h1>
        <a href="createBlog.jsp">Tạo blog</a>
        <a href="viewBlogList.jsp">Xem các bài viết của bạn</a>
    </body>
</html>
