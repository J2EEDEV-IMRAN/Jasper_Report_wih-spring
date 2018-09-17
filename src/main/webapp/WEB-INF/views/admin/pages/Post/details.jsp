<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">Post<span class="pull-right"><a href="#Post/edit/${post.id}" role="button"><i class="fa fa-arrow-right"></i> Edit</a></span>
    <span class="pull-left">
    	 <a href="#Post/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Post Category</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${post.postCategory.categoryName}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Post Number</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${post.number}</td>
					</tr>

					<tr class="active">
					<th style="white-space: nowrap;">Post Order</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${post.orderNo}</td>
					</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Post Title</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${post.postTitle}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Post</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${post.post}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Post Tag</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td><c:forEach items="${post.postTags}" var="current">
					[<c:out value="${current}" />]
				</c:forEach></td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Post Publish Date</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${post.publishDate}</td>
			</tr>
			<tr class="active">
				<th style="white-space: nowrap;">Is Bangla Post</th>
				<th style="white-space:nowrap;width:1px;"> : </th>
				<td>${post.isBanglaPost}</td>
			</tr>

					<tr class="">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${post.createdBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${post.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${post.updatedBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${post.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
        </table>
	</div>
</div>