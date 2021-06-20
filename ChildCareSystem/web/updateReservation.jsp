<%-- 
    Document   : updateReservation
    Created on : Jun 20, 2021, 7:23:13 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link rel="stylesheet" href="css/CalendarPicker.style.css">
        <link rel="stylesheet" href="css/reservation/reservation.css" >  
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:include page="header.jsp"/>
        <main>
            <jsp:useBean id="service" class="web.models.tblService.ServiceDAO" scope="page"/>
            <jsp:useBean id="listTime" class="web.models.tblOpenTime.OpenTimeDAO"/>
            <c:set var="customerDTO" value="${requestScope.VIEW_MODEL.customerDTO}"/>
            <c:set var="patientList" value="${requestScope.VIEW_MODEL.listPatient}"/>
            <c:set var="identityDTO" value="${requestScope.VIEW_MODEL.identityDTO}"/>

            <div class="reservation-wrapper px-5 py-5">
                <h2>Đặt chỗ khám bệnh</h2>
                <div class="form-row col-12 reservation-top pb-4">
                    <div class="col-4">
                        <h4>Hồ sơ bệnh nhân</h4>
                        <c:set var="patientId" value="${requestScope.PATIENT_ID}"/>
                        <div class="list-group patientProfile" id="list-tab" role="tablist">
                            <c:forEach items="${patientList}" var="patientDTO">
                                <c:choose>
                                    <c:when test="${patientDTO.patientID == patientId}">
                                        <button class="card list-group-item list-group-item-action active" id="${patientDTO.patientID}" data-toggle="list" href="#" role="tab">
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>${patientDTO.patientName}</strong></h5>
                                                <div class="patientId" hidden>${patientDTO.patientID}</div>
                                                <input type="hidden" value="${patientDTO.patientID}" name="txtPatientId"/>
                                                <p class="card-text">
                                                    <strong>Giới tính:</strong> 
                                                    <c:choose>
                                                        <c:when test="${patientDTO.gender.equals('male')}">
                                                            Nam
                                                        </c:when>
                                                        <c:otherwise>
                                                            Nữ
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p class="card-text">
                                                    <strong>Ngày sinh:</strong> ${patientDTO.birthday}
                                                </p>
                                            </div>
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="card list-group-item list-group-item-action" disabled id="${patientDTO.patientID}" data-toggle="list" href="#" role="tab">
                                            <div class="card-body">
                                                <h5 class="card-title"><strong>${patientDTO.patientName}</strong></h5>
                                                <div class="patientId" hidden>${patientDTO.patientID}</div>
                                                <input type="hidden" value="${patientDTO.patientID}" name="txtPatientId"/>
                                                <p class="card-text">
                                                    <strong>Giới tính:</strong> 
                                                    <c:choose>
                                                        <c:when test="${patientDTO.gender.equals('male')}">
                                                            Nam
                                                        </c:when>
                                                        <c:otherwise>
                                                            Nữ
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                                <p class="card-text">
                                                    <strong>Ngày sinh:</strong> ${patientDTO.birthday}
                                                </p>
                                            </div>
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                        
                    <div class="col-8 px-4">
                        <div class="row my-5">
                            <div class="form-group col-8">
                                <label for="service-specialty">Dịch vụ</label>
                                <select id="service-specialty" class="form-control" name="cboSpecialty">
                                    <c:forEach items="${service.viewServiceList()}" var="dto">
                                        <option value="${dto.serviceId}">${dto.serviceName}</option>
                                    </c:forEach>                
                                </select>
                            </div>
                            <div class="form-group col-3">
                                <label for="reservation-time">Chọn thời gian</label>
                                <select id="reservation-time" class="form-control" name="cboTime">
                                    <c:forEach items="${listTime.viewTimeList()}" var="timeDTO">
                                        <option value="${timeDTO.openTimeId}">${timeDTO.openTime}</option>
                                    </c:forEach>                
                                </select>
                            </div>
                        </div>
                        <div id="myCalendarWrapper" class="py-3"></div>
                    </div>
                </div>

                <div class="reservation-bottom py-4 col-12">
                    <h3>Thông tin khách hàng</h3>
                    <div hidden id="customerId">${customerDTO.customerID}</div>
                    <form class="col-md-6" action="AddServiceToCartServlet" method="post" id="reservationForm">
                        <input hidden name="txtCustomerId" value="${customerDTO.customerID}"/>
                        <input id="txtPatientId" hidden name="txtPatientId" value="${patientId}"/>
                        <input id="txtServiceId" hidden name="txtServiceId" value=""/>
                        <input id="txtTimeId" hidden name="txtTimeId" value=""/>
                        <input id="txtDate" hidden name="txtDate" value=""/>

                        <div class="form-group col-12">
                            <label for="customerName">Tên</label>
                            <input type="text" class="form-control" id="customerName" name="customerName" value="${customerDTO.fullName}" disabled>
                        </div>
                        <div class="form-group col-12">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="customerEmail" name="customerEmail" value="${identityDTO.email}" disabled>
                        </div>                  
                        <div class="form-group col-12">
                            <label for="phoneNum">Số điện thoại</label>
                            <input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${customerDTO.phoneNumber}" disabled>
                        </div>
                        <div class="text-center">
                            <button type="button" onclick="submitReservation()" class="btn btn-primary col-md-4">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>

        <script src="js/CalendarPicker.js"></script>
        <script src="js/reservation.js"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
