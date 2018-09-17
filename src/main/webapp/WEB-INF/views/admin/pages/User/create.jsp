<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">User<span class="pull-right"><a href="#User/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="user" action="${contextPath}/admin/user${action}?" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
		    <spring:bind path="username">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputusername" class="col-sm-2 control-label">Username</label>
				    	<div class="col-sm-9">
				      		<form:input type="text" class="form-control" data-validation="trim|is_unique[users.username]|alpha_numeric|min_length[1]|max_length[50]" id="inputusername" path="username"  placeholder="Username"/>
				      		<form:errors path="username" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind> <spring:bind path="password">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpassword" class="col-sm-2 control-label">Password</label>
				    	<div class="col-sm-9">
				      		<form:input type="password" class="form-control" data-validation="trim|min_length[8]|max_length[20]|strong_password" id="inputpassword" path="password"  autocomplete="off" placeholder="Password"/>
				      		<form:errors path="password" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	
				  	<div class="form-group"  for="password" cssErrorClass="has-error">
				    	<label for="inputConfirmpassword" class="col-sm-2 control-label"> Confirm Password</label>
				    	<div class="col-sm-9">
				      		<input type="password" class="form-control" data-validation="trim|min_length[8]|max_length[20]|strong_password|matches[password]" id="inputConfirmpassword" name="Confirmpassword" autocomplete="off" placeholder="Password"/>
				      		<form:errors path="password" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="fullNameEnglish">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputfullNameEnglish" class="col-sm-2 control-label">Full Name English</label>
				    	<div class="col-sm-9">
				      		<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]" id="inputfullNameEnglish" path="fullNameEnglish"  placeholder="Full Name English"/>
				      		<form:errors path="fullNameEnglish" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="phone">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputphone" class="col-sm-2 control-label">Phone</label>
				    	<div class="col-sm-9">
				      		<form:input type="text" class="form-control" data-validation="trim|is_unique[users.Phone]|valid_bd_phone_no|min_length[1]|max_length[15]" id="inputphone" path="phone"  placeholder="Phone"/>
				      		<form:errors path="phone" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="email">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputemail" class="col-sm-2 control-label">Email</label>
				    	<div class="col-sm-9">
				      		<form:input type="email" class="form-control" data-validation="trim|is_unique[users.Email]|valid_email|min_length[1]|max_length[50]" id="inputemail" path="email"  placeholder="Email"/>
				      		<form:errors path="email" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind>

			<spring:bind path="isSuperUser">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
       	   	    	<label for="inputisSuperUser" class="col-sm-2 control-label">Is Super User</label>
				    	<div class="col-sm-9">
				    		<div class="checkbox-inline">
				      			<form:checkbox data-validation="trim|required|is_boolean" id="inputisSuperUser" path="isSuperUser"  value="1" /> Is Super User
				      			<form:errors path="isSuperUser" cssClass="help-block text-danger" element="span" />
							</div>
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="approved">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
       	   	    	<label for="inputapproved" class="col-sm-2 control-label">Approved</label>
				    	<div class="col-sm-9">
				    		<div class="checkbox-inline">
				      			<form:checkbox data-validation="trim|required|is_boolean" id="inputapproved" path="approved"  value="1" /> Approved
				      			<form:errors path="approved" cssClass="help-block text-danger" element="span" />
							</div>
				    	</div>
				  	</div>
				  	</spring:bind> <spring:bind path="passwordRecoveryCode">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputpasswordRecoveryCode" class="col-sm-2 control-label">Password Recovery Code</label>
				    	<div class="col-sm-9">
				      		<form:input type="password" class="form-control" data-validation="trim|min_length[8]|max_length[20]|strong_password" id="inputpasswordRecoveryCode" path="passwordRecoveryCode"  autocomplete="off" placeholder="Password Recovery Code"/>
				      		<form:errors path="passwordRecoveryCode" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	
				  	<div class="form-group"  for="passwordRecoveryCode" cssErrorClass="has-error">
				    	<label for="inputConfirmpasswordRecoveryCode" class="col-sm-2 control-label"> Confirm Password Recovery Code</label>
				    	<div class="col-sm-9">
				      		<input type="password" class="form-control" data-validation="trim|min_length[8]|max_length[20]|strong_password|matches[passwordRecoveryCode]" id="inputConfirmpasswordRecoveryCode" name="ConfirmpasswordRecoveryCode" autocomplete="off" placeholder="Password Recovery Code"/>
				      		<form:errors path="passwordRecoveryCode" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="isTemporaryPassword">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
       	   	    	<label for="inputisTemporaryPassword" class="col-sm-2 control-label">Is Temporary Password</label>
				    	<div class="col-sm-9">
				    		<div class="checkbox-inline">
				      			<form:checkbox data-validation="trim|required|is_boolean" id="inputisTemporaryPassword" path="isTemporaryPassword"  value="1" /> Is Temporary Password
				      			<form:errors path="isTemporaryPassword" cssClass="help-block text-danger" element="span" />
							</div>
				    	</div>
				  	</div>
				  	</spring:bind>
			<c:forEach var="item" items="${user.roles}">
				<c:set var="p" value="${p}${item.name}" />
			</c:forEach>
			<spring:bind path="roles">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputroles" class="col-sm-2 control-label">Roles</label>
					<div class="col-sm-9">
							<%--<form:select path="postTags"  id="inputpostTags" items="${postTagCache}" multiple="true" itemValue="id"  itemLabel="tagName" class="form-control input-sm" selected="true"${fn:contains(p, postTagCache.tagName) ? 'selected' : ''}/>--%>
						<select name="roles" id="inputroles" multiple>
							<c:forEach  items="${userRoleCache}" var="userRoleCache">
								<c:out value="${userRoleCache.name}"></c:out>
								<option  value="${userRoleCache.id}" ${fn:contains(p, userRoleCache.name) ? 'selected' : ''}>${userRoleCache.name}</option>
							</c:forEach>
						</select>
						<form:errors path="roles" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
		    <div class="form-group">
		        <div class="col-sm-offset-4 col-sm-5">
		            <button type="submit" class="btn btn-primary"> &nbsp; Save &nbsp; </button> &nbsp; &nbsp; 
		            <a href="#User/index" role="button" class="btn btn-warning">Cancel</a> 
		        </div>
		    </div>
		</form:form>
	</div>
</div>