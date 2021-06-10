<%-- 
    Document   : newpassword
    Created on : May 29, 2021, 8:38:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cài đặt mật khẩu mới</title>
    </head>
    <body>
        <form action="DispatchServlet" method="POST">

            Mật khẩu mới <input type="password" name="password" placeholder="Mật khẩu" required="true">
            Xác nhận mật khẩu <input type="password" name="cpassword" placeholder="Mật khẩu" required="true">
            <input type="hidden" name="email" value="${param.email}">
            <button  type="submit" name="btAction" value="ResetPass">Xác nhận </button>
        </form>
    
    <c:if test="${requestScope.ERROR_PASS!=null}">
        <div class="alert alert-danger" role="alert">
            ${requestScope.ERROR_PASS}
        </div>
    </c:if>
</body>
</html>
