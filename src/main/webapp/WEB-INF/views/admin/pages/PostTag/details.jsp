<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
	<!-- Default panel contents -->
	<div class="panel-heading text-center text-primary">Post Tag<span class="pull-right"><a href="#PostTag/edit/${postTag.id}" role="button"><i class="fa fa-arrow-right"></i> Edit</a></span>
		<span class="pull-left">
    	 <a href="#PostTag/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
	</div>
	<div class="panel-body table-responsive">
		<table class="table table-condensed">

			<tr class="">
				<th style="white-space: nowrap;">Category Name</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${postTag.tagName}</td>
			</tr>

			<tr class="active">
				<th style="white-space: nowrap;">Description</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${postTag.description}</td>
			</tr>

			<tr class="active">
				<th style="white-space: nowrap;">Status</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${postTag.status}</td>
			</tr>

			<tr class="">
				<th style="white-space: nowrap;">Created By</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${postTag.createdBy}</td>
			</tr>

			<tr class="">
				<th style="white-space: nowrap;width:1px;">Created At</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td><fmt:formatDate value="${postTag.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
			</tr>

			<tr class="active">
				<th style="white-space: nowrap;">Updated By</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${postTag.updatedBy}</td>
			</tr>

			<tr class="">
				<th style="white-space: nowrap;width:1px;">Updated At</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td><fmt:formatDate value="${postTag.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
			</tr>

		</table>
	</div>
</div>