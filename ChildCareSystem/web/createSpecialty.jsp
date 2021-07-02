<%-- 
    Document   : createSpecialty
    Created on : Jun 23, 2021, 9:57:24 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chuyên khoa</title>
        <link rel="stylesheet" href="css/specialty/createSpecialty.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="specialty-form-wrapper justify-content-between">
            <h1>Tạo chuyên khoa mới</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6 mt-4">
                <div class="form-row mt-3">
                    <label for="specialty-name">Tên chuyên khoa</label>
                    <input type="text" class="form-control" name="txtSpecialty" value="" required/>
                </div>
                <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="CreateSpecialty">Tạo mới</button>
                </div>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
