<%-- 
    Document   : createSpecialty
    Created on : Jun 23, 2021, 9:57:24 AM
    Author     : DELL
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chuyên khoa</title>
        <link rel="stylesheet" href="css/specialty/createSpecialty.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            body {
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
        <div class="specialty-form-wrapper justify-content-between">
            <h1>Tạo chuyên khoa mới</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6 mt-4">
                <div class="form-row mt-3">
                    <label for="specialty-name">Tên chuyên khoa</label>
                    <input type="text" class="form-control" name="txtSpecialty" value="" required/>
                </div>
                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="CreateSpecialty">Tạo mới</button>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
