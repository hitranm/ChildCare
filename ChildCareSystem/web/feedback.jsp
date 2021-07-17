<%-- 
    Document   : feedback
    Created on : Jun 26, 2021, 7:54:35 AM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phản hồi</title>
        <link rel="stylesheet" href="css/feedback/feedback.css">
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
                                ></span><br>
                            <small class="text-danger" hidden id="rate-error">Bạn chưa chọn số điểm đánh giá</small>
                            <textarea
                                class="form-control mt-3"
                                rows="5"
                                id="comment"
                                placeholder="Nhập đánh giá của bạn"
                                maxlength="200"
                                ></textarea>
                            <small class="text-danger" hidden id="comment-error">Bạn chưa nhập đánh giá</small>
                        </div>


                        <form action="FeedbackServlet" class="my-4" id="feedbackForm" method="post">
                            <input hidden name="txtrReservationId" value="${reservationDTO.reservationId}"/>
                            <input hidden name="txtCustomerId" value="${customerDTO.customerID}"/>
                            <input hidden name="txtServiceId" value="${serviceDTO.serviceId}"/>
                            <input hidden name="txtStar" value="" id="txtStar"/>
                            <input hidden name="txtComment" value="" id="txtComment"/>
                            <input hidden name="action" value="" id="action"/>
                            <div class="text-center">
                                <c:choose>
                                    <c:when test="${not empty requestScope.PREVIOUS_FEEDBACK}">
                                        <input hidden name="txtFeedbackId" value="${requestScope.PREVIOUS_FEEDBACK.feedbackId}"/>
                                        <button type="button" name="action" value="UpdateFeedback" class="btn btn-primary" id="updateButton">Cập nhật phản hồi</button>
                                        <button type="button" name="action" value="DeleteFeedback" class="btn btn-danger" id="deleteButton">Xóa phản hồi</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button type="button" name="action" value="SendFeedback" class="btn btn-primary" id="submitButton">Gửi phản hồi</button>
                                    </c:otherwise>
                                </c:choose>
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
        <!-- If there is previous feedback -->
        <c:if test="${not empty requestScope.PREVIOUS_FEEDBACK}">
            <script>
                                    document.getElementById("comment").innerHTML = "${requestScope.PREVIOUS_FEEDBACK.comment}";
                                    count = ${requestScope.PREVIOUS_FEEDBACK.rate};
                                    for (var i = 0; i < 5; i++) {
                                        if (i < count) {
                                            document.getElementById(i + 1 + "one").style.color = "#fed330";
                                        } else {
                                            document.getElementById(i + 1 + "one").style.color = "black";
                                        }
                                    }
            </script>
        </c:if>
    </body>
</html>
