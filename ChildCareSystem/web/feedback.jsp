<%-- 
    Document   : feedback
    Created on : Jun 26, 2021, 7:54:35 AM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <link rel="stylesheet" href="css/feedback/feedback.css">
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <c:choose>
                <c:when test="${not empty requestScope.FEEDBACK_VIEW_MODEL}">
                    <c:set var="patientDTO" value="${requestScope.FEEDBACK_VIEW_MODEL.patientDTO}"/>
                    <c:set var="serviceDTO" value="${requestScope.FEEDBACK_VIEW_MODEL.serviceDTO}"/>
                    <c:set var="reservationDTO" value="${requestScope.FEEDBACK_VIEW_MODEL.reservationDTO}"/>
                    <c:set var="customerDTO" value="${requestScope.FEEDBACK_VIEW_MODEL.customerDTO}"/>

                    <div class="feedback-wrapper container mt-5 px-5">
                        <h2 class="text-center">Góp ý về dịch vụ</h2>
                        <div class="info-section mt-5 mb-4 col-12">
                            <div>Dịch vụ: <span>${serviceDTO.serviceName}</span></div>
                            <div>Bệnh nhân: <span>${patientDTO.patientName}</span></div>
                            <div>Thời gian: <span>${reservationDTO.checkInDate}</span></div>
                        </div>
                        <div class="rating-section mt-5 col-12">
                            <div class="rating-title mb-4">Đánh giá của bạn <span>(* Đánh giá sẽ được mở sau 24h kể từ khi khám bệnh)</span></div>
                            <span
                                onmouseover="starmark(this)"
                                onclick="starmark(this)"
                                id="1one"
                                style="font-size: 25px; cursor: pointer"
                                class="fa fa-star checked"
                                ></span>
                            <span
                                onmouseover="starmark(this)"
                                onclick="starmark(this)"
                                id="2one"
                                style="font-size: 25px; cursor: pointer"
                                class="fa fa-star"
                                ></span>
                            <span
                                onmouseover="starmark(this)"
                                onclick="starmark(this)"
                                id="3one"
                                style="font-size: 25px; cursor: pointer"
                                class="fa fa-star"
                                ></span>
                            <span
                                onmouseover="starmark(this)"
                                onclick="starmark(this)"
                                id="4one"
                                style="font-size: 25px; cursor: pointer"
                                class="fa fa-star"
                                ></span>
                            <span
                                onmouseover="starmark(this)"
                                onclick="starmark(this)"
                                id="5one"
                                style="font-size: 25px; cursor: pointer"
                                class="fa fa-star"
                                ></span>
                            <textarea
                                class="form-control mt-3"
                                rows="5"
                                id="comment"
                                placeholder="Nhập đánh giá của bạn"
                                maxlength="200"
                                ></textarea>
                        </div>

                        <form action="FeedbackServlet" class="my-4" id="feedbackForm">
                            <input hidden name="txtrReservationId" value="${reservationDTO.reservationId}"/>
                            <input hidden name="txtCustomerId" value="${customerDTO.customerID}"/>
                            <input hidden name="txtServiceId" value="${serviceDTO.serviceId}"/>
                            <input hidden name="txtStar" value="" id="txtStar"/>
                            <input hidden name="txtComment" value="" id="txtComment"/>
                            <input hidden name="action" value="" id="action"/>
                            <div class="text-center">
                                <button type="button" name="action" value="SendFeedback" class="btn btn-primary" id="submitButton">Gửi phản hồi</button>
                                <button type="button" name="action" value="DeleteFeedback" class="btn btn-danger">Xóa phản hồi</button>
                            </div>
                        </form>
                    </div>
                </c:when>

                <c:otherwise>
                    <h2>Bạn cần chọn dịch vụ đã đặt để gửi phản hồi.</h2>
                </c:otherwise>
            </c:choose>
        </main>


        <jsp:include page="footer.jsp"/>
        <script src="js/feedback.js"></script>
    </body>
</html>
