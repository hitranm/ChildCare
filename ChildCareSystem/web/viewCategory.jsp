<%-- 
    Document   : viewCategory
    Created on : Jun 25, 2021, 9:49:39 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chủ đề bài viết</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <c:set var="cate" value="${requestScope.CATEGORY}"/>        
        <div class="container">
            <div class="body-top text-center mt-2"><h1>Danh sách chủ đề</h1></div>
            <table class="table mt-4">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col" class="col-9 text-center">Chủ đề</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${cate}">
                    <form action="DispatchServlet" method="POST">
                        <tr>
                            <th scope="row">${dto.categoryID}</th>
                            <td>
                                <input type="text" class="form-control" name="txtCateName" value="${dto.categoryName}" required/>
                            </td>
                            <td>
                                <input type="hidden" name="txtCateID" value="${dto.categoryID}" />
                                <button class="btn btn-outline-primary" type="submit" value="UpdateCate" name="btAction">Cập nhật</button>
                            </td>
                            <td>
                                <a class="btn btn-outline-danger" href="DeleteCategoryServlet?id=${dto.categoryID}">Xóa</a>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
