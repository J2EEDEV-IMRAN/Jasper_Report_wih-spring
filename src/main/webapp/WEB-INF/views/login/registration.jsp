<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<form:form method="POST" modelAttribute="loginForm" class="form-signin">
    <h2 class="form-signin-heading">Create your account</h2>
    <spring:bind path="username">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <form:input type="text" path="username" class="form-control" placeholder="Username"
                        autofocus="true"></form:input>
            <form:errors path="username"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="password">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
            <form:errors path="password"></form:errors>
        </div>
    </spring:bind>

    <spring:bind path="passwordConfirm">
        <div class="form-group ${status.error ? 'has-error' : ''}">
            <form:input type="password" path="passwordConfirm" class="form-control"
                        placeholder="Confirm your password"></form:input>
            <form:errors path="passwordConfirm"></form:errors>
        </div>
    </spring:bind>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-6">
            <div class="g-recaptcha" data-sitekey="<spring:eval expression="@propertyConfigurer.getProperty('recaptcha.validation.siteKey')" />"></div>
        </div>
    </div>

    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
</form:form>

<div class="row">
    <div class="col-sm-6">
        <a class="btn btn-primary" role="button" href="${contextPath}/login">Back to Login</a>
    </div>
    <div class="col-sm-6">
        <a class="btn btn-danger" role="button" href="${contextPath}/forgot">Forgot Password?</a>
    </div>
</div>