<%-- 
    Document   : serviceList
    Created on : Jun 15, 2021, 1:58:15 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dịch vụ</title>
        <link rel="stylesheet" href="./css/service/serviceList.css" />
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
        <jsp:include page="header.jsp"/>
        <div class="loader">
            <img src="images/loading.gif" alt="Loading..." />
        </div>

        <main>
            <div class="container my-5">
                <h2 class="text-center mb-2">DỊCH VỤ</h2> 
                <div class="body-top d-flex">
                    <div class="search col-9">
                        <form action="tim-kiem-dich-vu" method="POST">
                            <input type="hidden" name="index" value="1" />
                            <input type="text" class="form-group" placeholder="Tìm kiếm" name="txtSearchService" value="${param.txtSearchService}" />
                            <button id="search-button" type="text" value="Search" class="btn btn-primary" name="btAction">
                                <i class="fas fa-search"></i>
                            </button>
                        </form> 
                    </div>
                </div>
                <div class="main-wrapper">
                    <c:set var="list" value="${requestScope.SERVICE_LIST}"/>
                    <c:if test="${not empty list}">
                        <c:forEach var="dto" items="${list}">
                            <div class="service-preview d-flex">
                                <div class="service-thumbnail">
                                    <a href="chi-tiet-dich-vu?id=${dto.serviceId}">
                                        <img src="./images/service/${dto.thumbnail}"/>
                                    </a>
                                </div>
                                <div>
                                    <div class="service-name">
                                        <a href="chi-tiet-dich-vu?id=${dto.serviceId}">
                                            <h4>${dto.serviceName}</h4>
                                        </a>
                                    </div>
                                    <div class="service-descript text-secondary">
                                        ${dto.description}
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
                                        <a class="page-link" href="dich-vu?trang=${index-1}" aria-label="Previous">
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
                                            <a class="page-link" href="dich-vu?trang=${i}">${i}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i != index}">
                                        <li class="page-item">
                                            <a class="page-link" href="dich-vu?trang=${i}">${i}</a>
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
                                        <a class="page-link" href="dich-vu?trang=${index+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </c:if>
                    <c:if test="${empty list}">
                        Chưa có dịch vụ nào!
                    </c:if>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
        <script src="./js/main.js"></script>
        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            });
        </script>
    </body>
</html>
