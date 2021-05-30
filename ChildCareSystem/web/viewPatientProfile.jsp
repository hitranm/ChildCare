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
    </head>
    <body>
        <c:if test="${requestScope.listPatients!=null}">
            <c:if test="${not empty requestScope.listPatients}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>PATIENT ID</th>
                            <th>PATIENT NAME</th>
                            <th>PATIENT GENDER</th>
                            <th>PATIENT BIRTHDAY</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listPatients}" var="dto2">
                        <form action="LoadPatientProfileServlet" method="POST">
                            <tr>
                                <td>${dto2.patientID}</td>
                                <td>${dto2.patientName}</td>
                                <td>${dto2.gender}</td>
                                <td>${dto2.birthday}</td>
                                <c:url value="LoadPatientProfileByIDServlet" var="updateLink">
                                    <c:param name="id" value="${dto2.patientID}"/>
                                </c:url>
                                <td><a href="${updateLink}">Update</a> </td>

                                <c:url value="DeletePatientProfileByIDServlet" var="deleteLink">
                                    <c:param name="id" value="${dto2.patientID}"/>
                                </c:url>
                                <td><a onclick="return confirmation()" href="${deleteLink}">Delete</a> </td>

                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No User Account here. Add one here</h2>
        </c:if>
    </c:if>
    <h3> <a href="addNewPatient.jsp">Create new Patient Profile</a> </h3>

    <a href="home.jsp">Back to Home.jsp</a>        
    <script>
        function confirmation() {
            var r = confirm("Are you sure you want to delete this?");
            return r;
        }
    </script>
</body>
</html>
