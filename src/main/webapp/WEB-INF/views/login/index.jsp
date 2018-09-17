<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title> Login Panel</title>

    <link href="${contextPath}/resources/admin/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/admin/assets/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script>
        function onSubmit(token) {
            document.getElementById("recaptchaForm").submit();
        }
    </script>

</head>

<body id="login">
    <div class="container">
        <div class="row">
            <div class="col-sm-offset-4 col-sm-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <jsp:include page="/WEB-INF/views/login/${page}.jsp"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /container -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${contextPath}/resources/admin/assets/bootstrap/js/bootstrap.min.js"></script>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', '<spring:eval expression="@propertyConfigurer.getProperty('ga.code')" />', 'auto');
        ga('send', 'pageview');

    </script>
</body>
</html>