<%-- 
    Document   : verify
    Created on : May 26, 2021, 9:43:19 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <span>We already send a verification  code to your email. </span>
        
        <form action="DispatchServlet" method="POST">
            Nhập mã xác thực email <input type="text" name="authcode" >
            <input type="submit" name="btAction" value="Verify">
            <input type="hidden" name="fullName" value="${param.fullName}">
            <input type="hidden" name="email" value="${param.email}">
            <input type="hidden" name="phoneNum" value="${param.phoneNum}">
            <input type="hidden" name="address" value="${param.address}">
            <input type="hidden" name="password" value="${param.password}">
            <input type="hidden" name="birthday" value="${param.birthday}">
            <input type="hidden" name="citizenID" value="${param.citizenID}">
            <input type="hidden" name="roleID" value="${param.roleID}">
            
        </form>
        <c:set var="WRONG_CODE" value="${requestScope.WRONG_CODE}"/>
                    <c:if test="${WRONG_CODE!=null}">
                        <div class="alert alert-danger" role="alert">
                            ${requestScope.WRONG_CODE}
                        </div>
                    </c:if>
    </body>
</html>
