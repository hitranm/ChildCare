<%-- 
    Document   : successCheckout
    Created on : Jun 21, 2021, 10:41:21 AM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán thành công</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            main {
                min-height: 50vh;
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

        <!-- Authorize -->
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'customer'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <!-- -->

        <main>
            <div class="px-5 align-middle mt-5">
                <div class="alert alert-success text-center" role="alert">
                    <h3>Đặt dịch vụ thành công</h3>
                </div>
                <div class="text-center">
                    <a class="btn btn-primary" href="trang-chu" role="button">Quay về trang chủ</a>
                    <a class="btn btn-success" href="xem-lich-su-kham" role="button">Xem lịch sử đặt</a>
                </div>

            </div>

        </main>



        <jsp:include page="footer.jsp"/>
    </body>
</html>
