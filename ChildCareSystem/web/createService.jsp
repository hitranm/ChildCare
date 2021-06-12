<%-- 
    Document   : createService
    Created on : Jun 12, 2021, 5:15:57 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" crossorigin="anonymous">        

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

        <title>Service</title>
    </head>
    <body>

        <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="request"/>
        <h1>Tạo mới dịch vụ</h1>
        <form action="DispatchServlet" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="service-title">Tiêu đề</label>
                <input type="text" class="form-control" id="service-title" name="txtTitle" value="">              
            </div>
            <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.titleLengthError}">
                <div class="text-danger">
                    <small>${requestScope.CREATE_SERVICE_ERROR.titleLengthError}</small>
                </div>
            </c:if>

            <div class="form-group col-md-4">
                <label for="service-specialty">Chuyên khoa</label>
                <select id="service-specialty" class="form-control" name="cboSpecialty">
                    <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                        <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                    </c:forEach>                
                </select>
            </div>

            <div class="form-group">
                <label for="service-content">Nội dụng</label>
                <textarea id="service-content" name="txtServiceContent"></textarea>
                <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}">
                    <div class="text-danger">
                        <small>${requestScope.CREATE_SERVICE_ERROR.descriptionLengthError}</small>
                    </div>
                </c:if>
            </div>

            <div class="form-group col-md-4">
                <label for="service-price">Nhập giá tiền</label>
                <input type="text" id="service-price" class="form-control" value="" name="txtPrice"/>
                <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.priceFormat}">
                    <div class="text-danger">
                        <small>${requestScope.CREATE_SERVICE_ERROR.priceFormat}</small>
                    </div>
                </c:if>
            </div>

            <div class="form-group col-md-4">
                <label for="service-salePrice">Nhập giá khuyến mãi</label>
                <input type="text" id="service-salePrice" class="form-control" value="" name="txtSalePrice"/>
                <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.salePriceFormat}">
                    <div class="text-danger">
                        <small>${requestScope.CREATE_SERVICE_ERROR.salePriceFormat}</small>
                    </div>
                </c:if>
            </div>

            <div class="form-group">
                <label for="service-image">Ảnh nền</label>
                <input type="file" class="form-control" id="service-image" name="fImage">
            </div>

            <button type="submit" class="btn btn-primary" name="btAction" value="CreateService">Tạo mới</button>
        </form>

        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR}">
            <script>
                $(".invalid-feedback").css("display", "block");
            </script>
        </c:if>




        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
