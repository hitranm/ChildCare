<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html  lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Child care System Dashboard </title>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="css\dashboard.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />

        <link rel="stylesheet" href="./viewAllAccounts.css">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <style>
            #side-bar-icon {
                padding-left: 1rem;
                padding-right: 1rem;
            }
        </style>
    </head>
    <body style="font-family: 'Poppins', sans-serif; font-size: 0.75rem; font-weight: 200; ">
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar" style: background="#3287a8">
            <div class ="sidebar-brand">
                <a  href="StartupServlet" class="link-primary" style="color: white">
                    <h3><span class="lab la-accusoft"></span><span class="lmao" style="font-size: 1.5rem">Child Care System</span></h3>
                </a>
            </div>
            <div class ="sidebar-menu">
                <ul>
                    <li style="padding-left:0.25rem">
                        <a href="DispatchServlet?btAction=ViewMainDashboard"  class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-tv"></span>
                            <span >Tổng quát</span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="DispatchServlet?btAction=ViewAccount"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-users"></span>
                            <span>Tài khoản </span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="ViewAllServiceListServlet"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-first-aid"></span>
                            <span>Dịch vụ </span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="ViewAllBlogListServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-file-alt"></span>
                            <span>Bài viết</span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="DispatchServlet?btAction=ViewReservationForManager" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-notes-medical"></span>
                            <span>Đơn đặt khám</span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="ViewAllFeedbackServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="far fa-comments"></span>
                            <span>Phản hồi</span></a>
                    </li>
                    <li style="padding-left:0.25rem">
                        <a href="ViewSystemSettingServlet" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span id="side-bar-icon" class="fas fa-cogs"></span>
                            <span>Cấu hình hệ thống</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </body>
</html>

