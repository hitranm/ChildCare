<%--
    Document   : home
    Created on : May 30, 2021, 3:31:54 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Child Care System</title>   
        <link rel="stylesheet" href="./css/homepage.css" />
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <jsp:useBean id="sliderPost" class="web.models.tblBlog.BlogDAO" scope="request"/>

        <style>
            .carousel-item img {
                height: 55vh;
            }
            
            .carousel-description {
                -webkit-line-clamp: 3;
                display: -webkit-box;
                overflow: hidden;
                -webkit-box-orient: vertical;
            }
        </style>

        <main>
            <h2>${sessionScope.ROLE}</h2>
            <div class="main_wrapper px-5 py-5">
                <div class="main_left col-12 col-lg-9">
                    <!--Carousel-->
                    <div
                        id="carouselExampleIndicators"
                        class="carousel slide carousel_wrapper"
                        data-ride="carousel"
                        interval="3000"
                        >
                        <ol class="carousel-indicators">
                            <c:forEach var="post" items="${sliderPost.sliderList}" varStatus="varStatus">
                                <li
                                    data-target="#carouselExampleIndicators"
                                    data-slide-to="${varStatus.index}"
                                    <c:if test="${varStatus.count == 1}">
                                        class="active"  
                                    </c:if>
                                    ></li>
                                </c:forEach>
                        </ol>

                        <div class="carousel-inner">
                            <c:forEach var="post" items="${sliderPost.sliderList}" varStatus="stat">
                                <div 
                                    <c:choose>
                                        <c:when test="${stat.count == 1}">
                                            class="carousel-item active"
                                        </c:when>
                                        <c:otherwise>
                                            class="carousel-item"
                                        </c:otherwise>
                                    </c:choose>
                                    >

                                    <img
                                        class="d-block w-100 img-fluid"
                                        src="./images/blog/${post.thumbnail}"
                                        alt="slide"
                                        />
                                    <div class="carousel_caption-overlay d-none d-lg-flex">
                                        <h5>
                                            ${post.title}
                                        </h5>
                                        <div class="carousel-description mb-3">
                                            ${post.description}
                                        </div>
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $(".carousel-description").find('span').removeAttr("style");
                                        });
                                    </script>
                                </div>
                            </c:forEach> 
                        </div>
                        <a
                            class="carousel-control-prev"
                            href="#carouselExampleIndicators"
                            role="button"
                            data-slide="prev"
                            >
                            <span
                                class="carousel-control-prev-icon"
                                aria-hidden="true"
                                ></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a
                            class="carousel-control-next"
                            href="#carouselExampleIndicators"
                            role="button"
                            data-slide="next"
                            >
                            <span
                                class="carousel-control-next-icon"
                                aria-hidden="true"
                                ></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <!--End carousel-->

                    <!--Post section-->
                    <div class="section">
                        <div class="section-title">
                            <h2>Bài viết nổi bật</h2>
                        </div>
                        <div class="blog_wrapper">
                            <c:if test="${sessionScope.BLOG_LIST_TOP6 != null}">
                                <c:if test="${not empty sessionScope.BLOG_LIST_TOP6}" var="testEmpty">
                                    <c:forEach items="${sessionScope.BLOG_LIST_TOP6}" var="dto">
                                        <div class="blog_card col-xs-12 col-sm-6 col-md-4 pb-2" onclick="location.href = 'ViewBlogDetailServlet?id=${dto.blogID}'">
                                            <article>
                                                <div class="blog_thumbnail">
                                                    <img src="./images/blog/${dto.thumbnail}" />
                                                </div>
                                                <div class="blog_content px-2">
                                                    <h2>
                                                        ${dto.title}
                                                    </h2>
                                                    <div class="blog_date">24 Tháng Năm, 2021</div>
                                                </div>
                                            </article>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${!testEmpty}">
                                    <h2>Hiện chưa có bài viết nào.</h2>
                                </c:if>
                            </c:if>

                        </div>
                        <a href="#" class="section_moredetail pr-4">Xem thêm</a>
                    </div>
                    <!--End post section-->

                    <!-- ======= Cta Section ======= -->
                    <section id="cta" class="cta">
                        <div class="container" data-aos="zoom-in">
                            <div class="text-center">
                                <h3>In an emergency? Need help now?</h3>
                                <p>
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse
                                    cillum dolore eu fugiat nulla pariatur. Excepteur sint
                                    occaecat cupidatat non proident, sunt in culpa qui officia
                                    deserunt mollit anim id est laborum.
                                </p>
                                <a class="cta-btn scrollto" href="#"
                                   >Đặt lịch hẹn</a
                                >
                            </div>
                        </div>
                    </section>
                    <!-- End Cta Section -->

                    <!--Service section-->
                    <div class="section">
                        <div class="section-title">
                            <h2>Dịch vụ</h2>
                        </div>
                        <div class="blog_wrapper">
                            <c:if test="${sessionScope.SERVICE_LIST_TOP3!=null}">
                                <c:if test="${not empty sessionScope.SERVICE_LIST_TOP3}" var="testEmpty">
                                    <c:forEach items="${sessionScope.SERVICE_LIST_TOP3}" var="dto">
                                        <div class="blog_card col-xs-12 col-sm-6 col-md-4 pb-2">
                                            <article>
                                                <div class="blog_thumbnail">
                                                    <img src="./images/service/${dto.thumbnail}" />
                                                </div>
                                                <div class="blog_content px-2">
                                                    <h2>
                                                        ${dto.serviceName}
                                                    </h2>
                                                    <div class="blog_date">${dto.createdDate}</div>
                                                </div>
                                            </article>
                                        </div>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${!testEmpty}">
                                    <h2>Hiện chưa có bài viết nào.</h2>
                                </c:if>
                            </c:if>


                        </div>
                        <a href="#" class="section_moredetail pr-4">Xem thêm</a>
                    </div>
                    <!--End service section-->
                </div>

                <div class="main-right d-none d-lg-flex col-lg-3">
                    <div class="right-post-section">
                        <h4>Bài viết mới nhất</h4>
                        <div class="right-post-card">
                            <h5>LOREM, IPSUM DOLOR SIT AMET</h5>
                            <div class="right-post-content">
                                Enim accusantium commodi deleniti excepturi voluptates quas voluptatibus expedita laboriosam ipsam tempore saepe beatae non velit, labore pariatur, ipsum autem consequatur! Consequatur.
                            </div>
                            <div class="right-post-date">
                                24 Tháng Năm, 2021
                            </div>
                        </div>

                        <div class="right-post-card">
                            <h5>LOREM, IPSUM DOLOR SIT AMET</h5>
                            <div class="right-post-content">
                                Enim accusantium commodi deleniti excepturi voluptates quas voluptatibus expedita laboriosam ipsam tempore saepe beatae non velit, labore pariatur, ipsum autem consequatur! Consequatur.
                            </div>
                            <div class="right-post-date">
                                24 Tháng Năm, 2021
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>
        <a href="#" class="back-to-top"><i class="fas fa-arrow-up"></i></a>


        <!--Custom JS-->
        <script src="./js/main.js"></script>
        <script>
                                            window.addEventListener('load', (event) => {
                                                window.localStorage.clear();
                                                window.localStorage.setItem("identityId", "${sessionScope.IDENTITY_ID}");
                                            });
        </script>
    </body>
</html>
