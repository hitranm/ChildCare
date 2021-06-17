<%-- 
    Document   : chooseServiceReserve
    Created on : Jun 17, 2021, 3:50:01 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose service</title>
        <style>
            main {
                min-height: 70vh;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <main>
            <jsp:useBean id="specialty" class="web.models.tblSpecialty.SpecialtyDAO" scope="page"/>
            <jsp:useBean id="listTime" class="web.models.tblOpenTime.OpenTimeDAO"/>


            <div class="wrapper">
                <div>${identityId}</div>
                <h3>Choose service</h3>
                <div class="form-group col-md-6">
                    <label for="service-specialty">Chuyên khoa</label>
                    <select id="service-specialty" class="form-control" name="cboSpecialty">
                        <c:forEach items="${specialty.viewSpecialtyList()}" var="dto">
                            <option value="${dto.specialtyId}">${dto.specialtyName}</option>
                        </c:forEach>                
                    </select>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="service-specialty">Chọn thời gian</label>
                    <select id="service-specialty" class="form-control" name="cboSpecialty">
                        <c:forEach items="${listTime.viewTimeList()}" var="timeDTO">
                            <option value="${timeDTO.openTimeId}">${timeDTO.openTime}</option>
                        </c:forEach>                
                    </select>
                </div>
                
                
                
                <div class="col-4">
                    <div class="list-group" id="list-tab" role="tablist">

                        <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#" role="tab">Home</a>
                        <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#" role="tab">Profile</a>
                        <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#" role="tab">Messages</a>
                        <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#" role="tab">Settings</a>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
