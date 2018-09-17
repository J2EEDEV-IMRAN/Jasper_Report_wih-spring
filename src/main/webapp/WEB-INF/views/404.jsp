<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404</title>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
	crossorigin="anonymous"></script>

<style type="text/css">
.error-template {
	padding: 40px 15px;
	text-align: center;
}

.error-actions {
	margin-top: 15px;
	margin-bottom: 15px;
}

.error-actions .btn {
	margin-right: 10px;
}

.error-page-1 {
	font-size: 100px;
	font-weight: bold;
	color: red;
}

.error-page-2 {
	font-size: 100px;
	font-weight: bold;
	color: red;
}

.error-page-3 {
	font-size: 20px;
	font-weight: bold;
	color: red;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="error-template">
					<h1 class="error-page-1">Oops!</h1>
					<h2 class="error-page-2">404 Not Found</h2>
					<div class="error-details error-page-3">Sorry, an error has
						occured, Requested page not found!</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							window
									.setTimeout(
											function() {
												location.href = "${contextPath}/";
											}, 1700);
						});
	</script>
</body>
</html>


