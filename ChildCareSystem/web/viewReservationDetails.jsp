<%-- 
    Document   : viewReservationDetails
    Created on : Jun 24, 2021, 11:12:59 PM
    Author     : Admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <title>Đơn khám</title>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            
            .wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 3rem 0 6rem 0;
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
        <main> 
            <div class="loader">
                <img src="images/loading.gif" alt="Loading..." />
            </div>
            <c:set var="resDetail" value="${requestScope.RES_DETAIL}"/>
            <div class="wrapper px-5">
                <h2>Thông tin đơn khám</h2>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="customerName">Họ tên phụ huynh</label>
                        <input id="customerName" type="text" name="cusID" class="form-control" value="${resDetail.customerDTO.fullName}" readonly>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="customerName">Ngày khám</label>
                        <input id="customerName" type="text" name="cusID" class="form-control" value="${resDetail.reservationDTO.checkInDate}" readonly>
                    </div>
                </div>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Họ và tên bệnh nhân</label>
                        <input type="text" name="patientname" class="form-control" value="${resDetail.patientDTO.patientName}" readonly>
                    </div>                   
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Ngày sinh</label>
                        <input type="text" name="address" class="form-control" value="${resDetail.patientDTO.birthday}" readonly>
                    </div>
                </div>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Tên dịch vụ</label>
                        <input type="text" name="birthday" class="form-control" value="${resDetail.serviceDTO.serviceName}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Giá</label>
                        <input type="text" name="citizenID" class="form-control" value="${resDetail.reservationDTO.price}00" readonly>
                    </div>
                </div>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Bác sĩ phụ trách</label> 
                        <input type="text" name="phoneNum" class="form-control" value="${resDetail.staffDTO.fullName}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Chuyên khoa</label> 
                        <input type="text" name="specialty" class="form-control" value="${resDetail.specialtyName}" readonly>
                    </div>
                </div>


                <div class="col-8 mt-5">
                    <h4>Đơn thuốc và ghi chú</h4>
                    <c:choose>
                        <c:when test="${not empty requestScope.PRE_EXAM}">
                            <div class="input-group">
                                <textarea class="form-control" aria-label="With textarea" readonly>${requestScope.PRE_EXAM.prescription}</textarea>
                            </div>                         
                        </c:when>
                        <c:otherwise>
                            <div>Chưa có thông tin</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>        



    </body>
</html>


