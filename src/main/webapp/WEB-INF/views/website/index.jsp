
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<!DOCTYPE html>
<html lang="${pageContext.response.locale}">
    <head>
        <jsp:include page="/WEB-INF/views/website/includes/meta.jsp" />
        <jsp:include page="/WEB-INF/views/website/includes/css.jsp" />        
    </head>
    <body>
        <jsp:include page="/WEB-INF/views/website/includes/top-header.jsp" />
        <jsp:include page="/WEB-INF/views/website/includes/header.jsp" />
        <!-- Main Body Container -->
        <div class="container">
            <div class="row">
                <!-- Left Sidebar -->
                <%--<jsp:include page="/WEB-INF/views/website/includes/leftbar.jsp" />--%>
                <!-- End Left sidebar -->
                <!--body Containd -->
                <jsp:include page="/WEB-INF/views/website/pages/${page}.jsp" />

                <!--/. End Body -->
                <!-- Right Sidebar -->
                <%--<jsp:include page="/WEB-INF/views/website/includes/rightbar.jsp" />--%>
                <!-- /.End Right Sidebar -->
            </div>
        </div><!--/.End Main Body Container -->
        <jsp:include page="/WEB-INF/views/website/includes/footer.jsp" />
        <jsp:include page="/WEB-INF/views/website/includes/script.jsp" />
    </body>
</html>