<%-- 
    Document   : dashboard
    Created on : Jul 1, 2021, 1:15:32 AM
    Author     : Admin
--%>

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
    </head>
    <body style="font-family: 'Poppins', sans-serif; font-size: 0.75rem; font-weight: 200; ">
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar" style: background="#3287a8">
            <div class ="sidebar-brand">
                <h3><span class="lab la-accusoft"> 
                    </span>
                    <span class="lmao" style="font-size: 1.5rem">
                        Child Care System
                    </span></h3>

            </div>
            <div class ="sidebar-menu">
                <ul>
                                       <li>
                        <a href="dashboard.jsp"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="las la-igloo"></span>
                            <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="DispatchServlet?btAction=ViewAccount"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="fas fa-users"></span>
                            <span>Account </span></a>
                    </li>
                    <li>
                        <a href="serviceDashboard.jsp"  class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="fas fa-first-aid"></span>
                            <span>Service </span></a>
                    </li>
                    <li>
                        <a href="blogDashboard.jsp" class="active" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="fas fa-file-alt"></span>
                            <span>Blog</span></a>
                    </li>
                    <li>
                        <a href="DispatchServlet?btAction=ViewReservationForManager" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="fas fa-notes-medical"></span>
                            <span>Reservation</span></a>
                    </li>
                    <li>
                        <a href="feedbackDashboard.jsp" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="far fa-comments"></span>
                            <span>Feedback</span></a>
                    </li>
                    <li>
                        <a href="systemSettingsDashboard.jsp" class="btn btn-outline-light" style="border: none; border-radius: 30px 0px 0px 30px;text-align: left"><span class="fas fa-cogs"></span>
                            <span>System Settings</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <header>
                <h2>
                    <label for="nav-toggle">
                        <span class="las la-bars"></span>
                    </label>
                    Dashboard
                </h2>
                <div class="search-wrapper">
                    <span class="las la-search"></span>
                    <input type="search"/>
                </div>
                <div class="user-wrapper">
                    
                    <div>
                        <h4>John Doe</h4>
                        <small>Super administrator
                        </small>
                    </div>
                </div>

            </header>
            <main>
                <div class="cards">
                    <div class="card-single">
                        <div>
                            <h1>30</h1>
                            <span>Bài đăng</span>
                        </div>
                        <div>
                            <span class="fas fa-file-alt"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>20</h1>
                            <span>Đang hiển thị</span>
                        </div>
                        <div>
                            <span class="fas fa-eye"></span>
                        </div>
                    </div>
                    <div class="card-single">
                        <div>
                            <h1>10</h1>
                            <span>Đang chờ duyệt</span>
                        </div>
                        <div>
                            <span class="fas fa-spinner"></span>
                        </div>
                    </div>
                    


                </div>
                <div class="recent-grid">
                    <div class="projects">
                        <div class="card">
                            <div class="card-header">
                                <h3>Accounts List</h3>
                                
                            </div>
                            <div class="card-body">
                                
                                
                                
                                
                            </div>

                        </div>

                    </div>
                </div>
            </main>
        </div>
        <!--JQuery-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

        <!--Custom JS-->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
        <script>
                                                                                $(".mydatatable").DataTable();
        </script>


        <script>
            window.addEventListener('load', function () {
                const loader = document.querySelector(".loader");
                loader.className += " hidden"; // class "loader hidden"
            })
        </script>
        <script>
            function confirmation() {
                var r = confirm("Bạn có chắc muốn xóa tài khoản này?");
                return r;
            }
        </script>
    </body>
</html>

