<%-- 
    Document   : serviceDetail
    Created on : Jun 16, 2021, 12:37:21 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="service" value="${sessionScope.SERVICE_DETAIL}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link rel="stylesheet" href="./css/service/serviceDetail.css"/>
        <title>Dịch vụ | ${service.serviceName}</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="body-top row">
                <div class="service-name text-center col-9 mb-2">
                    <h1>${service.serviceName}</h1>
                </div>
                <div class="col-3 text-center">
                    <a class="btn btn-primary mt-2" href="#" name="btAction">Đặt dịch vụ</a><br>
                </div>
            </div>
            <div class="body-left col-lg-9 col-12 d-flex mb-5">
                <div class="service-thumb mr-3">
                    <img src="${service.thumbnail}"/>
                </div>
                <div>
                    <div class="service-des">
                        ${service.description}
                    </div>
                    <div class="text-center d-flex float-right">
                        <c:if test="${service.price eq service.salePrice}">
                            <div class="sale-price">
                                ${service.price}đ
                            </div>
                        </c:if>
                        <c:if test="${service.price != service.salePrice}">
                            <div class="price">
                                <strike>${service.price}đ</strike>
                            </div>
                            <div class="sale-price ml-3">
                                ${service.salePrice}đ
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="form-group col-lg-9 col-12 mb-5">
                <textarea class="form-control" placeholder="Đánh giá dịch vụ" rows="2"></textarea>
                <button class="btn btn-primary float-right mt-1">Đăng</button>
            </div>
        </div>
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
