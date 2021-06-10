<%-- 
    Document   : forgot_pass
    Created on : May 26, 2021, 10:55:00 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Pass Page</title>
    </head>
    <body>
        <form action="DispatchServlet" method="POST">
            Nhập email <input type="email" name="email" value="${param.email}" placeholder="Email" required="true"></br>
            <button type="submit" name="btAction" value="Forgot"> Tra cứu </button>
        </form>

    <c:set var="ERROR_EMAIL" value="${requestScope.ERROR_EMAIL}"/>
    <c:if test="${ERROR_EMAIL!=null}">
        <div class="alert alert-danger" role="alert">
            ${requestScope.ERROR_EMAIL}
        </div>
    </c:if>
</body>
</html>
