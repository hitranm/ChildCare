<%-- 
    Document   : viewAllAccounts
    Created on : Jun 15, 2021, 10:42:41 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Accounts</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css" />
        <link rel="stylesheet" href="../HomePage/HomePage.css">
        <link rel="stylesheet" href="./viewAllAccounts.css">
        <script src="https://kit.fontawesome.com/9ba09bf17b.js" crossorigin="anonymous"></script>
        <style>
            .loader {
                position: fixed;
                z-index: 99;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: white;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .loader > img {
                width: 100px;
            }

            .loader.hidden {
                animation: fadeOut 1s;
                animation-fill-mode: forwards;
            }

            @keyframes fadeOut {
                100% {
                    opacity: 0;
                    visibility: hidden;
                }
            }
        </style>
    </head>

    <body>
        <!-- <header>
                <nav class="navbar navbar-expand-lg navbar-light bg-white navbar-center">
                  <a class="navbar-brand" href="../HomePage/">
                    <img src="../img/rsz_logo_2000x2000 (1).png" alt="logo" width="40" height="40">
                  </a>
                  <button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                  </button>
            
                  <div class="collapse navbar-collapse  bg-white" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto ">
                      <li class="nav-item bg-white">
                        <a class="nav-link" href="../HomePage">
                          <i class="fas fa-home"></i>
                          Home<span class="sr-only"></span>
                        </a>
                      </li>
                      <li class="nav-item bg-white">
                        <a class="nav-link" href="../CreatePost" onclick="resetTopicId()">
                          <i class="far fa-calendar-plus"></i>
                          Create</a>
                      </li>
                      <li class="nav-item bg-white">
                        <a class="nav-link" href="/Schedule">
                          <i class="fas fa-calendar-alt"></i>
                          Schedule</a>
                      </li>
                      <li class="nav-item dropdown bg-white">
                        <a class="nav-link dropdown-toggle" href="#" id="userAccount" role="button" data-toggle="dropdown"
                          aria-haspopup="true" aria-expanded="false">
                          <i class="fas fa-user"></i>
                          
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item active" href="../UserPosts">
                            <i class="fas fa-chart-bar"></i>
                            User status</a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="/logout">
                            <i class="fas fa-sign-out-alt"></i>
                            Logout</a>
                        </div>
                      </li>
                    </ul>
        <!-- <form class="form-inline my-2 my-lg-0  bg-white">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> 
      </div>
    </nav>

    <div class="collapse navbar-collapse  bg-white" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto ">
        <li class="nav-item bg-white">
          <a class="nav-link" href="../HomePage">Home <span class="sr-only"></span></a>
        </li>
        <li class="nav-item bg-white">
          <a class="nav-link" href="../CreatePost/CreatePost" onclick="resetTopicId()">Create</a>
        </li>
        <li class="nav-item bg-white">
          <a class="nav-link" href="../Schedule">Schedule</a>
        </li>
        <li class="nav-item dropdown bg-white">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
            aria-haspopup="true" aria-expanded="false">
            Account
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item active" href="../UserPosts">User status</a>
            <div class="dropdown-divider"></div>

            <a class="dropdown-item" href="/logout">Logout</a>
          </div>
        </li>
      </ul>
        <!-- <form class="form-inline my-2 my-lg-0  bg-white">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> 
      </div>
      </nav>
  </header>-->
        <main>
            <div class="loader">
                <img src="../img/loading.gif" alt="Loading..." />
            </div>
            <div class="userPosts__container">
                <div class="userPosts__wrapper">
                    <h2 class="userPosts__title">Accounts List</h2>
                    <div class="dropdownButton__wrapper">
                        <button class="btn btn-primary dropdown-toggle selectButton" type="button" id="dropdownMenu2"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Role
                        </button>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                            <div class="nav flex-column nav-pills navbar-expand-lg bg-white" id="v-pills-tab" role="tablist"
                                 aria-orientation="vertical">
                                <a class="nav-link" id="v-pills-changeUsername-tab" data-toggle="pill"
                                   href="#allList" role="tab" aria-controls="v-pills-changeUsername" aria-selected="true"
                                   onclick="toggleButton(this)">All</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#customerList"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Customer</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#staffList"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Staff</a>
                                <a class="nav-link" id="v-pills-changePassword-tab" data-toggle="pill" href="#managerList"
                                   role="tab" aria-controls="v-pills-changePassword" aria-selected="false"
                                   onclick="toggleButton(this)">Manager</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 table__wrapper bg-white">
                        <div class="tab-content" id="v-pills-tabContent">
                            <!--All List-->
                            <div class="tab-pane fade show active bg-white" id="allList" role="tabpanel"
                                 aria-labelledby="v-pills-changePassword-tab">

                                <table class="table table-striped table-bordered mydatatable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>IdentityID</th>
                                            <th>Full Name</th>
                                            <th>Phone Number</th>
                                            <th> Role</th>
                                        </tr>
                                    </thead>

                                    <tbody id="tableBodyAccepted">
                                        <c:if test="${requestScope.ListCustomer!=null}">
                                            <c:set var="count" value="0"/>
                                            <c:forEach items="${requestScope.ListCustomer}" var="dto" >

                                                <tr>
                                                    <c:set var="count" value="${count+1}"/>
                                                    <td>${count}</td>

                                                    <td>${dto.identityID}</td>
                                                    <td>${dto.fullName}</td>
                                                    <td>${dto.phoneNumber}</td>
                                                    <td class="alert alert-success">Customer</td>
                                                    <td>
                                                        <c:url var="viewdetails" value="DispatchServlet">
                                                            <c:param name="btAction" value="ViewDetails"></c:param>
                                                            


                                                        </c:url>
                                                        <a href="${viewdetails}">See details</a>
                                                    </td>
                                                    <td>
                                                        <c:url var="delete" value="DispatchServlet">
                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                            <c:param name="id" value="${dto.identityID}"></c:param>
                                                            

                                                        </c:url>
                                                        <a class="btn btn-danger" onclick="return confirmation()" href="${delete}" role="button">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            <c:if test="${requestScope.ListStaff!=null}">

                                                <c:forEach items="${requestScope.ListStaff}" var="dto" >

                                                    <tr>
                                                        <c:set var="count" value="${count+1}"/>
                                                        <td>${count}</td>

                                                        <td>${dto.identityID}</td>
                                                        <td>${dto.fullName}</td>
                                                        <td>${dto.phoneNumber}</td>
                                                        <td class="alert alert-warning">Staff</td>
                                                        <td>
                                                            <c:url var="viewdetails" value="DispatchServlet">
                                                                <c:param name="btAction" value="ViewDetails"></c:param>
                                                               


                                                            </c:url>
                                                            <a href="${viewdetails}">See details</a>
                                                        </td>
                                                        <td>
                                                        <c:url var="delete" value="DispatchServlet">
                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                            <c:param name="id" value="${dto.identityID}"></c:param>
                                                            

                                                        </c:url>
                                                        <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                    </td>
                                                    </tr>
                                                </c:forEach>  
                                                <c:if test="${requestScope.ListManager!=null}">

                                                    <c:forEach items="${requestScope.ListManager}" var="dto" >

                                                        <tr>
                                                            <c:set var="count" value="${count+1}"/>
                                                            <td>${count}</td>

                                                            <td>${dto.identityID}</td>
                                                            <td>${dto.fullName}</td>
                                                            <td>${dto.phoneNumber}</td>
                                                            <td class="alert alert-danger">Manager</td>
                                                            <td>
                                                                <c:url var="viewdetails" value="DispatchServlet">
                                                                    <c:param name="btAction" value="ViewDetails"></c:param>
                                                                    


                                                                </c:url>
                                                                <a href="${viewdetails}">See details</a>
                                                            </td>
                                                            <td>
                                                        <c:url var="delete" value="DispatchServlet">
                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                            <c:param name="id" value="${dto.identityID}"></c:param>
                                                            

                                                        </c:url>
                                                       <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                    </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:if>
                                    </c:if>
                                </c:if>
                            </div>

                            <!--WaitingList-->
                            <div class="tab-pane fade bg-white" id="customerList" role="tabpanel"
                                 aria-labelledby="v-pills-changePassword-tab">


                                <table class="table table-striped table-bordered mydatatable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>IdentityID</th>
                                            <th>Full Name</th>
                                            <th>Phone Number</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableBodyWaiting">
                                        <tr>
                                            <c:if test="${requestScope.ListCustomer!=null}">
                                                <c:set var="count" value="0"/>
                                                <c:forEach items="${requestScope.ListCustomer}" var="dto" >

                                                <tr>
                                                    <c:set var="count" value="${count+1}"/>
                                                    <td>${count}</td>

                                                    <td>${dto.identityID}</td>
                                                    <td>${dto.fullName}</td>
                                                    <td>${dto.phoneNumber}</td>
                                                    <td class="alert alert-success">Customer</td>
                                                    <td>
                                                        <c:url var="viewdetails" value="DispatchServlet">
                                                            <c:param name="btAction" value="ViewDetails"></c:param>
                                                            


                                                        </c:url>
                                                        <a href="${viewdetails}">See details</a>
                                                    </td>
                                                    <td>
                                                        <c:url var="delete" value="DispatchServlet">
                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                            <c:param name="id" value="${dto.identityID}"></c:param>
                                                            

                                                        </c:url>
                                                        <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>
                            </div>

                            <!--RejectedList-->
                            <div class="tab-pane fade bg-white" id="staffList" role="tabpanel"
                                 aria-labelledby="v-pills-changePassword-tab">


                                <table class="table table-striped table-bordered mydatatable">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>IdentityID</th>
                                            <th>Full Name</th>
                                            <th>Phone Number</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>

                                    <tbody id="tableBodyRejected">
                                        <tr>
                                            <c:if test="${requestScope.ListStaff!=null}">
                                                <c:set var="count" value="0"/>
                                                <c:forEach items="${requestScope.ListStaff}" var="dto" >

                                                <tr>
                                                    <c:set var="count" value="${count+1}"/>
                                                    <td>${count}</td>

                                                    <td>${dto.identityID}</td>
                                                    <td>${dto.fullName}</td>
                                                    <td>${dto.phoneNumber}</td>
                                                    <td class="alert alert-warning">Staff</td>
                                                    <td>
                                                        <c:url var="viewdetails" value="DispatchServlet">
                                                            <c:param name="btAction" value="ViewDetails"></c:param>
                                                           


                                                        </c:url>
                                                        <a href="${viewdetails}">See details</a>
                                                    </td>
                                                    <td>
                                                        <c:url var="delete" value="DispatchServlet">
                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                            <c:param name="id" value="${dto.identityID}"></c:param>
                                                            

                                                        </c:url>
                                                        <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>
                            </div>

                            <!--All-->
                            <div class="tab-pane fade bg-white" id="managerList" role="tabpanel"
                                 >
                                <table class="table table-striped table-bordered mydatatable" id="tableAll">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>IdentityID</th>
                                            <th>Full Name</th>
                                            <th>Phone Number</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>

                                    <tbody id="tableBodyAll">
                                        <tr>
                                            <c:if test="${requestScope.ListManager!=null}">
                                                <c:set var="count" value="0"/>
                                                <c:forEach items="${requestScope.ListManager}" var="dto" >

                                                <tr>
                                                    <c:set var="count" value="${count+1}"/>
                                                    <td>${count}</td>

                                                    <td>${dto.identityID}</td>
                                                    <td>${dto.fullName}</td>
                                                    <td>${dto.phoneNumber}</td>
                                                    <td class="alert alert-danger">Manager</td>
                                                    <td>
                                                        <c:url var="viewdetails" value="DispatchServlet">
                                                            <c:param name="btAction" value="ViewDetails"></c:param>
                                                           


                                                        </c:url>
                                                        <a href="${viewdetails}">See details</a>
                                                    </td>
                                                    <td>
                                                        <c:url var="delete" value="DispatchServlet">
                                                            <c:param name="btAction" value="DeleteAccount"></c:param>
                                                            <c:param name="id" value="${dto.identityID}"></c:param>
                                                            

                                                        </c:url>
                                                        <a onclick="return confirmation()" class="btn btn-danger" href="${delete}" role="button">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tr>
                                        </tbody>
                                        <tfoot></tfoot>
                                    </table>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>
        <!--
             <footer>
              <div class="footer__title col-lg-3 ">
                <h3>F-Code Workshop</h3>
                <img src="../img/rsz_logo_2000x2000 (1).png">
              </div>
              <div class="footer__description col-lg-6 ">
                <p>Knowledge shared is knowledge squared</p>
                
              </div>
              <div class="footer__contact col-lg-3 ">
                <h3>Contact</h3>
                <div class="contact__icons">
                  <a href="https://www.facebook.com/fcodefpt" target="_blank"><img src="../img/facebook.svg"></a>
                  <a href="mailto: fcode.fptuhcm@gmail.com"><img src="../img/gmail.svg"></a>
                </div>
              </div>
              <div class="footer__copyright">© F-Code Club 2020</div>
            </footer>
        -->
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


        <script src="./UserPosts.js"></script>
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
        <script>
            $(".mydatatable").DataTable();
        </script>
    </body>

</html>
