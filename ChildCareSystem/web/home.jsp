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
        <h3> <a href="ViewPatientProfileServlet">Create new Patient Profile</a> </h3>

        <h3> <a href="addNewPatient.jsp">Create new Patient Profile</a> </h3>
       

</body>
</html>
