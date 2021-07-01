<%-- 
    Document   : searchService
    Created on : Jun 27, 2021, 7:56:14 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Service</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <h1 class="text-center mb-2">DỊCH VỤ</h1>
            <div class="body-top d-flex">
                <div class="search col-9">
                    <form action="SearchServiceServlet?idx=1" method="POST">
                        <input type="text" class="form-group" placeholder="Tìm kiếm" name="txtSearchBlog" value="${param.txtSearchBlog}" />
                        <button id="search-button" type="text" value="Search" class="btn btn-primary" name="btAction">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>
                <div class="create-blog col-3">
                    <a class="btn btn-primary" href="createBlog.jsp">Tạo bài viết</a>
                </div>
            </div>
        </div>
    </body>
</html>
