<%-- 
    Document   : viewReservationForManager
    Created on : Jun 24, 2021, 8:40:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
        <link rel="stylesheet" href="../HomePage/HomePage.css">
        <link rel="stylesheet" href="./viewAllAccounts.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
        </style>
    </head>
    <body>
        <main>
            <div class="loader">
                <img src="../img/loading.gif" alt="Loading..." />
            </div>
            <div class="userPosts__container">
                <div class="userPosts__wrapper">
                    <h2 class="userPosts__title">Reservation List</h2>
                    <div class="dropdownButton__wrapper">
                        <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            DayTime
                        </button>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                 aria-orientation="vertical">
                                <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill"
                                   href="#allList" role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                   onclick="toggleButton(this)">All</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#customerList"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Morning</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#staffList"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Noon</a>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 table__wrapper bg-white">
                        <div class="tab-content" id="v-pills-tabContent">
                            <!--All List-->
                            <div class="tab-pane fade show active bg-white" id="allList" role="tabpanel"
                                 aria-labelledby="v-pills-changePassword-tab">

                                <table class="table table-striped table-bordered mydatatable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>ReservationID</th>
                                            <th>CustomerID</th>
                                            <th>StaffAssignedID</th>
                                            <th>CheckInTime</th>
                                            <th>View details</th>

                                        </tr>
                                    </thead>

                                    <tbody id="tableBodyAccepted">
                                    <c:if test="${requestScope.ListReservation!=null}">
                                        <c:set var="count" value="0"/>
                                        <c:forEach items="${requestScope.ListReservation}" var="dto" >

                                            <tr>
                                            <c:set var="count" value="${count+1}"/>
                                            <td>${count}</td>

                                            <td>${dto.reservationId}</td>
                                            <td>${dto.customerId}</td>
                                            <td>${dto.staffAssignId}</td>
                                            <td>${dto.checkInDate}</td>

                                            <td>
                                            <c:url var="viewdetails" value="DispatchServlet">
                                                <c:param name="btAction" value="ViewReservationDetailsStaff"></c:param>
                                                <c:param name="resid" value="${dto.reservationId}"></c:param>


                                            </c:url>
                                            <a href="${viewdetails}">See details</a>
                                            </td>

                                            </tr>
                                        </c:forEach>



                                    </c:if>
                                    </tbody>
                                </table>

                            </div>

                            <!--WaitingList-->
                            <div class="tab-pane fade bg-white" id="customerList" role="tabpanel"
                                 aria-labelledby="v-pills-changePassword-tab">


                                <table class="table table-striped table-bordered mydatatable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>ReservationID</th>
                                            <th>CustomerID</th>
                                            <th>StaffAssignedID</th>
                                            <th> CheckInTime</th>
                                            <th>View details</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBodyWaiting">
                                        <tr>
                                    <c:if test="${requestScope.ListMorning!=null}">
                                        <c:set var="count" value="0"/>
                                        <c:forEach items="${requestScope.ListMorning}" var="dto" >

                                            <tr>
                                            <c:set var="count" value="${count+1}"/>
                                            <td>${count}</td>
                                            <td>${dto.reservationId}</td>
                                            <td>${dto.customerId}</td>
                                            <td>${dto.staffAssignId}</td>
                                            <td>${dto.checkInDate}</td>

                                            <td>
                                            <c:url var="viewdetails" value="DispatchServlet">
                                                <c:param name="btAction" value="ViewReservationDetailsStaff"></c:param>
                                                <c:param name="resid" value="${dto.reservationId}"></c:param>


                                            </c:url>
                                            <a href="${viewdetails}">See details</a>
                                            </td>

                                            </tr>
                                        </c:forEach>

                                    </c:if>
                                    </tbody>
                                </table>

                            </div>

                            <!--RejectedList-->
                            <div class="tab-pane fade bg-white" id="staffList" role="tabpanel"
                                 aria-labelledby="v-pills-changePassword-tab">


                                <table class="table table-striped table-bordered mydatatable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>ReservationID</th>
                                            <th>CustomerID</th>
                                            <th>StaffAssignedID</th>
                                            <th> CheckInTime</th>
                                            <th>View details</th>

                                        </tr>
                                    </thead>

                                    <tbody id="tableBodyRejected">
                                        <tr>
                                    <c:if test="${requestScope.ListNoon!=null}">
                                        <c:set var="count" value="0"/>
                                        <c:forEach items="${requestScope.ListNoon}" var="dto" >

                                            <tr>
                                            <c:set var="count" value="${count+1}"/>
                                            <td>${count}</td>
                                            <td>${dto.reservationId}</td>
                                            <td>${dto.customerId}</td>
                                            <td>${dto.staffAssignId}</td>
                                            <td>${dto.checkInDate}</td>

                                            <td>
                                            <c:url var="viewdetails" value="DispatchServlet">
                                                <c:param name="btAction" value="ViewReservationDetailsStaff"></c:param>
                                                <c:param name="resid" value="${dto.reservationId}"></c:param>


                                            </c:url>
                                            <a href="${viewdetails}">See details</a>
                                            </td>
                                            
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>

                            </div>

                            <!--All-->
                            
                                    </tbody>
                                    <tfoot></tfoot>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <!--JQuery-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <!--Custom JS-->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
        <script>
                                                $(".mydatatable").DataTable();
        </script>


        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            })
        </script>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn xóa tài khoản này?");
                return r;
            }
        </script>
    </body>
</html>
