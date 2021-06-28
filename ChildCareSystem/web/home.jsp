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
        <link rel="stylesheet" href="css/home/phonering.css">
    </head>

    <body>
        <jsp:include page="header.jsp"/>

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
                            <li
                                data-target="#carouselExampleIndicators"
                                data-slide-to="0"
                                class="active"
                                ></li>
                            <li
                                data-target="#carouselExampleIndicators"
                                data-slide-to="1"
                                ></li>
                            <li
                                data-target="#carouselExampleIndicators"
                                data-slide-to="2"
                                ></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img
                                    class="d-block w-100"
                                    src="./images/tan-tam-nang-dong.jpg"
                                    alt="First slide"
                                    />

                                <div class="carousel_caption-overlay d-none d-lg-flex">
                                    <h5>
                                        Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                                    </h5>
                                    <div>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Enim accusantium commodi deleniti excepturi voluptates quas
                                        voluptatibus expedita laboriosam ipsam tempore saepe beatae
                                        non velit, labore pariatur, ipsum autem consequatur!
                                        Consequatur.
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img
                                    class="d-block w-100"
                                    src="./images/tan-tam.jpg"
                                    alt="Second slide"
                                    />
                                <div class="carousel_caption-overlay d-none d-lg-flex">
                                    <h5>
                                        Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                                    </h5>
                                    <div>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Enim accusantium commodi deleniti excepturi voluptates quas
                                        voluptatibus expedita laboriosam ipsam tempore saepe beatae
                                        non velit, labore pariatur, ipsum autem consequatur!
                                        Consequatur.
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img
                                    class="d-block w-100"
                                    src="./images/nang-dong.jpg"
                                    alt="Second slide"
                                    />
                                <div class="carousel_caption-overlay d-none d-lg-flex">
                                    <h5>
                                        Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                                    </h5>
                                    <div>
                                        Lorem ipsum dolor sit, amet consectetur adipisicing elit.
                                        Enim accusantium commodi deleniti excepturi voluptates quas
                                        voluptatibus expedita laboriosam ipsam tempore saepe beatae
                                        non velit, labore pariatur, ipsum autem consequatur!
                                        Consequatur.
                                    </div>
                                </div>
                            </div>
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
                            <c:if test="${sessionScope.BLOG_LIST_VIEW != null}">
                                <c:if test="${not empty sessionScope.BLOG_LIST_VIEW}" var="testEmpty">
                                    <c:forEach items="${sessionScope.BLOG_LIST_VIEW}" var="dto">
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
                                <h3>Bạn cần tiết kiệm thời gian khi khám bệnh?</h3>
                                <p>
                                    Trung tâm chăm sóc trẻ em CCS hỗ trợ khách hàng đặt lịch hẹn cho dịch vụ trước khi đến để tiết kiệm thời gian.
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
                            <c:if test="${sessionScope.SERVICE_LIST_VIEW!=null}">
                                <c:if test="${not empty sessionScope.SERVICE_LIST_VIEW}" var="testEmpty">
                                    <c:forEach items="${sessionScope.SERVICE_LIST_VIEW}" var="dto">
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
                    <div class="right-post-section mb-5" hidden>
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
                  
                    <a class="kbyt mb-4" href="https://kbyt.khambenh.gov.vn/#tokhai_yte/model" target="_blank">
                        <img src="images/kbyt.png" style="width: 100%"/>
                    </a>
                    
                    <div class="right-active-section my-3" style="background: #ef668b;">
                        <div class="active-title">
                            Thời gian hoạt động
                            <div style="font-size: 14px;">Tất cả các ngày trong tuần</div>
                        </div>
                        <div style="padding: 5px;">Khám chữa bệnh 24/24</div>
                    </div>

                    <div class="right-map-section my-3">
                        <iframe
                            style="border: 0; width: 100%;"
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
        <script src="./js/main.js"></script>
        <script>
                                            window.addEventListener('load', (event) => {
                                                window.localStorage.clear();
                                                window.localStorage.setItem("identityId", "${sessionScope.IDENTITY_ID}");
                                            });
        </script>
    </body>
</html>
