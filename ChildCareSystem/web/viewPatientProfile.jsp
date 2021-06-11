<%-- 
    Document   : viewPatientProfile
    Created on : May 30, 2021, 10:58:55 AM
    Author     : nguye
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Profile Page</title>

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
        <link rel="stylesheet" href="./css/patientProfile.css" />


    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <h1>${CUSTOMER_ID}</h1>
            <c:if test="${requestScope.listPatients!=null}">
                <c:if test="${not empty requestScope.listPatients}" var="testEmpty">
                    <c:forEach items="${requestScope.listPatients}" var="dto2">
                        <form action="LoadPatientProfileServlet" method="POST">
                            <div class="profile-card">
                                <img class="profile-image" src="https://i.imgur.com/tq1CpHn.png" />
                                <hr>
                                <h3 class="profile-name">
                                    ${dto2.patientName}
                                </h3>
                                <p class="profile-description">
                                <p><strong>Giới tính:</strong> 
                                    <c:choose>
                                        <c:when test="${dto2.gender.equals('male')}">
                                            Nam
                                        </c:when>
                                        <c:otherwise>
                                            Nữ
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p><strong>Ngày sinh:</strong> ${dto2.birthday}</p>
                                </p>
                                <hr>
                                <c:url value="LoadPatientProfileByIDServlet" var="updateLink">
                                    <c:param name="id" value="${dto2.patientID}"/>
                                </c:url>
                                <a class="btn btn-primary" href="${updateLink}" role="button">Update</a>
                                <c:url value="DeletePatientProfileByIDServlet" var="deleteLink">
                                    <c:param name="id" value="${dto2.patientID}"/>
                                </c:url>
                                <a class="btn btn-secondary" onclick="return confirmation()" href="${deleteLink}" role="button">Delete</a>
                            </div>

                        </form>
                    </c:forEach>

                </c:if>
                <c:if test="${!testEmpty}">
                    <h2>No User Account here. Add one here</h2>
                </c:if>
            </c:if>


            <h3> <a href="addNewPatient.jsp">Create new Patient Profile</a> </h3>

            <a href="home.jsp">Back to Home.jsp</a>        

            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Special title treatment</h5>
                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
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
