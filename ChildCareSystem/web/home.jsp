<%--
    Document   : home
    Created on : May 30, 2021, 3:31:54 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Child Care System</title>
        <link rel="stylesheet" href="./css/homepage.css" />
        <link rel="stylesheet" href="css/home/phonering.css"/>
        <link rel="stylesheet" href="css/sidebar.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            * {
                font-family: 'Niramit', sans-serif;
            }
            .carousel-item img {
                height: 55vh;
            }

            .carousel-description {
                -webkit-line-clamp: 3;
                display: -webkit-box;
                overflow: hidden;
                -webkit-box-orient: vertical;
            }
            .carousel-item:hover {
                cursor: pointer;
            }
        </style>
    </head>

    <body>
        <jsp:include page="header.jsp"/>
        <jsp:useBean id="sliderPost" class="web.models.tblBlog.BlogDAO" scope="request"/>


        <main>
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
                                    onclick="clickSlider(${post.blogID})"
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
                    <div class="section my-5">
                        <div class="section-title">
                            <h2>Bài viết nổi bật</h2>
                        </div>
                        <div class="blog_wrapper">
                            <c:if test="${sessionScope.BLOG_LIST_VIEW != null}">
                                <c:if test="${not empty sessionScope.BLOG_LIST_VIEW}" var="testEmpty">
                                    <c:forEach items="${sessionScope.BLOG_LIST_VIEW}" var="dtoBlog">
                                        <div class="blog_card col-xs-12 col-sm-6 col-md-4 pb-2" onclick="location.href = 'ViewBlogDetailServlet?id=${dtoBlog.blogID}'">
                                            <article>
                                                <div class="blog_thumbnail">
                                                    <img src="./images/blog/${dtoBlog.thumbnail}" />
                                                </div>
                                                <div class="blog_content px-2">
                                                    <h2>
                                                        ${dtoBlog.title}
                                                    </h2>
                                                    <div class="blog_date">${dtoBlog.createdDate}</div>
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
                        <a href="ViewBlogServlet?index=1" class="section_moredetail pr-4">Xem thêm</a>
                    </div>
                    <!--End post section-->

                    <!-- ======= Cta Section ======= -->
                    <section id="cta" class="cta">
                        <div class="container" data-aos="zoom-in">
                            <div class="text-center">
                                <h3>Bạn cần tiết kiệm thời gian khi khám bệnh?</h3>
                                <p>
                                    Trung tâm chăm sóc trẻ em CCS hỗ trợ khách hàng đặt lịch hẹn cho dịch vụ trước khi đến để tiết kiệm thời gian.
                                </p>
                                <a class="cta-btn scrollto" href="DispatchServlet?btAction=ChooseServiceReserve"
                                   >Đặt lịch hẹn</a
                                >
                            </div>
                        </div>
                    </section>
                    <!-- End Cta Section -->

                    <!--Service section-->
                    <div class="section my-5">
                        <div class="section-title">
                            <h2>Dịch vụ</h2>
                        </div>
                        <div class="blog_wrapper">
                            <c:if test="${sessionScope.SERVICE_LIST_VIEW!=null}">
                                <c:if test="${not empty sessionScope.SERVICE_LIST_VIEW}" var="testEmpty">
                                    <c:forEach items="${sessionScope.SERVICE_LIST_VIEW}" var="dtoService">
                                        <div class="blog_card col-xs-12 col-sm-6 col-md-4 pb-2" onclick="location.href = 'ViewServiceDetailServlet?id=${dtoService.serviceId}'">
                                            <article>
                                                <div class="blog_thumbnail">
                                                    <img src="./images/service/${dtoService.thumbnail}" />
                                                </div>
                                                <div class="blog_content px-2">
                                                    <h2>
                                                        ${dtoService.serviceName}
                                                    </h2>
                                                    <div class="blog_date">${dtoService.createdDate}</div>
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
                        <a href="ViewServiceListServlet?index=1" class="section_moredetail pr-4">Xem thêm</a>
                    </div>
                    <!--End service section-->
                </div>

                <div class="main-right d-none d-lg-flex col-lg-3">

                    <a class="kbyt mb-4" href="https://kbyt.khambenh.gov.vn/#tokhai_yte/model" target="_blank">
                        <img src="images/kbyt.png" style="width: 100%"/>
                    </a>

                    <div class="right-active-section my-3" style="background: #ef668b;">
                        <div class="active-title">
                            THỜI GIAN HOẠT ĐỘNG
                            <div style="font-size: 14px;">Tất cả các ngày trong tuần</div>
                        </div>
                        <div style="padding: 5px;">Khám chữa bệnh 24/24</div>
                    </div>

                    <a class="right-bpd-section my-3" style="background: #f1b243;" href="https://phapdien.moj.gov.vn/Pages/home.aspx" target="_blank">
                        <div class="bpd-title">
                            BỘ PHÁP ĐIỀN
                        </div>
                    </a>

                    <a class="right-bpd-section my-3" style="background: #1997d4;" href="https://phapdien.moj.gov.vn/Pages/home.aspx" target="_blank">
                        <div class="bpd-title">
                            THÔNG TIN SỞ Y TẾ
                        </div>
                    </a>

                    <div class="right-map-section my-3">
                        <iframe
                            style="border: 0; width: 100%; height: 250px;"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4854095316514!2d105.52487561540214!3d21.01325499368218!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b465a4e65fb%3A0xaae6040cfabe8fe!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1623417301225!5m2!1svi!2s"
                            allowfullscreen="true"
                            loading="lazy"
                            ></iframe>
                    </div>

                    <div class="ring-wrapper">
                        <div class="ring my-5">
                            <div class="ring-phoneNum mr-4"> 0909998888</div>
                            <div class="coccoc-alo-phone coccoc-alo-green coccoc-alo-show">
                                <div class="coccoc-alo-ph-circle"></div>
                                <div class="coccoc-alo-ph-circle-fill"></div>
                                <div class="coccoc-alo-ph-img-circle"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"/>
        <a href="#" class="back-to-top"><i class="fas fa-arrow-up"></i></a>


        <!--Custom JS-->
        <script>
            function clickSlider(blogId) {
                var direction = "ViewBlogDetailServlet?id=" + blogId;
                console.log(direction);
                location.replace(direction);
            }
        </script>
        <script>
            $(function () {
                // Sidebar toggle behavior
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar, #content').toggleClass('active');
                });
            });
        </script>
        <script src="./js/main.js"></script>

    </body>
</html>
