<%-- 
    Document   : viewSpeciaty
    Created on : Jun 23, 2021, 10:47:45 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chuyên khoa</title>
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
        <c:if test="${empty sessionScope.ROLE}">
                <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
                <jsp:forward page="login.jsp"/>
            </c:if>

            <c:if test="${sessionScope.ROLE != 'manager'}">
                <jsp:forward page="accessDenied.jsp"/>
            </c:if>
        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
        <jsp:include page="header.jsp" />
        <div class="container">
            <div class="body-top text-center mt-2"><h1>Danh sách chuyên khoa</h1></div>
            <table class="table mt-4">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col" class="col-9 text-center">Chuyên khoa</th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${specialty.viewSpecialtyList()}">
                    <form action="DispatchServlet" method="POST">
                        <tr>
                            <th scope="row">${dto.specialtyId}</th>
                            <td>
                                <input type="text" class="form-control" name="txtSpecialtyName" value="${dto.specialtyName}" required/>
                            </td>
                            <td>
                                <input type="hidden" name="txtSpecialtyID" value="${dto.specialtyId}" />
                                <button class="btn btn-outline-primary" type="submit" value="UpdateSpecialty" name="btAction">Cập nhật</button>
                            </td>
                            <td>
                                <a class="btn btn-outline-danger" onclick="return confirmation()" href="DeleteSpecialtyServlet?id=${dto.specialtyId}">Xóa</a>
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
                var r = confirm("Bạn có chắc muốn xóa chuyên khoa này?");
                return r;
            }
        </script>
    </body>
</html>
