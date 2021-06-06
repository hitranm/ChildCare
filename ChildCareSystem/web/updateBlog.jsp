<%-- 
    Document   : createBlog
    Created on : May 26, 2021, 9:50:33 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://cdn.tiny.cloud/1/2t4he0yxbmprjqhk0y813ygaxy9y5u0mjixyrmjobarrfcvj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: 'textarea#editor',
                skin: 'bootstrap',
                plugins: 'lists, link, image, media',
                toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
                menubar: false
            });
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#editor',
                menubar: false
            });
        </script>
        <title>Update Blog</title>
    </head>

    <body>
        <a href="home.jsp">Trở về trang chủ</a>
        <div class="container mt-4 mb-4">
            <div class="row justify-content-md-center">
                <div class="col-md-12 col-lg-8">
                    <h1 class="h2 mb-4">Chỉnh sửa bài viết</h1>
                    <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
                    <form action="DispatchServlet" method="POST">
                        <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                        <c:set var="blog" value="${sessionScope.BLOG_DETAIL}"/>
                        <input type="hidden" name="txtBlogID" value="${blog.blogID}" />
                        <label><b>Tiêu đề</b></label><br/>
                        <input type="text" name="txtTitle" value="${blog.title}" />
                        <c:if test="${not empty err.titleLengthErr}">
                            <font color="red">${err.titleLengthErr}</font>
                        </c:if><br>
                        <label for="category">Thể loại:</label>
                        <select name="category" id="category">
                            <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                                <c:if test="${blog.categotyID eq dto.categoryID}">
                                    <option value="${dto.categoryID}" selected>${dto.categoryName}</option>
                                </c:if>
                                <c:if test="${blog.categotyID != dto.categoryID}">
                                    <option value="${dto.categoryID}">${dto.categoryName}</option>
                                </c:if>
                            </c:forEach>
                        </select><br/>
                        <%--<c:set var="blogCate" value="${requestScope.CATE_LIST}"/>
<!--                        <label for="category">Thể loại:</label>
                        <select name="category" id="category">
                            <c:forEach var="cateList" items="${blogCate}">
                                <option value="${cateList.categoryID}">${cateList.categoryName}</option>
                            </c:forEach>
                        </select><br/>-->--%>
                        <label>Nội dung bài viết</label>
                        <div class="form-group" name="txtBody">
                            <textarea id="editor" name="txtBody" value="${blog.description}"></textarea>
                        </div>
                        <c:if test="${not empty err.descriptionErr}">
                            <font color="red">${err.descriptionErr}</font>
                        </c:if><br>
                        <button type="submit" value="UpdateBlog" name="btAction">Cập nhật</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
