<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">Post Tag<span class="pull-right"><a href="#PostTag/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="postTag" action="${contextPath}/admin/posttag${action}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
		    
       	        <spring:bind path="tagName">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputTagName" class="col-sm-2 control-label">Tag Name</label>
				    	<div class="col-sm-9">
							<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
										id="inputTagName" path="tagName" placeholder="Tag Name"/>
							<form:errors path="tagName" cssClass="help-block text-danger" element="span"/>
				    	</div>
				  	</div>
				 </spring:bind>
				<spring:bind path="description">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputDescription" class="col-sm-2 control-label">Description</label>
				    	<div class="col-sm-9">
							<form:textarea class="form-control richtext" data-validation="trim" id="inputDescription"
										   path="description" placeholder="Description"/>
							<form:errors path="description" cssClass="help-block text-danger" element="span"/>
				    	</div>
				  	</div>
				  	</spring:bind><spring:bind path="status">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
       	   	    	<label for="inputstatus" class="col-sm-2 control-label">Status</label>
				    	<div class="col-sm-9">
				    		<div class="checkbox-inline">
				      			<form:checkbox data-validation="trim|required|is_boolean" id="inputstatus" path="status"  value="1" /> Status
				      			<form:errors path="status" cssClass="help-block text-danger" element="span" />
							</div>
				    	</div>
				  	</div>
				  	</spring:bind>
		    <div class="form-group">
		        <div class="col-sm-offset-4 col-sm-5">
		            <button type="submit" class="btn btn-primary"> &nbsp; Save &nbsp; </button> &nbsp; &nbsp; 
		            <a href="#PostTag/index" role="button" class="btn btn-warning">Cancel</a>
		        </div>
		    </div>
		</form:form>
	</div>
</div>