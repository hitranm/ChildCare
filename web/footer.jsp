<%-- 
    Document   : footer
    Created on : Jun 7, 2021, 5:08:58 PM
    Author     : HOANGKHOI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
            href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="css/footer.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Niramit&display=swap" rel="stylesheet">
        <style>
            *{
                font-family: 'Niramit', sans-serif;
            }
        </style>
    </head>
    <body>
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3>Trung tâm dịch vụ</h3>
                            <p>
                                Lô E2a-7, Đường D1, Khu Công nghệ cao <br />
                                TP Hồ Chí Minh, Q9<br />
                                Việt Nam <br /><br />
                                <strong>Phone:</strong> 0909998888<br />
                                <strong>Email:</strong> childcaresystem@gmail.com<br />
                            </p>
                        </div>

                        <div class="col-lg-2 col-md-6 footer-links">
                            <h4>Về chúng tôi</h4>
                            <ul>
                                <li>
                                    <i class="bx bx-chevron-right"></i> <a href="#">Hệ thống</a>
                                </li>
                                <li>
                                    <i class="bx bx-chevron-right"></i>
                                    <a href="#">Đội ngũ bác sĩ</a>
                                </li>
                                <li>
                                    <i class="bx bx-chevron-right"></i> <a href="#">Tin tức</a>
                                </li>
                                <li>
                                    <i class="bx bx-chevron-right"></i> <a href="#">Thư viện</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Về dịch vụ</h4>
                            <ul>
                                <li>
                                    <i class="bx bx-chevron-right"></i> <a href="#">Cơ sở vật chất</a>
                                </li>
                                <li>
                                    <i class="bx bx-chevron-right"></i>
                                    <a href="#">Đánh giá</a>
                                </li>
                                <li>
                                    <i class="bx bx-chevron-right"></i>
                                    <a href="#">Liên hệ</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-4 col-md-6 footer-newsletter">
                            <h4>Cập nhật thông tin mới nhất</h4>
                            <p>Hãy nhập email của bạn</p>
                            <form action="" method="post">
                                <input type="email" name="email" /><input
                                    type="submit"
                                    value="Đăng ký"
                                    />
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container d-md-flex py-4">
                <div class="mr-md-auto text-center text-md-left">
                    <div class="copyright">
                        &copy; Copyright <strong><span>Child Care Sytem</span></strong
                        >. All Rights Reserved
                    </div>
                    <div class="credits"></div>
                </div>
                <div class="social-links text-center text-md-right pt-3 pt-md-0">
                    <a href="#" class="twitter"><i class="bx bxl-google-plus"></i></a>
                    <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                </div>
            </div>
        </footer>
    </body>
</html>
