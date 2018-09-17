<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- start footer Area -->
<footer class="footer-area section-gap">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h4> <a href="${contextPath}/about.html" style="color: #FFF">About Me</a></h4>
                    <h3 style="color: #FFF">IMRAN HOSSAIN</h3>
                    <h4>
                        <time>Software Developer(Java & Spring)</time>
                        <br>BASE Ltd.
                    </h4>

                    <p class="footer-text">
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This application is built  by IMRAN<i class="fa fa-heart-o" aria-hidden="true"></i><i class="fa fa-heart-o" aria-hidden="true"></i>
                       </p>
                </div>
            </div>
            <div class="col-lg-5 col-md-6 col-sm-6">
                <div class="single-footer-widget">
                    <h4>About Project</h4>
                    <div class="" id="mc_embed_signup">
                        <p>Project is built with update technology of java like spring, Hibernate, DataJPA </p>
                        <p>Github Link: <a href="https://github.com/Huntsman-Imran/myinfo_blog" target="_blank"><i class="fa fa-github"></i></a></p>
                        <%--<form target="_blank" action="" method="get">
                            <div class="input-group">
                                <input type="text" class="form-control" name="EMAIL" placeholder="Enter Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email Address '" required="" type="email">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit">
                                        <span class="lnr lnr-arrow-right"></span>
                                    </button>
                                </div>
                                <div class="info"></div>
                            </div>
                        </form>--%>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-6 social-widget">
                <div class="single-footer-widget">
                    <h4>Follow Me</h4>
                    <p>Let us be social</p>
                    <div class="footer-social d-flex align-items-center">
                        <a href="https://www.facebook.com/profile.php?id=100005065213335" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/IMRANHO15468379" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="https://github.com/Huntsman-Imran" target="_blank"><i class="fa fa-github"></i></a>
                        <a href="https://www.instagram.com/durbarimran24h/" target="_blank"><i class="fa fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End footer Area -->
