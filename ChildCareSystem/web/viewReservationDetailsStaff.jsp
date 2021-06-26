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
        <title>Child Care System</title>
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
            integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
            crossorigin="anonymous"
            />
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./css/homepage.css" />
        <link rel="stylesheet" href="css/footer.css"/>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main> 
            <c:set var="resDetail" value="${requestScope.RES_DETAIL}"/>
<style>
            .wrapper {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 4rem 0 6rem 0;
               
            }

            .wrapper form {
                width: 30%;
               
            }

            .wrapper h1 {
                margin-bottom: 20px;
            }
        </style>
        <div class="wrapper px-5">
            <h1>Thông tin đơn khám</h1>

            
                <div class="form-row">
                <label for="fullNanme">Họ tên phụ huynh</label>
                <input type="text" name="cusID" class="form-control" value="${resDetail.customerDTO.fullName}" readonly>
                </div>
                <div class="form-row">
                     <label for="fullNanme">Họ và tên bệnh nhân</label>
                <input type="text" name="patientname" class="form-control" value="${resDetail.patientDTO.patientName}" readonly>
                </div>
                <div class="form-row">
                    <label for="fullNanme">Ngày sinh</label>
                <input type="text" name="address" class="form-control" value="${resDetail.patientDTO.birthday}" readonly>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Tên dịch vụ</label>
                <input type="text" name="birthday" class="form-control" value="${resDetail.serviceDTO.serviceName}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Giá</label>
                <input type="text" name="citizenID" class="form-control" value="${resDetail.serviceDTO.price}" readonly>
                    </div>
                </div>
                    <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Họ tên nhân viên phụ trách</label> 
                <input type="text" name="phoneNum" class="form-control" value="${resDetail.staffDTO.fullName}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Chuyên khoa</label> 
                <input type="text" name="lmao" class="form-control" value="${resDetail.specialtyName}" readonly>
                    </div>
                    </div>
                    
                        </div>
                    <div class="text-center">
                    <button type="submit" class="btn btn-primary" name="btAction" value="">Add medical examination</button>
               </div>
                    
               
           
        

           
        </main>
</div>
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
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script>
            src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity = "sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin = "anonymous"
        </script>
        <script>
            $("#navbarDropdown").click(function () {
                $('.dropdown-toggle').dropdown();
            })

        </script>

    </body>
</html>


 

