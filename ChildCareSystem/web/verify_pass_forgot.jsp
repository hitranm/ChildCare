<%-- 
    Document   : verify_pass_forgot
    Created on : May 29, 2021, 8:22:54 PM
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
        <span>Chúng tôi đã gửi mã xác thực về email của bạn. Vui lòng kiểm tra email. </span>

        <form action="DispatchServlet" method="POST">
            Nhập mã xác thực email <input type="text" name="authcode" >
            <input type="hidden" name="email" value="${param.email}">
            <input type="hidden" name="phoneNum" value="${param.phoneNum}">
            <button type="submit" name="btAction" value="VerifyPass">Xác nhận </button>
        </form>
    <c:set var="WRONG_CODE" value="${requestScope.WRONG_CODE}"/>
    <c:if test="${WRONG_CODE!=null}">
        <div class="alert alert-danger" role="alert">
            ${requestScope.WRONG_CODE}
        </div>
    </c:if>
</body>
</html>
