<%-- 
    Document   : home
    Created on : May 21, 2021, 11:19:07 PM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome ${sessionScope.LOGIN_USER}</h1>
        <h2>Welcome ${sessionScope.USER_ID}</h2>

        <h2>Patient management</h2>
        <h3> <a href="addNewPatient.jsp">Create new Patient Profile</a> </h3>
        <c:if test="${requestScope.listUsers!=null}">
            <c:if test="${not empty requestScope.listUsers}" var="testEmpty">
                <table border="1">
                    <thead>
                        <tr>
                            <th>USER ID</th>
                            <th>USER PASSWORD</th>
                            <th>USER NAME</th>
                            <th>USER EMAIL</th>
                            <th>USER ADDRESS</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listUsers}" var="dto2">
                        <form action="loadProductByCategory" method="POST">
                            <tr>
                                <td>${dto2.userID}</td>
                                <td>${dto2.password}</td>
                                <td>${dto2.fullname}</td>
                                <td>${dto2.email}</td>
                                <td>${dto2.address}</td>
                                <c:url value="loadUserByID" var="updateLink">
                                    <c:param name="id" value="${dto2.userID}"/>
                                </c:url>
                                <td><a href="${updateLink}">Update</a> </td>

                                <c:url value="deleteUser" var="deleteLink">
                                    <c:param name="id" value="${dto2.userID}"/>
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

    </body>
</html>
