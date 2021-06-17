<%-- 
    Document   : chooseServiceReserve
    Created on : Jun 17, 2021, 3:50:01 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose service</title>
        <link rel="stylesheet" href="css/CalendarPicker.style.css">
        <link rel="stylesheet" href="css/reservation/reservation.css" >    
    </head>
    <body>
        <style>
            main {
                min-height: 70vh;
            }
        </style>
        <jsp:include page="header.jsp"/>
        <main>
            <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="page"/>
            <jsp:useBean id="listTime" class="web.models.tblOpenTime.OpenTimeDAO"/>
            <c:set var="customerDTO" value="${requestScope.VIEW_MODEL.customerDTO}"/>
            <c:set var="patientList" value="${requestScope.VIEW_MODEL.listPatient}"/>
            <c:set var="identityDTO" value="${requestScope.VIEW_MODEL.identityDTO}"/>

            <div class="reservation-wrapper px-5 py-5">
                <h2>Đặt chỗ khám bệnh</h2>
                <div class="form-row col-12 reservation-top pb-4">
                    <div class="col-4">
                        <h4>Hồ sơ bệnh nhân</h4>
                        <c:choose>
                            <c:when test="${not empty patientList}">
                                <div class="list-group patientProfile" id="list-tab" role="tablist">
                                    <c:forEach items="${patientList}" var="patientDTO">
                                        <div class="card list-group-item list-group-item-action" id="${patientDTO.patientID}" data-toggle="list" href="#" role="tab">
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
                                        </div>
                                    </c:forEach>
                                    <div class="alert alert-danger my-3" id="patientError" role="alert" hidden>
                                        Chưa chọn hồ sơ bệnh nhân
                                    </div>
                                </div>

                            </c:when>
                            <c:when test="${not empty sessionScope.IDENTITY_ID && empty patientList}">
                                <h3>Chưa có hồ sơ bệnh nhân</h3>
                            </c:when>
                            <c:otherwise>
                                <script>
                                    $(document).ready(function () {
                                        $("#customerName").prop("disabled", false);
                                        $("#customerEmail").prop("disabled", false);
                                        $("#phoneNum").prop("disabled", false);
                                    });
                                </script>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-8 px-4">
                        <div class="row">
                            <div class="form-group col-8">
                                <label for="service-specialty">Chuyên khoa</label>
                                <select id="service-specialty" class="form-control" name="cboSpecialty">
                                    <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                                        <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                                    </c:forEach>                
                                </select>
                            </div>
                            <div class="form-group col-3">
                                <label for="service-specialty">Chọn thời gian</label>
                                <select id="service-specialty" class="form-control" name="cboSpecialty">
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
                    <form class="col-md-6">
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
                            <button type="button" onclick="submitReservation()" class="btn btn-primary col-md-3">Tiếp tục</button>
                        </div>

                    </form>
                </div>

            </div>
        </main>


<!--        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>-->
        <script src="js/CalendarPicker.js"></script>
        <script src="js/reservation.js"></script>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
