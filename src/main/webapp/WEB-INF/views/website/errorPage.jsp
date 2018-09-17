<%--
  Created by ataur
  Date: 1/16/17
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="" lang="${(lang == 'Bangla')? "bn": "en"}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="${(lang == 'Bangla')? "সেন্ট্রাল প্রকিউরমেন্ট টেকনিক্যাল ইউনিট": "Central Procurement Technical Unit"}">
    <meta name="author" content="${(lang == 'Bangla')? "সিপিটিইউ বাংলাদেশ": "CPTU Bangladesh"}">
    <title>${(lang == 'Bangla')? "সিপিটিইউ | সেন্ট্রাল প্রকিউরমেন্ট টেকনিক্যাল ইউনিট": "CPTU | Central Procurement Technical Unit"}</title>
    <jsp:include page="/WEB-INF/views/website/includes/css.jsp" />
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>

<body >

<div class="wrapper">
    <div class="header">
        <jsp:include page="/WEB-INF/views/website/includes/header.jsp" />
    </div>
</div>
<!-- search Box -->
<section class="margin-top-80">
    <jsp:include page="/WEB-INF/views/website/includes/search.jsp" />
</section>
<!-- End Serch Box -->

<section>
    <div class="container-fluid">
        <div class="row">
            <!-- Left Menu -->
            <div class="col-md-3">
                <ul class="list-group sidebar-nav-v1" id="sidebar-nav">
                    ${sidebar_menu}
                </ul>
            </div>
            <!-- End Left Menu -->
            <div class="col-md-9">
                <div class="content">
                    <div class="error-v1">
                        <span class="error-v1-title">404</span>
                        <span>That’s an error!</span>
                        <h3 class="text-danger">${errorMsg}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- footer top image -->
<section>
    <jsp:include page="/WEB-INF/views/website/includes/footer.jsp" />
</section>
<!-- End Footer -->

<jsp:include page="/WEB-INF/views/website/includes/script.jsp" />

</body>

</html>