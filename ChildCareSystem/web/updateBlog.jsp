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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
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
        <link rel="stylesheet" href="./css/createBlog.css" />
        <title>Update Blog</title>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            .loader {
                position: fixed;
                z-index: 99;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .loader > img {
                width: 100px;
            }

            .loader.hidden {
                animation: fadeOut 1s;
                animation-fill-mode: forwards;
            }

            @keyframes fadeOut {
                100% {
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>
        <c:set var="err" value="${requestScope.BLOG_ERROR}"/>
        <c:set var="blog" value="${requestScope.BLOG}"/>
        <div class="container mt-4 mb-4">
            <div class="row justify-content-md-center">
                <div class="col-md-12 col-lg-8">
                    <h1 class="h2 mb-4 text-center">Chỉnh sửa bài viết</h1>
                    <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
                    <form action="DispatchServlet" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="txtBlogID" value="${blog.blogID}" />
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="title">Tiêu đề:</label>
                                <input class="form-control" type="text" name="txtTitle" value="${blog.title}">
                                <c:if test="${not empty err.titleLengthErr}">
                                    <font color="red">${err.titleLengthErr}</font>
                                </c:if>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="category">Thể loại:</label>
                                <select class="form-control" name="category" id="category">
                                    <c:forEach items="${cate.viewBlogCategory()}" var="dto">
                                        <c:if test="${blog.categotyID eq dto.categoryID}">
                                            <option value="${dto.categoryID}" selected>${dto.categoryName}</option>
                                        </c:if>
                                        <c:if test="${blog.categotyID != dto.categoryID}">
                                            <option value="${dto.categoryID}">${dto.categoryName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <br/>

                        <label>Nội dung bài viết</label>
                        <div class="form-group" name="txtBody">
                            <textarea id="editor" name="txtBody">${blog.description}</textarea>
                        </div>
                        <c:if test="${not empty err.descriptionErr}">
                            <font color="red">${err.descriptionErr}</font>
                        </c:if><br>
                        <div class="form-group">
                            <label for="service-image">Ảnh nền</label>
                            <input type="file" class="form-control" id="service-image" name="imageURL">
                        </div>
                        <a class="btn btn-secondary float-right ml-2" onclick="return cancelConfirm()" href="ViewBlogDetailServlet?id=${blog.blogID}">Hủy</a>
                        <button class="btn btn-primary float-right" type="submit" value="UpdateBlog" name="btAction">Cập nhật</button>
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
        <script>
                            window.addEventListener('load', function () {
                                const loader = document.querySelector(".loader");
                                loader.className += " hidden"; // class "loader hidden"
                            });
        </script>
    </body>
</html>
