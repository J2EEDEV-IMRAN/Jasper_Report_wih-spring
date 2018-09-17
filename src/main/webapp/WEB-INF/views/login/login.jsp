<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<form method="POST" id="recaptchaForm" action="${contextPath}/doLogin" class="form-signin">
    <fieldset>
        <div class="row">
            <div class="center-block">
                <img class="profile-img" src="${contextPath}/resources/website/assets/img/logo.png"
                     class="img-responsive" alt="">
                <span>MY PERSONAL BLOG</span>
            </div>
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
                </div>
                <div class="form-group ${error != null ? 'has-error' : ''}">
                    <div class="input-group"><span class="input-group-addon"> <i class="glyphicon glyphicon-lock"></i> </span>
                        <input name="password" type="password" class="form-control" placeholder="Password"/>
                    </div>
                    <span>${error}</span>
                </div>
                <span>${message}</span>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <button class="btn btn-lg btn-primary btn-block button_login g-recaptcha"
                        data-sitekey="<spring:eval expression="@propertyConfigurer.getProperty('recaptcha.validation.siteKey')" />"
                        data-callback='onSubmit' type="submit">Log In
                </button>
            </div>
        </div>
        <div class="row">
            <div class="pull-right">
                <h5 class="forget"><a href="">Forget your Password ?</a></h5>
            </div>
        </div>
    </fieldset>
</form>
