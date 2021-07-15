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
        <title>Bài viết</title>
        <link rel="stylesheet" href="./css/blog/viewblog.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <div class="container my-5">
                <h2 class="text-center mb-2">BÀI VIẾT</h2>
                <div class="body-top d-flex">
                    <div class="search col-9">
                        <form action="tim-kiem-bai-viet" method="POST">
                            <input type="hidden" name="idx" value="1" />
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
                            <jsp:useBean id="identity" class="web.models.tblIdentity.IdentityDAO" scope="request"/>
                            <c:set var="list" value="${requestScope.BLOG_LIST}"/>
                            <c:if test="${not empty list}">
                                <c:forEach var="dto" items="${list}">
                                    <div class="blog-preview d-flex">
                                        <div class="blog-thumbnail">
                                            <a href="chi-tiet-bai-viet?id=${dto.blogID}">
                                                <img src="./images/blog/${dto.thumbnail}" />
                                            </a>
                                        </div>
                                        <div>
                                            <div class="preview-title ">
                                                <a href="chi-tiet-bai-viet?id=${dto.blogID}">
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
                                                    Tác giả: ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                                </div>
                                                <div class="cate" style="position: absolute;right: 0; margin-right: 2em;" >
                                                    <c:forEach items="${cate.viewBlogCategory()}" var="category">
                                                        <c:if test="${category.categoryID eq dto.categotyID}">
                                                            <c:url var="viewbycate" value = "bai-viet-chu-de">
                                                                <c:param name="txtCateID" value="${dto.categotyID}"/>
                                                                <c:param name="index" value="1"/>
                                                            </c:url>
                                                            <a class="btn btn-link btn-sm" href="${viewbycate}">#${category.categoryName}</a>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </c:forEach>
                                <nav aria-label="Paging">
                                    <c:set var="page" value="${requestScope.PAGE}"/>
                                    <ul class="pagination justify-content-center">
                                        <c:set var="index" value="${param.index}"/>
                                        <c:if test="${index-1 != 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="bai-viet?trang=${index-1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:if test="${index-1 eq 0}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${PAGE}" var="i">
                                            <c:if test="${i eq index}">
                                                <li class="page-item active">
                                                    <a class="page-link" href="bai-viet?trang=${i}">${i}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${i != index}">
                                                <li class="page-item">
                                                    <a class="page-link" href="bai-viet?trang=${i}">${i}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${index eq page}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${index != page}">
                                            <li class="page-item">
                                                <a class="page-link" href="bai-viet?trang=${index+1}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </nav>
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
    </body>
</html>
