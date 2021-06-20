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
        <title>Service carts</title>
        <link rel="stylesheet" href="css/service/serviceCart.css">
    </head>
    <body>
        <style>
            main {
                min-height: 70vh;
            }
        </style>


        <jsp:include page="header.jsp"/>
        <main>
            <c:choose>
                <c:when test="${not empty sessionScope.CART_VIEW_MODEL}">         
                    <div class="wrapper my-5">
                        <h2 class="text-center my-5">Vui lòng kiểm tra lại thông tin trước khi thanh toán</h2>
                        <div class="service-card-wrapper my-5">
                            <c:forEach var="reservation" items="${sessionScope.CART_VIEW_MODEL}">
                                <div class="card col-8 my-3">
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
                                                        <td>${reservation.serviceDTO.price}</td>
                                                        <td>
                                                            <c:url var="urlUpdate" value="LoadUpdateReservationServlet">
                                                                <c:param name="txtPatientId" value="${reservation.patientDTO.patientID}"/>
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
                        </div>
                        <div class="text-center">
                            <button type="button" class="btn btn-success col-4">Thanh toán</button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>

                </c:otherwise>
            </c:choose>

        </main>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
