<%--
    Document   : viewPatientProfile
    Created on : May 30, 2021, 10:58:55 AM
    Author     : nguye
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Profile Page</title>
        <link rel="stylesheet" href="./css/patientProfile.css"/>

        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(function () {
                //Năm tự động điền vào select
                var seYear = $('#year');
                var date = new Date();
                var cur = date.getFullYear();

                seYear.append('<option value="">-- Năm --</option>');
                for (i = cur; i >= cur - 18; i--) {
                    seYear.append('<option value="' + i + '">' + i + '</option>');
                }
                ;

                //Tháng tự động điền vào select
                var seMonth = $('#month');
                var date = new Date();

                var month = new Array();
                month[1] = "Tháng 1";
                month[2] = "Tháng 2";
                month[3] = "Tháng 3";
                month[4] = "Tháng 4";
                month[5] = "Tháng 5";
                month[6] = "Tháng 6";
                month[7] = "Tháng 7";
                month[8] = "Tháng 8";
                month[9] = "Tháng 9";
                month[10] = "Tháng 10";
                month[11] = "Tháng 11";
                month[12] = "Tháng 12";

                seMonth.append('<option value="">-- Tháng --</option>');
                for (i = 12; i > 0; i--) {
                    seMonth.append('<option value="' + i + '">' + month[i] + '</option>');
                }
                ;

                //Ngày tự động điền vào select
                function dayList(month, year) {
                    var day = new Date(year, month, 0);
                    return day.getDate();
                }

                $('#year, #month').change(function () {
                    //Đoạn code lấy id không viết bằng jQuery để phù hợp với đoạn code bên dưới
                    var y = document.getElementById('year');
                    var m = document.getElementById('month');
                    var d = document.getElementById('day');

                    var year = y.options[y.selectedIndex].value;
                    var month = m.options[m.selectedIndex].value;
                    var day = d.options[d.selectedIndex].value;
                    if (day == ' ') {
                        var days = (year == ' ' || month == ' ') ? 31 : dayList(month, year);
                        d.options.length = 0;
                        d.options[d.options.length] = new Option('-- Ngày --', ' ');
                        for (var i = 1; i <= days; i++)
                            d.options[d.options.length] = new Option(i, i);
                    }
                });
            });
        </script>
        <script>
            function redirect() {
                windows.location.replace("login.jsp")
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <main style="padding: 5%">
            <c:if test="${empty sessionScope.ROLE}">
                <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
                <jsp:forward page="login.jsp"/>
            </c:if>

            <c:if test="${sessionScope.ROLE eq 'customer'}">
                <div class="row">
                    <div class="col-md-12 col-lg-3">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <c:if test="${not empty requestScope.reachMaxPatient}">
                                <button type="button" class="nav-link btn-outline-success btn-lg" data-toggle="modal" data-target="#exampleModalCenter" style="border: none;text-align: left;cursor:pointer">
                                    Thêm hồ sơ bệnh nhân
                                </button>
                            </c:if>
                            <c:if test="${empty requestScope.reachMaxPatient}">
                                <a class="nav-link btn-outline-success btn-lg" id="v-pills-addPatient-tab" data-toggle="tab" href="#v-pills-addPatient" role="tab" aria-selected="true">Thêm hồ sơ bệnh nhân</a>
                            </c:if>
                            <br>
                            <a class="nav-link active" id="v-pills-profile-tab" data-toggle="tab" href="#v-pills-profile" role="tab" aria-selected="false">Hồ sơ bệnh nhân</a>
                            <a class="nav-link" id="v-pills-history-tab" data-toggle="tab" href="#v-pills-history" role="tab" aria-selected="false">Lịch sử đặt lịch khám</a>
                            <c:if test="${param.tab eq 'order'}">
                                <script>
                                    $(document).ready(function () {
                                        $("#v-pills-history-tab").tab("show");
                                    });
                                </script>
                            </c:if>
                            <c:if test="${param.tab eq 'add'}">
                                <script>
                                    $(document).ready(function () {
                                        $("#v-pills-addPatient-tab").tab("show");
                                    });
                                </script>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-9">
                        <div class="tab-content" id="v-pills-tabContent">
                            <c:if test="${not empty requestScope.reachMaxPatient}">
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLongTitle">Thông báo của hệ thống</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <h2>${requestScope.reachMaxPatient}</h2>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Create patient profile -->
                            <c:if test="${empty requestScope.reachMaxPatient}">
                                <div class="tab-pane fade" id="v-pills-addPatient">
                                    <h2 style="text-align: center; color: #c97244">THÔNG TIN ĐĂNG KÝ HỒ SƠ BỆNH NHÂN</h2>
                                    <form action="DispatchServlet" method="POST" name="f1">
                                        <div class="form-group row">
                                            <label for="inputName" class="col-sm-2 col-form-label">Họ tên bệnh nhân: </label>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="txtName"  required>
                                            </div>

                                        </div>
                                        <fieldset class="form-group">
                                            <div class="row">
                                                <legend class="col-form-label col-sm-2 pt-0">Giới tính:</legend>
                                                <div class="col-sm-6">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="txtGender" id="gridRadios1" value="0" checked>
                                                        <label class="form-check-label" for="gridRadios1">
                                                            Nam
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="radio" name="txtGender" id="gridRadios2" value="1">
                                                        <label class="form-check-label" for="gridRadios2">
                                                            Nữ
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="form-group row">
                                            <label for="inputBirthday" class="col-sm-2 col-form-label">Ngày sinh: </label>
                                            <div class="col-sm-6">
                                                <!--<input type="date" class="form-control" name="txtBirthday" id="txtBirthday" value="${param.txtBirthday}" max="2022-01-01" required>-->
                                                <div class="row">
                                                    <div class="col">
                                                        <select name="txtYear" id="year" class="form-control" size="1" required></select>
                                                    </div>
                                                    <div class="col">
                                                        <select name="txtMonth" id="month" class="form-control" size="1" required></select>
                                                    </div>
                                                    <div class="col">
                                                        <select name="txtDay" id="day" class="form-control" size="1" required>
                                                            <option value=" " selected="selected">-- Ngày --</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-10 offset-md-2">
                                                <button type="submit" class="btn btn-primary" name="btAction" value="AddNewPatientProfile">Đăng ký</button>
                                                <button type="reset" class="btn btn-secondary" >Đặt lại</button>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </c:if>
                            <!--------------------------------------------------------------------------------------------------------------------------->

                            <!-- PATIENT PROFILE LIST -->
                            <div class="tab-pane fade active show" id="v-pills-profile">
                                <h2 style="text-align: center; color: #1977cc">DANH SÁCH HỒ SƠ BỆNH NHÂN</h2>
                                <div class="row">
                                    <c:if test="${requestScope.listPatients!=null}">
                                        <c:if test="${not empty requestScope.listPatients}" var="testEmpty">
                                            <c:forEach items="${requestScope.listPatients}" var="dto2">
                                                <div class="col-md-6" style="margin-bottom: 3%">
                                                    <form class="col" action="LoadPatientProfileServlet" method="POST">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <h5 class="card-title"><strong>${dto2.patientName}</strong></h5>
                                                                <hr>
                                                                <p class="card-text">
                                                                    <strong>Giới tính:</strong>
                                                                    <c:choose>
                                                                        <c:when test="${dto2.gender.equals('male')}">
                                                                            Nam
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            Nữ
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </p>
                                                                <p class="card-text">
                                                                    <strong>Ngày sinh:</strong> ${dto2.birthday}
                                                                </p>
                                                                <hr>
                                                                <c:url value="LoadPatientProfileByIDServlet" var="updateLink">
                                                                    <c:param name="id" value="${dto2.patientID}"/>
                                                                </c:url>
                                                                <a class="btn btn-primary" href="${updateLink}" role="button">Chính sửa hồ sơ</a>
                                                                <c:url value="DeletePatientProfileByIDServlet" var="deleteLink">
                                                                    <c:param name="id" value="${dto2.patientID}"/>
                                                                </c:url>
                                                                <a class="btn btn-danger" onclick="return confirmation()" href="${deleteLink}" role="button">Xóa hồ sơ</a>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${!testEmpty}">
                                            <h2>Hiện Chưa Có Hồ Sơ Bệnh Nhân Nào. Vui Lòng Thêm Hồ Sơ Bệnh Nhân</h2>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>
                            <!-------------------------------------------------------------------------------->

                            <div class="tab-pane fade" id="v-pills-history">
                                <h2 style="text-align: center; color: #ffbd3f">LỊCH SỬ ĐẶT LỊCH KHÁM</h2>
                                <div class="row">
                                    <c:if test="${requestScope.historyList!=null}">
                                        <c:if test="${not empty requestScope.historyList}" var="testEmpty">
                                            <c:forEach items="${requestScope.historyList}" var="history">
                                                <div class="col-md-6" style="margin-bottom: 3%">
                                                    <form class="col" action="LoadPatientProfileServlet" method="POST">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <h5 class="card-title"><strong>${history.patientName}</strong></h5>
                                                                <hr> 
                                                                <p class="card-text">
                                                                    <strong>Dịch vụ đã chọn:</strong> ${history.serviceName}
                                                                </p>
                                                                <p class="card-text">
                                                                    <strong>Ngày hẹn khám:</strong> ${history.checkInTime}
                                                                </p>
                                                                <hr>
                                                                <c:url value="LoadFeedbackServlet" var="feedbackLink">
                                                                    <c:param name="id" value="${history.reservationID}"/>
                                                                </c:url>
                                                                <a class="btn btn-primary" href="#" role="button" onclick="feedback('${history.checkInTime}', '${history.reservationID}')">Góp ý dịch vụ</a>

                                                                <c:url value="#" var="deleteLink">
                                                                    <c:param name="id" value="${history.reservationID}"/>
                                                                </c:url>
                                                                <a class="btn btn-danger" onclick="return confirmation()" href="${deleteLink}" role="button">Hủy lịch khám</a>                                                              
                                                                <p class="card-text" style="text-align: right; font-size: smaller">
                                                                    ${history.createdDate}
                                                                </p>
                                                                <small class="text-danger" hidden id="${history.reservationID}">(* Đánh giá sẽ được mở sau khi khám bệnh)</small>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${!testEmpty}">
                                            <h2>Hiện Chưa Có Lịch Khám Nào</h2>
                                        </c:if>
                                    </c:if>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <script>
                    function confirmation() {
                        var r = confirm("Bạn có chắc muốn xóa hồ sơ bệnh nhân này không?");
                        return r;
                    }
                </script>
            </c:if>
        </main>
        <jsp:include page="footer.jsp"/>

        <!-- <script
          src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
          integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
          crossorigin="anonymous"
        ></script> -->

        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"
        ></script>
        <!--Custom JS-->
        <script src="./js/main.js"></script>
    </body>
</html>
