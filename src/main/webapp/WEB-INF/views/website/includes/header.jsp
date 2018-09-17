<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="currentPath">${pageContext.request.getAttribute("javax.servlet.forward.request_uri")}</c:set>
<c:set var="queryString">${pageContext.request.getAttribute("javax.servlet.forward.query_string")}</c:set>
<c:set var="queryString"><c:if test="${not empty queryString}">?</c:if>${queryString}</c:set>
<c:set var="linkPath" value=""/>
<header id="header" class="no-print">
    <div class="container main-menu container-fluid">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo" class="col-md-3">
                <a href="${contextpath}/"><img class="img-responsive logo" src="<c:url value="/resources/website/assets/img/logo.png"/>" alt="blog -logo"></a>
            </div>
            <nav id="nav-menu-container" class="col-md-9">
                <ul class="nav-menu">
                    <li><a href="${contextPath}/">Home</a></li>
                    <li><a href="${contextPath}/about.html">About</a></li>
                    <li><a href="${contextPath}/services.html">Services</a></li>
                    <li><a href="${contextPath}/portfolio.html">Portfolio</a></li>
                    <li> <a href="<c:url value="${contextPath}/resources/website/assets/cv/Java_Developer_Md.Amran_Hossain.pdf"/>" target="_blank">Resume</a></li>
                    <li class="menu-has-children"><a href="">Blog</a>
                        <ul>
                            <li><a href="${contextPath}/blog-home.html">Blog Home</a></li>
                        </ul>
                    </li>
                    <li> <a href="mailto:explore247h@gmail.com">E-mail</a></li>
                    <li><a href="${contextPath}/contact.html">Contact</a></li>
                </ul>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->


<%--
<button class="printIco no-print" onclick="window.print();return false;"><i class="fa fa-print"></i></button>--%>
