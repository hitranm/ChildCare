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
        <title>Child Care System</title>
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
                <h2>Th??ng tin ????n kh??m</h2>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="customerName">H??? t??n ph??? huynh</label>
                        <input id="customerName" type="text" name="cusID" class="form-control" value="${resDetail.customerDTO.fullName}" readonly>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="customerName">Ng??y kh??m</label>
                        <input id="customerName" type="text" name="cusID" class="form-control" value="${resDetail.reservationDTO.checkInDate}" readonly>
                    </div>
                </div>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">H??? v?? t??n b???nh nh??n</label>
                        <input type="text" name="patientname" class="form-control" value="${resDetail.patientDTO.patientName}" readonly>
                    </div>                   
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Ng??y sinh</label>
                        <input type="text" name="address" class="form-control" value="${resDetail.patientDTO.birthday}" readonly>
                    </div>
                </div>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">T??n d???ch v???</label>
                        <input type="text" name="birthday" class="form-control" value="${resDetail.serviceDTO.serviceName}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Gi??</label>
                        <input type="text" name="citizenID" class="form-control" value="${resDetail.serviceDTO.price}" readonly>
                    </div>
                </div>
                <div class="form-row col-8">
                    <div class="form-group col-md-6">
                        <label for="fullNanme">B??c s?? ph??? tr??ch</label> 
                        <input type="text" name="phoneNum" class="form-control" value="${resDetail.staffDTO.fullName}" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fullNanme">Chuy??n khoa</label> 
                        <input type="text" name="lmao" class="form-control" value="${resDetail.specialtyName}" readonly>
                    </div>
                </div>

                <div class="col-8 mt-5">
                    <h4>????n thu???c v?? ghi ch??</h4>
                    <form action="MedicalExaminationServlet" method="post">
                        <input name="txtReservationId" value="${resDetail.reservationDTO.reservationId}" hidden/>
                        <input name="txtServiceId" value="${resDetail.serviceDTO.serviceId}" hidden/>
                        <textarea
                            class="form-control my-3"
                            rows="5"
                            id="prescription"
                            maxlength="200"
                            name="txtPrescription"                
                            ></textarea>
                        <c:choose>
                            <c:when test="${not empty requestScope.PRE_EXAM}">
                                <script>
                                    document.getElementById("prescription").innerHTML = "${requestScope.PRE_EXAM.prescription}";
                                </script>
                                <div class="text-center">
                                    <input hidden name="txtExaminationId" value="${requestScope.PRE_EXAM.examinationId}"/>
                                    <button type="submit" name="action" value="Update" class="btn btn-primary col-4">L??u</button>
                                    <button type="submit" name="action" value="Delete" class="btn btn-danger col-4">X??a</button>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="text-center">
                                    <button type="submit" name="action" value="Add" class="btn btn-success col-4">L??u</button>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </form>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>        
        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            });
        </script>
    </body>
</html>




