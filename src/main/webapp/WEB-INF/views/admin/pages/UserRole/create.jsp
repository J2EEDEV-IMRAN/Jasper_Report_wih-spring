<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">User Role<span class="pull-right"><a href="#UserRole/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="userRole" action="${contextPath}/admin/userRole${action}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
		    <spring:bind path="userId.id">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputuserId.id" class="col-sm-2 control-label">User</label>
				    	<div class="col-sm-9">
				      		<form:select class="form-control"  data-selected="${userRole.userId.id}" data-itemLabel="username" data-itemValue="id" data-validation="trim|required|group_unique[user_role.user_id,role_id]|is_exist[users.id]|integer" path="userId.id" id="inputuserId.id">
    							<form:option value="0"> --SELECT--</form:option>
    							<form:options items="${userList}" itemLabel="username" itemValue="id"></form:options>
  							</form:select>
  							<form:errors path="userId.id" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="roleId.id">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputroleId.id" class="col-sm-2 control-label">Role</label>
				    	<div class="col-sm-9">
				      		<form:select class="form-control"  data-selected="${userRole.roleId.id}" data-itemLabel="name" data-itemValue="id" data-validation="trim|required|group_unique[user_role.user_id,role_id]|is_exist[role.id]|integer" path="roleId.id" id="inputroleId.id">
    							<form:option value="0"> --SELECT--</form:option>
    							<form:options items="${roleList}" itemLabel="name" itemValue="id"></form:options>
  							</form:select>
  							<form:errors path="roleId.id" cssClass="help-block text-danger" element="span" />
				    	</div>
				  	</div>
				  	</spring:bind>
		    <div class="form-group">
		        <div class="col-sm-offset-4 col-sm-5">
		            <button type="submit" class="btn btn-primary"> &nbsp; Save &nbsp; </button> &nbsp; &nbsp; 
		            <a href="#UserRole/index" role="button" class="btn btn-warning">Cancel</a> 
		        </div>
		    </div>
		</form:form>
	</div>
</div>