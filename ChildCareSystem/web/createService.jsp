<%-- 
    Document   : createService
    Created on : Jun 12, 2021, 5:15:57 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="css/service/createService.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">

        <script src="https://cdn.tiny.cloud/1/2t4he0yxbmprjqhk0y813ygaxy9y5u0mjixyrmjobarrfcvj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
            tinymce.init({
                selector: 'textarea#service-content',
                skin: 'bootstrap',
                plugins: 'lists, link, image, media',
                toolbar: 'h1 h2 bold italic strikethrough blockquote bullist numlist backcolor | link image media | removeformat help',
                menubar: false
            });
        </script>
        <script>
            tinymce.init({
                selector: 'textarea#service-content',
                menubar: false
            });
        </script>
        
        <style>
            body {
                font-family: 'Niramit', sans-serif;
            }
        </style>
        <title>Dịch vụ</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Authorize -->
        <c:if test="${empty sessionScope.ROLE}">
            <c:set var="DID_LOGIN" scope="request" value="Bạn cần đăng nhập để thực hiện thao tác này"/>
            <jsp:forward page="login.jsp"/>
        </c:if>

        <c:if test="${sessionScope.ROLE != 'staff' and sessionScope.ROLE != 'manager'}">
            <jsp:forward page="accessDenied.jsp"/>
        </c:if>
        <!-- -->

        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
        <div class="service-form-wrapper">         
            <h1>Tạo mới dịch vụ</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6">      
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service-title">Tiêu đề</label>
                        <input type="text" class="form-control" id="service-title" name="txtTitle" value="${param.txtTitle}">              
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.titleLengthError}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.titleLengthError}</small>
                            </div>
                        </c:if>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="service-specialty">Chuyên khoa</label>
                        <select id="service-specialty" class="form-control" name="cboSpecialty">
                            <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                                <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                            </c:forEach>                
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="service-content">Nội dụng</label>
                    <textarea id="service-content" name="txtServiceContent">${param.txtServiceContent}</textarea>
                    <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}">
                        <div class="text-danger">
                            <small>${requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}</small>
                        </div>
                    </c:if>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service-price">Nhập giá tiền</label>
                        <input type="text" id="service-price" class="form-control" value="${param.txtPrice}" name="txtPrice"/>
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.priceFormat}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.priceFormat}</small>
                            </div>
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="service-image">Ảnh nền</label>
                        <input type="file" class="form-control" id="service-image" name="fImage">
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.imageError}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.imageError}</small>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="CreateService">Tạo mới</button>
                </div>

            </form>
        </div>

        <jsp:include page="footer.jsp"/>


    </body>
</html>
