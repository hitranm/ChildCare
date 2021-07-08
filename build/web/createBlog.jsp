<%--
    Document   : createBlog
    Created on : May 26, 2021, 9:50:33 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->       
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="./css/blog/createBlog.css" />
        <script src="https://cdn.tiny.cloud/1/2t4he0yxbmprjqhk0y813ygaxy9y5u0mjixyrmjobarrfcvj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: 'textarea#blog-content',
                skin: 'bootstrap',
                plugins: 'lists, link, image, media',
                toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
                menubar: false
            });
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#blog-content',
                menubar: false
            });
        </script>

        <title>Blog</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>

        <!-- Authorize -->
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'staff' and sessionScope.ROLE != 'manager'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <!-- -->
        

        <c:set var="err" value="${requestScope.CREATE_BLOG}"/>
        <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
        <div class="blog-wrapper">
            <h1 class="h2 mb-4">Tạo bài viết mới</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="title">Tiêu đề</label>
                        <input class="form-control" type="text" name="txtTitle" value="${param.txtTitle}" id="title"/>
                        <c:if test="${not empty err.titleLengthErr}">
                            <small class="text-danger">${err.titleLengthErr}</small>
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="category">Thể loại</label>
                        <select class="form-control" name="category" id="category">
                            <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                                <option value="${dto.categoryID}">${dto.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="content">Nội dung bài viết</label>
                    <textarea class="form-control" id="blog-content" name="txtBody">${param.txtBody}</textarea>
                    <c:if test="${not empty err.descriptionErr}">
                        <small class="text-danger">${err.descriptionErr}</small>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="image">Ảnh nền</label>
                    <input type="file" class="form-control" name="imageURL" id="image">
                    <c:if test="${not empty err.imgErr}">
                        <div class="text-danger">
                            <small>${err.imgErr}</small>
                        </div>
                    </c:if>
                </div>
                <div class="text-center">                
                    <button class="btn btn-primary col-6 col-md-3" type="submit" value="CreateBlog" name="btAction">Tạo bài viết</button>
                    <a class="btn btn-secondary col-6 col-md-3" onclick="return cancelConfirm()" href="ViewBlogByAuthorServlet">Hủy</a>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>

        <script src="./js/main.js"></script>
    </body>
</html>
