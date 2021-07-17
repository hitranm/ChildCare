<%-- 
    Document   : serviceCart
    Created on : Jun 18, 2021, 9:30:36 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xem các đơn đặt khám</title>
        <link rel="stylesheet" href="css/service/serviceCart.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
    </head>
    <body>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            main {
                min-height: 70vh;
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
            <jsp:useBean id="totalPrice" class="web.models.Cart.CartObject" scope="session"/>
            <c:choose>
                <c:when test="${not empty sessionScope.CART_VIEW_MODEL}">         
                    <div class="wrapper my-5">
                        <h2 class="text-center my-5">Vui lòng kiểm tra lại thông tin trước khi thanh toán</h2>
                        <div class="service-card-wrapper my-5 col-12">
                            <c:forEach var="reservation" items="${sessionScope.CART_VIEW_MODEL}">
                                <div class="card col-12 col-md-8 my-3">
                                    <div class="card-header">
                                        Thông tin khám
                                    </div>
                                    <div class="card-body">
                                        <div class="patient-info">
                                            <div>
                                                Tên bệnh nhân: <span>${reservation.patientDTO.patientName}<span>
                                                        </div>
                                                        <div class="">
                                                            <div>Ngày sinh: <span>${reservation.patientDTO.birthday}</span></div>
                                                        </div>
                                                        <div>
                                                            Giới tính: 
                                                            <c:choose>
                                                                <c:when test="${reservation.patientDTO.gender eq 'male'}">
                                                                    <span>Nam</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span>Nữ</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>                  
                                                        </div>
                                                        <div class="service-info">
                                                            <table style="width: 100%;">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Chuyên khoa</th>
                                                                        <th>Dịch vụ</th>
                                                                        <th>Giờ khám</th>
                                                                        <th>Giá tiền</th>
                                                                        <th></th>
                                                                        <th></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td>${reservation.specialtyDTO.specialtyName}</td>
                                                                        <td>${reservation.serviceDTO.serviceName}</td>
                                                                        <td>${reservation.cartItem.checkInTime}</td>
                                                                        <td>${reservation.serviceDTO.price}00</td>
                                                                        <td>
                                                                            <c:url var="urlUpdate" value="cap-nhat-don-kham">
                                                                                <c:param name="id" value="${reservation.patientDTO.patientID}"/>
                                                                            </c:url>
                                                                            <a href="${urlUpdate}" role="button" class="btn btn-outline-primary">Chỉnh sửa</a>
                                                                        </td>
                                                                        <td>
                                                                            <c:url var="urlRemove" value="RemoveServiceFromCartServlet">
                                                                                <c:param name="txtPatientId" value="${reservation.patientDTO.patientID}"/>
                                                                            </c:url>
                                                                            <a href="${urlRemove}" role="button" class="btn btn-outline-danger">Xóa</a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        </div>
                                                        </div>
                                                    </c:forEach>
                                                    <div class="totalPrice col-8">Tổng cộng: <span>${sessionScope.TOTAL_PRICE} VNĐ</span></div>
                                                    <c:if test="${not empty requestScope.RESERVATION_EXIST}">
                                                        <div class="alert alert-danger my-3" role="alert">
                                                            ${requestScope.RESERVATION_EXIST}
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${not empty requestScope.SERVICE_BUSY}">
                                                        <div class="alert alert-danger my-3" role="alert">
                                                            ${requestScope.SERVICE_BUSY}
                                                        </div>
                                                    </c:if>
                                                    </div>                      

                                                    <form action="DispatchServlet" method="post">
                                                        <div class="text-center">
                                                            <button type="submit" name="btAction" value="VerifyCheckout" class="btn btn-success col-4">Thanh toán</button>
                                                        </div>
                                                    </form>

                                                    </div>
                                                </c:when>
                                                <c:otherwise>

                                                </c:otherwise>
                                            </c:choose>

                                            </main>

                                            <jsp:include page="footer.jsp"/>
                                            </body>
                                            </html>
