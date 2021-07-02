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
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
            integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
            crossorigin="anonymous"
            />
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
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

        <title>Service</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
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
                        <label for="service-salePrice">Nhập giá khuyến mãi</label>
                        <input type="text" id="service-salePrice" class="form-control" value="${param.txtSalePrice}" name="txtSalePrice"/>
                        <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.salePriceFormat}">
                            <div class="text-danger">
                                <small>${requestScope.CREATE_SERVICE_ERROR.salePriceFormat}</small>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="form-group">
                    <label for="service-image">Ảnh nền</label>
                    <input type="file" class="form-control" id="service-image" name="fImage">
                    <c:if test="${not empty requestScope.CREATE_SERVICE_ERROR.imageError}">
                        <div class="text-danger">
                            <small>${requestScope.CREATE_SERVICE_ERROR.imageError}</small>
                        </div>
                    </c:if>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary col-6 col-md-4" name="btAction" value="CreateService">Tạo mới</button>
                </div>

            </form>
        </div>

        <jsp:include page="footer.jsp"/>


    </body>
</html>
