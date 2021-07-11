<%-- 
    Document   : updatePatientProfile
    Created on : May 30, 2021, 10:58:55 AM
    Author     : nguye
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật hồ sơ bệnh nhân</title>

        <link rel="stylesheet" href="./css/homepage.css" />
        <link rel="stylesheet" href="./css/patientProfile.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-latest.js"></script>
        <script>
            $(function () {S
                //Năm tự động điền vào select
                var seYear = $('#year');
                var date = new Date();
                var cur = date.getFullYear();

                seYear.append('<option value="" disabled>-- Năm --</option>');
                for (i = cur; i >= cur - 18; i--) {
                    seYear.append('<option value="' + i + '">Năm ' + i + '</option>');
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

                seMonth.append('<option value="" disabled>-- Tháng --</option>');
                for (i = 12; i > 0; i--) {
                    seMonth.append('<option value="' + i + '">' + month[i] + '</option>');
                }
                ;
                var seDay = $('#day');
                var date = new Date();

                seDay.append('<option value="" disabled>-- Ngày --</option>');
                for (i = 31; i > 0; i--) {
                    seDay.append('<option value="' + i + '">Ngày ' + i + '</option>');
                }
                ;

                //Ngày tự động điền vào select
//                function dayList(month, year) {
//                    var day = new Date(year, month, 0);
//                    return day.getDate();
//                }
//
//                $('#year, #month').change(function () {
//                    //Đoạn code lấy id không viết bằng jQuery để phù hợp với đoạn code bên dưới
//                    var y = document.getElementById('year');
//                    var m = document.getElementById('month');
//                    var d = document.getElementById('day');
//
//                    var year = y.options[y.selectedIndex].value;
//                    var month = m.options[m.selectedIndex].value;
//                    var day = d.options[d.selectedIndex].value;
//                    if (day == ' ') {
//                        var days = (year == ' ' || month == ' ') ? 31 : dayList(month, year);
//                        d.options.length = 0;
//                        d.options[d.options.length] = new Option('-- Ngày --', ' ');
//                        for (var i = 1; i <= days; i++)
//                            d.options[d.options.length] = new Option(i, i);
//                    }
//                });
            });
        </script>

        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main style="padding: 5%">
            <div class="row">

                <div class="col-md-12 col-lg-3">
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link btn-outline-success btn-lg" id="v-pills-viewPatient-tab" href="ho-so-benh-nhan" role="tab" aria-controls="v-pills-home" aria-selected="true">Danh sách hồ sơ bệnh nhân</a>

                        <br>
                        <a class="nav-link active" id="v-pills-updatePatient-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Hồ sơ bệnh nhân</a>
                    </div>
                </div>
                <div class="col-md-12 col-lg-9">
                    <br><br><br>
                    <h3>CẬP NHẬT HỒ SƠ BỆNH NHÂN </h3>

                    <div class="tab-pane fade show active" id="v-pills-updatePatient" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                        <form action="DispatchServlet" method="POST" name="f1">
                            <div class="form-group row">
                                <label for="inputName" class="col-sm-2 col-form-label">Họ tên bệnh nhân: </label>
                                <div class="col-sm-6">
                                    <input type="text" name="txtID" value="${patient.patientID}" hidden>
                                    <input type="text" class="form-control" name="txtName" value="${patient.patientName}" required> 
                                </div>

                            </div>

                            <fieldset class="form-group">
                                <div class="row">
                                    <legend class="col-form-label col-sm-2 pt-0">Giới tính:</legend>
                                    <div class="col-sm-6">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="txtGender" id="gridRadios1" value="0" <c:if test="${patient.gender eq 'male'}" > checked </c:if>>
                                                <label class="form-check-label" for="gridRadios1">
                                                    Nam
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="txtGender" id="gridRadios2" value="1"<c:if test="${patient.gender eq 'female'}" > checked </c:if>>
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
                                        <div class="row">
                                            <div class="col">
                                                <select name="txtYear" id="year" class="form-control" size="1"  required>
                                                    <option value="${patientYear}" selected hidden>Năm ${patientYear}</option>
                                            </select>
                                        </div>  
                                        <div class="col">
                                            <select name="txtMonth" id="month" class="form-control" size="1" required>
                                                <option value="${patientMonth}" selected hidden>Tháng ${patientMonth}</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <select name="txtDay" id="day" class="form-control" size="1" required">
                                                <option value="${patientDay}" selected hidden>Ngày ${patientDay}</option>
                                            </select>
                                        </div>

                                    </div>
                                    <c:if test="${not empty requestScope.INVALID.birthdayError}">
                                        <div class="alert alert-danger" role="alert">
                                            ${requestScope.INVALID.birthdayError}
                                        </div>
                                    </c:if>         
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-10 offset-md-2">
                                    <button type="submit" class="btn btn-primary" name="btAction" value="UpdatePatientProfile">Đăng ký</button>
                                    <button type="reset" class="btn btn-secondary" >Đặt lại</button>

                                </div>
                            </div>
                        </form>
                    </div>


                </div>
            </div>

            <script>
                function confirmation() {
                    var r = confirm("Are you sure you want to delete this?");
                    return r;
                }
            </script>
        </main>
        <jsp:include page="footer.jsp"/>       
        <a href="#" class="back-to-top"><i class="fas fa-arrow-up"></i></a>

        <!-- <script
          src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
          integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
          crossorigin="anonymous"
        ></script> -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>
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
