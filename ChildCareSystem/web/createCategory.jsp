<%-- 
    Document   : createCategory
    Created on : Jun 25, 2021, 9:50:00 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chủ đề</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="cate-form-wrapper justify-content-between d-flex flex-column align-items-center p-5">
            <h1>Tạo chủ đề mới</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6 mt-4">
                <div class="form-row mt-3">
                    <label for="category-name">Tên chủ đề</label>
                    <input type="text" class="form-control" name="txtCategory" value="" required/>
                </div>
                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="CreateCate">Tạo mới</button>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>