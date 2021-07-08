<%-- 
    Document   : searchBlog
    Created on : Jun 4, 2021, 11:49:00 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Blog</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
                    <c:if test="${not empty searchValue}">
                        <c:set var="searchResult" value="${requestScope.SEARCH_LIST}"/>
                        <jsp:useBean id="identity" class="web.models.tblIdentity.IdentityDAO" scope="request"/>
                        <jsp:useBean id="cate" class="web.models.tblBlogCategory.BlogCategoryDAO" scope="request"/>
                        <c:if test="${not empty searchResult}">
                            <c:forEach var="dto" items="${searchResult}">
                                <div class="blog-preview d-flex">
                                    <div class="blog-thumbnail">
                                        <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                                            <img src="./images/blog/${dto.thumbnail}" />
                                        </a>
                                    </div>
                                    <div>
                                        <div class="preview-title">
                                            <a href="ViewBlogDetailServlet?id=${dto.blogID}">
                                                <h4>${dto.title}</h4>
                                            </a>
                                        </div>
                                        <div class="date">
                                            ${dto.createdDate}
                                        </div>
                                        <div class="sub-body">
                                            ${dto.description}
                                        </div>
                                        <div class="d-flex">
                                            <div class="author">
                                                <c:set var="staffID" value="${dto.authorID}"/>
                                                Tác giả: ${identity.getStaffOrManagerNameByIdentityId(staffID)}
                                            </div>
                                            <div class="cate" style="position: absolute;right: 0; margin-right: 2em;">
                                                <c:forEach items="${cate.viewBlogCategory()}" var="category">
                                                    <c:if test="${category.categoryID eq dto.categotyID}">
                                                        <c:url var="viewbycate" value = "ViewBlogByCateServlet">
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
                                    <c:set var="index" value="${param.idx}"/>
                                    <c:if test="${index-1 != 0}">
                                        <li class="page-item">
                                            <a class="page-link" href="ViewBlogServlet?index=${index-1}" aria-label="Previous">
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
                                                <a class="page-link" href="ViewBlogServlet?index=${i}">${i}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${i != index}">
                                            <li class="page-item">
                                                <a class="page-link" href="ViewBlogServlet?index=${i}">${i}</a>
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
                                            <a class="page-link" href="ViewBlogServlet?index=${index+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </c:if>
                        <c:if test="${empty searchResult}">
                            Không tìm thấy kết quả!
                        </c:if>
                    </c:if>
                </div>

            </div> 
        </div>
        <jsp:include page="footer.jsp"/>

    </body>
</html>
