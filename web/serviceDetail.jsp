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
        <link rel="stylesheet" href="./css/service/serviceDetail.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <title>Dịch vụ | ${service.serviceName}</title>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            svg {
                color: #fed330;
            }

        </style>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="body-top mt-3">
                <div class="service-name text-center mb-4">
                    <h2>${service.serviceName}</h2>
                </div>
                <c:set var="role" value="${sessionScope.ROLEID}"/>
            </div>
            <div class="row mb-5">
                <div class="body-left col-12">
                    <div>
                        <div class="service-thumb mb-3">
                            <img src="./images/service/${service.thumbnail}"/>
                        </div>
                        <div class="service-des">
                            ${service.description}
                        </div>
                        <div class="price text-center float-right">
                            ${service.price}00đ
                        </div>
                    </div>
                    <div class="funct-button text-center mt-5">
                        <c:set var="author" value="${service.createPersonId}"/>
                        <c:set var="identity" value="${sessionScope.IDENTITY_ID}"/>
                        <c:if test="${role eq 1}">
                            <c:url var="reservationLink" value="DispatchServlet">
                                <c:param name="btAction" value="ChooseServiceReserve"/>
                                <c:param name="serviceId" value="${service.serviceId}"/>
                            </c:url>

                            <a class="btn btn-primary col-4" href="${reservationLink}">Đặt dịch vụ</a><br>
                        </c:if>
                        <c:if test="${role eq 2 and author eq identity}">
                            <a class="btn btn-primary mt-2 col-4" href="LoadServiceServlet?id=${service.serviceId}">Cập nhật</a>
                            <a class="btn btn-danger mt-2 col-4" onclick="return deleteConfirm()" href="DeleteServiceServlet?id=${service.serviceId}" name="btAction">Xóa</a><br>
                        </c:if>
                        <c:if test="${role eq 3}">
                            <a class="btn btn-danger mt-2 col-4" onclick="return deleteConfirm()" href="DeleteServiceServlet?id=${service.serviceId}" name="btAction">Xóa</a><br>
                            <div class="status mt-4">
                                <form action="UpdateServiceStatusServlet" method="POST">
                                    <input type="hidden" name="txtServiceID" value="${service.serviceId}" />
                                    <c:choose>
                                        <c:when test="${service.statusId eq 0}">
                                            <button class="btn btn-outline-primary col-4" type="submit" value="1" name="status">Duyệt dịch vụ</button>
                                            <button class="btn btn-outline-danger col-4" type="submit" value="2" name="status">Từ chối</button>
                                        </c:when>
                                        <c:when test="${service.statusId eq 1}">
                                            <button class="btn btn-outline-secondary col-4" type="submit" value="0" name="status">Ẩn dịch vụ</button>
                                        </c:when>
                                        <c:when test="${service.statusId eq 2}">
                                            <button class="btn btn-outline-primary col-4" type="submit" value="1" name="status">Hiện bài đăng</button>
                                        </c:when>
                                    </c:choose>
                                </form>
                            </div>
                        </c:if>
                    </div>


                </div>

            </div>

            <!-- Feedback Section -->
            <div class="row d-flex mb-4">
                <div class="col-12">
                    <div class="headings d-flex justify-content-between align-items-center mb-3 ">
                        <h5>Phản hồi về dịch vụ</h5>
                    </div>
                    <c:choose>
                        <c:when test="${not empty requestScope.FEEDBACK_LIST}">
                            <c:forEach items="${requestScope.FEEDBACK_LIST}" var="feedbackDTO">
                                <div class="card p-3 mt-2 bg-light">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="user d-flex flex-row align-items-center"> 
                                            <span>
                                                <small class="font-weight-bold">${feedbackDTO.comment}</small>
                                            </span> 
                                        </div> 
                                        <div>
                                            ${feedbackDTO.rate}
                                            <svg
                                                width="1.1em"
                                                height="1.1em"
                                                viewBox="0 0 16 16"
                                                class="bi bi-star-fill"
                                                fill="currentColor"
                                                xmlns="http://www.w3.org/2000/svg"                      
                                                >
                                            <path
                                                d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"
                                                />
                                            </svg>                                         
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <script src="./js/main.js"></script>
    </body>
</html>
