<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<form method="POST" id="recaptchaForm" modelAttribute="loginForm" action="${contextPath}/forgot" class="form-signin">
    <fieldset>
        <div class="row">
            <div class="center-block">
                <img class="profile-img" src="${contextPath}/resources/website/assets/img/logo.png" class="img-responsive" alt=""/>
                <span>Laws of Bangladesh</span></div>
            <hr>
        </div>

        <div class="row">
            <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                <div class="form-group ${error != null ? 'has-error' : ''}">
                    <div class="input-group">
                                    <span class="input-group-addon">
                                        <i class="glyphicon glyphicon-user"></i>
                                    </span>
                        <input name="username" type="text" class="form-control" placeholder="Username"
                               autofocus="true"/>
                    </div>
                    <span>${error}</span>
                </div>

                <span>${message}</span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <button class="btn btn-lg btn-primary btn-block btn-primary-login-button g-recaptcha" data-sitekey="<spring:eval expression="@propertyConfigurer.getProperty('recaptcha.validation.siteKey')" />" data-callback='onSubmit' type="submit">Send Reset Email</button>

            </div>
        </div>
    </fieldset>

</form>
<div class="row">
    <div class="col-sm-6">
        <%--<a class="btn btn-primary" role="button" href="${contextPath}/registration">Create Account</a>--%>
    </div>
    <div class="col-sm-6">
        <a style="color:#fff !important;" href="${contextPath}/login">Back to Login</a>
    </div>
</div>