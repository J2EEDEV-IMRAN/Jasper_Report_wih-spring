<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<div class="col-md-3 col-sm-4">
    <div class="nav-side-menu">
        <div class="brand"><spring:message code="website.menu.text"/> </div>
        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
        <div class="menu-list">
            <ul id="menu-content" class="menu-content collapse out">
                <li>
                    <a href="${contextPath}"><i class="fa fa-home fa-lg"></i> <spring:message code="website.home.text"/> </a>
                </li>
                <li  data-toggle="collapse" data-target="#lawsbd" class="collapsed active">
                    <a href="#"><i class="fa fa-balance-scale fa-lg"></i> <spring:message code="website.lawsOfBangladesh.text"/> <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="lawsbd">
                    <li class="active"><a href="#"><spring:message code="website.chronologicalIndex.text"/> </a></li>
                    <li><a href="#"><spring:message code="website.alphabiticalIndex.text"/> </a></li>
                    <li><a href="#"><spring:message code="website.lawSearch.text"/> </a></li>
                </ul>
                <li data-toggle="collapse" data-target="#bdcode" class="collapsed">
                    <a href="#"><i class="fa fa-gavel fa-lg"></i></i> <spring:message code="website.bangladeshcode.text"/> <span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="bdcode">
                    <li><a href="#"><spring:message code="website.aboutBangladeshCode.text"/> </a></li>
                    <li class="active"><a href="#"><spring:message code="website.chronologicalIndex.text"/> </a></li>
                    <li><a href="#"><spring:message code="website.alphabiticalIndex.text"/> </a></li>
                </ul>
                <li>
                    <a href="${contextPath}/faq.html"><i class="fa fa-question-circle fa-lg"></i> <spring:message code="website.faq.text"/> </a>
                </li>
                <li>
                    <a href="${contextPath}/how-to-search.html"><i class="fa fa-search fa-lg"></i> <spring:message code="website.howToSearch.text"/> </a>
                </li>
                <li>
                    <a href="${contextPath}/how-to-print.html"><i class="fa fa-print fa-lg"></i> <spring:message code="website.howToPrint.text"/> </a>
                </li>
                <li>
                    <a href="?page=roman-numbers"><i class="fa fa-list-alt fa-lg"></i></i></i> <spring:message code="website.romanNumber.text"/> </a>
                </li>
                <li>
                    <a href="?page=glossary"><i class="fa fa-sort-alpha-asc fa-lg"></i></i> <spring:message code="website.glossary.text"/> </a>
                </li>
                <li>
                    <a href="?page=news-and-notice"><i class="fa fa-newspaper-o fa-lg"></i></i> <spring:message code="website.newsAndNotice.text"/> </a>
                </li>
                <li>
                    <a href="?page=feedback"><i class="fa fa-comments fa-lg"></i> <spring:message code="website.feedback.text"/> / <spring:message code="website.suggetion.text"/> </a>
                </li>
            </ul>
        </div>
    </div>
</div>