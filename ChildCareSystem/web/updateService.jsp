<%-- 
    Document   : updateService
    Created on : Jun 26, 2021, 3:00:17 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật dịch vụ</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">          
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="stylesheet" href="css/service/createService.css">

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
            * {
                font-family: 'Niramit', sans-serif;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <c:set var="service" value="${requestScope.SERVICE}"/>
        <c:set var="spec" value="${requestScope.SPECIALTY}"/>
        <div class="service-form-wrapper">         
            <h1>Cập nhật dịch vụ</h1>
            <form action="DispatchServlet" method="post" enctype="multipart/form-data" class="col-md-6">      
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service-title">Tiêu đề</label>
                        <input type="hidden" name="txtServiceID" value="${service.serviceId}" />
                        <input type="text" class="form-control" id="service-title" name="txtTitle" value="${service.serviceName}"/>              
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.titleLengthError}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.titleLengthError}</small>
                            </div>
                        </c:if>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="service-specialty">Chuyên khoa</label>
                        <select id="service-specialty" class="form-control" name="cboSpecialty">
                            <c:forEach items="${spec}" var="dto">
                                <c:if test="${dto.specialtyId eq service.specialtyId}">
                                    <option value="${dto.specialtyId}" selected>${dto.specialtyName}</option>
                                </c:if>
                                <c:if test="${dto.specialtyId != service.specialtyId}">
                                    <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                                </c:if>
                            </c:forEach>                
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="service-content">Nội dụng</label>
                    <textarea id="service-content" name="txtServiceContent">${service.description}</textarea>
                    <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}">
                        <div class="text-danger">
                            <small>${requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}</small>
                        </div>
                    </c:if>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="service-price">Nhập giá tiền</label>
                        <input type="text" id="service-price" class="form-control" value="${service.price}" name="txtPrice"/>
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.priceFormat}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.priceFormat}</small>
                            </div>
                        </c:if>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="service-image">Ảnh nền</label>
                        <input type="file" class="form-control" id="service-image" name="fImage">
                    </div>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="UpdateService">Cập nhật</button>
                </div>
            </form>
        </div>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
