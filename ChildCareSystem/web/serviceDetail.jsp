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
        <c:set var="service" value="${requestScope.SERVICE_DETAIL}"/>
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
                    <h1>${service.serviceName}
                        ${service.statusId}
                    </h1>
                </div>
                <div class="col-3 text-center">
                    <a class="btn btn-primary mt-2" href="#" name="btAction">Đặt dịch vụ</a><br>
                    <a class="btn btn-primary mt-2" href="LoadServiceServlet?id=${service.serviceId}">Cập nhật</a>
                    <a class="btn btn-danger mt-2" onclick="return deleteConfirm()" href="DeleteServiceServlet?id=${service.serviceId}" name="btAction">Xóa</a><br>
                </div>
                <c:set var="role" value="${sessionScope.ROLEID}"/>
                <c:if test="${role eq 3}">
                    <div class="status mt-4">
                        <form action="UpdateServiceStatusServlet" method="POST">
                            <input type="hidden" name="txtServiceID" value="${service.serviceId}" />
                            <c:choose>
                                <c:when test="${service.statusId eq 0}">
                                    <button class="btn btn-outline-primary" type="submit" value="1" name="status">Duyệt bài</button>
                                    <button class="btn btn-outline-primary" type="submit" value="2" name="status">Từ chối</button>
                                </c:when>
                                <c:when test="${service.statusId eq 1}">
                                    <button class="btn btn-outline-primary" type="submit" value="0" name="status">Ẩn dịch vụ</button>
                                </c:when>
                                <c:when test="${service.statusId eq 2}">
                                    <button class="btn btn-outline-primary" type="submit" value="1" name="status">Hiện bài đăng</button>
                                </c:when>
                            </c:choose>
                        </form>
                    </div>
                </c:if>
            </div>
            <div class="row">
                <div class="body-left col-lg-9 col-12">
                    <div>
                        <div class="service-thumb">
                            <img src="./images/service/${service.thumbnail}"/>
                        </div>

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
            </div>
            <div class="row d-flex justify-content-center m-2 mb-4">
                <div class="col-12">
                    <div class="headings d-flex justify-content-between align-items-center mb-3 ">
                        <h5>Phản hồi về dịch vụ</h5>

                    </div>
                    <div class="card p-3 mt-2 bg-light">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="user d-flex flex-row align-items-center"> 
                                <span>
                                    <small class="font-weight-bold">Dịch vụ tốt</small>
                                </span> 
                            </div> 
                            <small>1 tuần trước</small>
                        </div>
                    </div>
                    <div class="card p-3 mt-2 bg-light">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="user d-flex flex-row align-items-center"> 
                                <span>
                                    <small class="font-weight-bold">Bác sĩ tận tâm</small>
                                </span> 
                            </div> 
                            <small>1 tuần trước</small>
                        </div>
                    </div>
                    <div class="card p-3 mt-2 bg-light">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="user d-flex flex-row align-items-center"> 
                                <span>
                                    <small class="font-weight-bold">Cơ sở vật chất hiện đại, đội ngũ y tế giỏi</small>
                                </span> 
                            </div> 
                            <small>1 tuần trước</small>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="footer.jsp"/>
        <script src="./js/main.js"></script>
    </body>
</html>
