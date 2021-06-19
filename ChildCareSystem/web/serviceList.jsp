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
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
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
        <link rel="stylesheet" href="./css/service/serviceList.css" />
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <main>
            <div class="container">
                <h1 class="text-center mb-2">DỊCH VỤ</h1> 
                <div class="search">
                    <form action="SearchBlogServlet?idx=1" method="POST">
                        <input type="text" class="form-group" placeholder="Tìm kiếm" name="txtSearchBlog" value="${param.txtSearchBlog}" />
                        <button id="search-button" type="text" value="Search" class="btn btn-primary" name="btAction">
                            <i class="fas fa-search"></i>
                        </button>
                    </form> 
                </div>
                <div class="main-wrapper">
                    <c:set var="list" value="${requestScope.SERVICE_LIST}"/>
                    <c:if test="${not empty list}">
                        <div class="row text-center">
                            <c:forEach var="dto" items="${list}">
                                <div class="service-preview mb-3 col-lg-4">
                                    <div class="style">
                                        <div class="service-thumbnail">
                                            <a href="ViewServiceDetailServlet?id=${dto.serviceID}">
                                                <img src="./images/service/${dto.thumbnail}"/>
                                            </a>
                                        </div>
                                        <div class="service-name">
                                            <a href="ViewServiceDetailServlet?id=${dto.serviceID}">
                                                <h4>${dto.serviceName}</h4>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="service-name">
                                    <a href="ViewServiceDetailServlet?id=${dto.serviceID}">
                                        <h4>${dto.serviceName}</h4>
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="paging text-center mb-3">
                            <c:forEach begin="1" end="${PAGE}" var="i">
                                <a href="ViewServiceListServlet?index=${i}">${i}</a>
                            </c:forEach>
                        </div>
                    </c:if>
                    <c:if test="${empty list}">
                        Chưa có dich vu nào!
                    </c:if>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"/>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>
        <script>
            $("#navbarDropdown").click(function () {
                $('.dropdown-toggle').dropdown();
            })
        </script>
        <script src="./js/main.js"></script>
    </body>
</html>
