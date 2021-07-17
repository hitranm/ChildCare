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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
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
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'manager'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <jsp:include page="header.jsp" />
        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>
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
                                <a class="btn btn-outline-danger" onclick="return confirmation()" href="DeleteCategoryServlet?id=${dto.categoryID}">Xóa</a>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn xóa chủ đề này?");
                return r;
            }
        </script>
    </body>
</html>
