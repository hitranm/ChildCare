<%-- 
    Document   : chooseServiceReserve
    Created on : Jun 17, 2021, 3:50:01 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose service</title>
        <link rel="stylesheet" href="css/CalendarPicker.style.css">
        <link rel="stylesheet" href="css/reservation/reservation.css" >  
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }
            main {
                min-height: 70vh;
            }
        </style>
    </head>
    
    <body>
        <jsp:include page="header.jsp"/>
        <!-- Authorize -->
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'customer'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <!-- -->


        <c:if test="${not empty requestScope.DUPLICATE_PATIENT}">
            <script>
                $(document).ready(function () {
                    $("#duplicateModal").modal("show");
                });
            </script>
        </c:if>
        <c:if test="${not empty requestScope.MAX_RESERVATION}">
            <script>
                $(document).ready(function () {
                    $("#maxModal").modal("show");
                });
            </script>
        </c:if>


        <div class="modal" tabindex="-1" role="dialog" id="duplicateModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Đã có lỗi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Đơn đặt khám của bệnh nhân này đang chờ được thanh toán.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal" tabindex="-1" role="dialog" id="maxModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Đã có lỗi</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Bạn chỉ có thể đặt tối đa 3 đơn trong 1 lần thanh toán.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

        <main>
            <jsp:useBean id="service" class="web.models.tblService.ServiceDAO" scope="page"/>
            <jsp:useBean id="listTime" class="web.models.tblOpenTime.OpenTimeDAO"/>
            <c:set var="customerDTO" value="${requestScope.VIEW_MODEL.customerDTO}"/>
            <c:set var="patientList" value="${requestScope.VIEW_MODEL.listPatient}"/>
            <c:set var="identityDTO" value="${requestScope.VIEW_MODEL.identityDTO}"/>

            <div class="reservation-wrapper px-5 py-5">
                <h2 class="mb-4">Đặt chỗ khám bệnh</h2>
                <div class="form-row col-12 reservation-top pb-4">
                    <div class="col-4 left-section">
                        <h4>Hồ sơ bệnh nhân</h4>
                        <c:choose>
                            <c:when test="${not empty patientList}">
                                <div class="list-group patientProfile" id="list-tab" role="tablist">
                                    <c:forEach items="${patientList}" var="patientDTO">
                                        <a class="card list-group-item list-group-item-action" id="${patientDTO.patientID}" data-toggle="list" href="#" role="tab">
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
                                        </a>                                           
                                    </c:forEach>
                                    <c:url var="addUrl" value="ViewPatientProfileServlet"> 
                                        <c:param name="tab" value="add"/>
                                    </c:url>
                                    <a href="${addUrl}" class="text-center my-3 addPatientLink">Thêm mới hồ sơ</a>
                                    <div class="alert alert-danger my-3" id="patientError" role="alert" hidden>
                                        Chưa chọn hồ sơ bệnh nhân
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="mb-5">
                                    <h5 style="margin-top: 40%">Chưa có hồ sơ bệnh nhân</h5>
                                    <small>(Bạn cần hồ sơ bệnh nhân để đặt dịch vụ)</small>
                                </div>

                                <c:url var="addUrl" value="ViewPatientProfileServlet"> 
                                    <c:param name="tab" value="add"/>
                                </c:url>
                                <a href="${addUrl}" class="text-center my-3 addPatientLink">Thêm mới hồ sơ</a>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="col-8 px-4">
                        <div class="row mb-5">
                            <div class="form-group col-8">
                                <label for="service-specialty">Dịch vụ</label>
                                <select id="service-specialty" class="form-control" name="cboSpecialty">
                                    <c:forEach items="${service.listService}" var="dto">
                                        <c:choose>
                                            <c:when test="${param.serviceId eq dto.serviceId}">
                                                <option selected value="${dto.serviceId}">${dto.serviceName}</option>
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
                                        <option value="${timeDTO.openTimeId}">${timeDTO.openTime}</option>
                                    </c:forEach>                
                                </select>
                            </div>
                        </div>
                        <div id="myCalendarWrapper" class="py-3 mt-5 jsCalendar blue"></div>
                    </div>
                </div>

                <div class="reservation-bottom py-4 col-12">
                    <h3>Thông tin khách hàng</h3>
                    <form class="col-md-6" action="AddServiceToCartServlet" method="post" id="reservationForm">
                        <input hidden name="txtCustomerId" value="${customerDTO.customerID}"/>
                        <input id="txtPatientId" hidden name="txtPatientId" value=""/>
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
                            <button type="button" onclick="submitReservation()" class="btn btn-primary col-md-4">Tiếp tục</button>
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
