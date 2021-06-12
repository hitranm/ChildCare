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
        <link rel="stylesheet" href="./css/createBlog.css" />
        <title>Blog</title>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
        <div class="container mt-4 mb-4">
            <div class="row justify-content-md-center">
                <div class="col-md-12 col-lg-8">
                    <h1 class="h2 mb-4 text-center">Tạo blog</h1>
                    <form action="DispatchServlet" method="POST" enctype="multipart/form-data">
                        <c:set var="err" value="${requestScope.CREATE_ERROR}"/>
                        <div class="row justify-content-between mr-1">
                            <div class="col-9">
                                <label><h5>Tiêu đề: </h5></label>
                                <input type="text" name="txtTitle" value="" />
                                <c:if test="${not empty err.titleLengthErr}">
                                    <font color="red">${err.titleLengthErr}</font>
                                </c:if>
                            </div>
                            <select class="form-select col-3" aria-label="Default select example" name="category" id="category">
                                <option selected>-Thể loại- </option>
                                <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                                    <option value="${dto.categoryID}">${dto.categoryName}</option>
                                </c:forEach>

                                <!--                            <option value="2">Hướng dẫn</option>
                                                            <option value="3">Sức khỏe</option>-->
                            </select><br/>
                        </div>
                        <label>Nội dung bài viết</label>
                        <div class="form-group" name="txtBody">
                            <textarea id="editor" name="txtBody"></textarea>
                        </div>
                        <c:if test="${not empty err.descriptionErr}">
                            <font color="red">${err.descriptionErr}</font>
                        </c:if>

                        <!--                        <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Upload</span>
                                                    </div>
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="inputGroupFile01" name="imageURL">
                                                        <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                                                    </div>
                                                </div>-->
                        <a class="btn btn-secondary float-right ml-2" onclick="return cancelConfirm()" href="ViewBlogServlet?index=1">Hủy</a>
                        <button class="btn btn-primary float-right" type="submit" value="CreateBlog" name="btAction">Tạo bài viết</button>
                        
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="./js/main.js"></script>
    </body>
</html>
