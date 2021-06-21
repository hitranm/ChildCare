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
        <link rel="stylesheet" href="css/lobibox.css">
        <link rel="stylesheet" href="css/reservation/reservation.css" >  

        <style>
            main {
                min-height: 70vh;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <script src="js/lobibox.js"></script>
        <script src="js/notifications.js"></script>

        <script>
            $(document).ready(function () {
                $("#customerName").prop("disabled", false);
                $("#customerEmail").prop("disabled", false);
                $("#phoneNum").prop("disabled", false);
            });
        </script>
        <c:if test="${not empty requestScope.DUPLICATE_PATIENT}">
            <script>
                Lobibox.alert('error', {
                    msg: "Đơn đặt khám của bệnh nhân này đang chờ được thanh toán.",
                    icons: {
                        fontAwesome: {
                            error: 'fa fa-times-circle'
                        }
                    },
                    icon: true,
                    iconSource: 'fontAwesome',
                    width: 600,
                    title: "Đã có lỗi xảy ra"
                });
            </script>
        </c:if>
        <c:if test="${not empty requestScope.MAX_RESERVATION}">
            <script>
                Lobibox.alert('error', {
                    msg: "Bạn chỉ có thể đặt tối đa 3 đơn trong 1 lần thanh toán.",
                    icons: {
                        fontAwesome: {
                            error: 'fa fa-times-circle'
                        }
                    },
                    icon: true,
                    iconSource: 'fontAwesome'
                });
            </script>
        </c:if>
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
                                    <div class="alert alert-danger my-3" id="patientError" role="alert" hidden>
                                        Chưa chọn hồ sơ bệnh nhân
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <h3>Chưa có hồ sơ bệnh nhân</h3>
                            </c:otherwise>
                        </c:choose>
                        <c:url var="addUrl" value="ViewPatientProfileServlet"> 
                            <c:param name="action" value="add"/>
                        </c:url>
                        <a href="${addUrl}" class="text-center my-3 addPatientLink">Thêm mới hồ sơ</a>  
                    </div>
                    
                    <div class="col-8 px-4">
                        <div class="row">
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
