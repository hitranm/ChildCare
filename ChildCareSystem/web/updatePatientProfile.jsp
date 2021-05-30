<%-- 
    Document   : updatePatientProfile
    Created on : May 30, 2021, 11:40:48 AM
    Author     : nguye
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Patient Profile</title>
    </head>
    <body>
        <h1>Update Patient Profile</h1>
        <form action="DispatchServlet" method="POST" name="f1">
            <table>
                <tr>
                    <td>Patient Name</td>
                    <td>: <input type="text" name="txtName" value="${param.txtName}">
                        <font color="red">${requestScope.INVALID.patientNameError}</font></td>
                </tr>
                <tr>
                    <td>Patient Gender</td>
                    <td>: <input type="radio" id="male" name="txtGender" value="0">
                            <label for="male">Male</label><br>
                        : <input type="radio" id="female" name="txtGender" value="1">
                        <label for="female">Female</label><br>
                    <td colspan="2">    <font color="red">${requestScope.INVALID.genderError}</font> </td></td>
                </tr>
                <tr>
                    <td>Patient Birthday</td>
                    <td>: <input type="date" name="txtBirthday" value="${param.txtBithday}">
                        <font color="red">${requestScope.INVALID.birthdayError}</font></td>
                </tr>
                <tr>
                    <td colspan="2"> <button type="submit" name="btAction" value="AddNewPatientProfile"> Create </button></td>
                </tr>

            </table>
        </form>
        <br> <br>

        <a href="home.jsp">Back to Homepage</a>
    </body>
</html>

