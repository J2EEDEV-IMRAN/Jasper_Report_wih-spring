<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="col-md-5 col-md-offset-5">
    <div class="alert alert-danger text-center" role="alert">${error_message}</div>
    <div class="alert alert-success text-center" role="alert">${success_message}</div>
</div>
<form:form method="post" id="recaptchaForm" role="form" modelAttribute="password" action="${contextPath}/reset/${code}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
    <spring:bind path="newPassword">
        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
            <label for="newPasswordInput" class="col-sm-4 control-label">New Password</label>
            <div class="col-sm-5">
                <form:password path="newPassword" data-label="New Password" id="newPasswordInput" data-validation="required|min_length[8]|max_length[20]|strong_password"/>
                <form:errors path="newPassword" cssClass="help-block text-danger" element="span" />
            </div>
        </div>
    </spring:bind>
    <spring:bind path="confirmPassword">
        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
            <label for="confirmPasswordInput" class="col-sm-4 control-label">Confirm Password</label>
            <div class="col-sm-5">
                <form:password path="confirmPassword" data-label="Confirm Password" id="confirmPasswordInput" data-validation="required|min_length[8]|max_length[20]|strong_password|matches[newPassword]"/>
                <form:errors path="confirmPassword" cssClass="help-block text-danger" element="span" />
            </div>
            <span>${error}</span>
        </div>
    </spring:bind>

    <div class="form-group">
        <div class="col-sm-offset-4 col-sm-5">
            <button class="btn btn-lg btn-primary btn-block btn-primary-login-button g-recaptcha" data-sitekey="<spring:eval expression="@propertyConfigurer.getProperty('recaptcha.validation.siteKey')" />" data-callback='onSubmit' type="submit"> &nbsp; Change Password &nbsp; </button> &nbsp; &nbsp;
        </div>
    </div>
</form:form>
<div class="row">
    <div class="col-sm-6">
        <a class="btn btn-primary" role="button" href="${contextPath}/login">Back to Login</a>
    </div>
    <div class="col-sm-6">
        <a class="btn btn-danger" role="button" href="${contextPath}/forgot">Forgot Password?</a>
    </div>
</div>