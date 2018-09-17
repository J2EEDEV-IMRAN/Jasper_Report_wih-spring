<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading text-center text-primary">User<span class="pull-right"><a href="#User/edit/${id}" role="button"><i class="fa fa-arrow-right"></i> Edit</a></span>
    <span class="pull-left">
    	 <a href="#User/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a>
    </span>
    </div>
    <div class="panel-body table-responsive">
        <table class="table table-condensed">
            
					<tr class="">
					<th style="white-space: nowrap;">Username</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.username}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Full Name English</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.fullNameEnglish}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Full Name Bangla</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.fullNameBangla}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Designation English</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.designationEnglish}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Designation Bangla</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.designationBangla}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Phone</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.phone}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Email</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.email}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Is Super User</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.isSuperUser}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Approved</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.approved}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Password Recovery Code</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.passwordRecoveryCode}</td>
					</tr>
				
					<tr class="">
					<th style="white-space: nowrap;">Is Temporary Password</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.isTemporaryPassword}</td>
					</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Created By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.createdBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Created At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${user.createdAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
					<tr class="active">
					<th style="white-space: nowrap;">Updated By</th>
					<th style="white-space:nowrap;width:1px;"> : </th>
					<td>${user.updatedBy}</td>
					</tr>
				
    				<tr class="">
    				<th style="white-space: nowrap;width:1px;">Updated At</th>
    				<th style="white-space:nowrap;width:1px;"> : </th>
    				<td><fmt:formatDate value="${user.updatedAt}" pattern="dd/MM/yyyy hh:mm a" /></td>
    				</tr>
				
        </table>
	</div>
</div>