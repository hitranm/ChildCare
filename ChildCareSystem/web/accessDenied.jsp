<%-- 
    Document   : accessDenied
    Created on : Jul 4, 2021, 2:44:43 AM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đã có lỗi</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }
            
            .noti {
                min-height: 40vh;
            }
        </style>
    </head>
    <body>
        

        <jsp:include page="header.jsp"/>
        <div class="noti  px-5">
            <div class="alert alert-danger my-5 text-center col-12" role="alert">
                Bạn không có quyền truy cập.
            </div>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
