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
        <jsp:include page="header.jsp"/>
        
        <main>
            <jsp:useBean id="service" class="web.models.tblService.ServiceDAO" scope="page"/>
            <jsp:useBean id="listTime" class="web.models.tblOpenTime.OpenTimeDAO"/>
            <c:set var="customerDTO" value="${requestScope.VIEW_MODEL.customerDTO}"/>
            <c:set var="patientList" value="${requestScope.VIEW_MODEL.listPatient}"/>
            <c:set var="identityDTO" value="${requestScope.VIEW_MODEL.identityDTO}"/>
            <c:set var="updateItemDTO" value="${requestScope.UPDATE_RESERVATION}"/>

            <div class="reservation-wrapper px-5 py-5">
                <h2>Đặt chỗ khám bệnh</h2>
                <div class="form-row col-12 reservation-top pb-4">
                    <div class="col-4">
                        <h4>Hồ sơ bệnh nhân</h4>
                        <div class="list-group patientProfile" id="list-tab" role="tablist">
                            <c:forEach items="${patientList}" var="patientDTO">
                                <c:if test="${patientDTO.patientID == updateItemDTO.patientId}">
                                    <button class="card list-group-item list-group-item-action active" id="${patientDTO.patientID}" data-toggle="list" href="#" role="tab">
                                        <div class="card-body">
                                            <h5 class="card-title"><strong>${patientDTO.patientName}</strong></h5>
                                            <div class="patientId" hidden>${patientDTO.patientID}</div>
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
                                </c:if>                         
                            </c:forEach>
                        </div>
                    </div>

                    <div class="col-8 px-4">
                        <div class="row my-5">
                            <div class="form-group col-8">
                                <label for="service-specialty">Dịch vụ</label>
                                <select id="service-specialty" class="form-control" name="cboSpecialty">
                                    <c:forEach items="${service.listService}" var="dto">
                                        <c:choose>
                                            <c:when test="${dto.serviceId == updateItemDTO.serviceId}">
                                                <option value="${dto.serviceId}" selected="">${dto.serviceName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${dto.serviceId}">${dto.serviceName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>                
                                </select>
                            </div>
                            <div class="form-group col-3">
                                <label for="reservation-time">Chọn thời gian</label>
                                <select id="reservation-time" class="form-control" name="cboTime">
                                    <c:forEach items="${listTime.viewTimeList()}" var="timeDTO">
                                        <c:choose>
                                            <c:when test="${timeDTO.openTimeId == updateItemDTO.timeIntervalId}">
                                                <option value="${timeDTO.openTimeId}" selected="">${timeDTO.openTime}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${timeDTO.openTimeId}">${timeDTO.openTime}</option>
                                            </c:otherwise>
                                        </c:choose>                         
                                    </c:forEach>                
                                </select>
                            </div>
                        </div>
                        <div hidden id="checkInTime">${updateItemDTO.checkInTime}</div>
                        <div id="myCalendarWrapper" class="py-3"></div>
                    </div>
                </div>

                <div class="reservation-bottom py-4 col-12">
                    <h3>Thông tin khách hàng</h3>
                    <form class="col-md-6" action="UpdateReservationServlet" method="post" id="reservationForm">
                        <input hidden name="txtCustomerId" value="${customerDTO.customerID}"/>
                        <input id="txtPatientId" hidden name="txtPatientId" value="${updateItemDTO.patientId}"/>
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
                            <button type="button" onclick="submitUpdate()" class="btn btn-primary col-md-4">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>


        <script>
            function submitUpdate() {
                var serviceId = $("#service-specialty option:selected").val();
                var timeId = $("#reservation-time option:selected").val();
                var date = myCalender.value.toLocaleDateString();
                $("#txtServiceId").val(serviceId);
                $("#txtTimeId").val(timeId);
                $("#txtDate").val(date);
                $("#reservationForm").submit();
            }
        </script>
        <script src="js/CalendarPicker.js"></script>
        <script src="js/updateReservation.js"></script>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
