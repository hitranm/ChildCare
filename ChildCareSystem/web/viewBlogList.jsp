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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./css/blog/viewblog.css" />
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
                </div>
                <div class="main-wrapper">
                    <div class="body-left col-12">
                        <c:set var="searchValue" value="${param.txtSearchBlog}"/>
                        <c:if test="${empty searchValue}">
                            <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
                            <jsp:useBean id="staff" class="web.models.tblStaff.StaffDAO" scope="request"/>
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
                                                ${dto.updateDate}
                                            </div>
                                            <div class="sub-body">
                                                ${dto.description}
                                            </div>
                                            <div class="d-flex">
                                                <div class="author">
                                                    <c:set var="staffID" value="${dto.authorID}"/>
                                                    Tác giả: ${staff.getStaffName(staffID)}
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

                                    </div>
                                </c:forEach>
                                <div class="d-flex justify-content-center" style="width: 100%">
                                    <div class="paging mb-2" align="center">
                                        <c:set var="index" value="${param.index}"/>
                                        <c:forEach begin="1" end="${PAGE}" var="i">
                                            <c:if test="${i eq index}">
                                                <a class="number active" href="ViewBlogServlet?index=${i}">${i}</a>
                                            </c:if>
                                            <c:if test="${i != index}">
                                                <a class="number" href="ViewBlogServlet?index=${i}">${i}</a>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${empty list}">
                                Bạn chưa có bài viết nào!
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
        <!--        <script>
                    // Get the container element
                    var btnContainer = document.getElementByClassName("paging");
        
        // Get all buttons with class="btn" inside the container
                    var btns = btnContainer.getElementsByClassName("number");
        
        // Loop through the buttons and add the active class to the current/clicked button
                    for (var i = 0; i < btns.length; i++) {
                        btns[i].addEventListener("click", function () {
                            var current = document.getElementsByClassName("active");
                            current[0].className = current[0].className.replace(" active", "");
                            this.className += " active";
                        });
                    }
                </script>-->
    </body>
</html>
