<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="panel panel-success">
    <!-- Default panel contents -->
    <div class="panel-heading  text-center text-primary">Post<span class="pull-right"><a href="#Post/index" role="button"> <i class="fa fa-history" aria-hidden="true"></i>
Back to List</a></span></div>
    <div class="panel-body">
		<form:form method="post" role="form" modelAttribute="post" action="${contextPath}/admin/post${action}?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" data-validation="true" data-ajax-submit="true" novalidate="novalidate">
			<spring:bind path="postCategory.id">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputpostcategory.id" class="col-sm-2 control-label">Category</label>
					<div class="col-sm-9" style="width: 973px;">
						<form:select class="form-control selectpicker" data-selected="${post.postCategory.id}"
									 data-itemLabel="postCategory"
									 data-live-search="true" data-itemValue="id"
									 data-validation="trim|is_exist[PostCategory.id]|integer"
									 path="postCategory.id" id="inputpostcategory.id">
							<form:option value="0"> --SELECT--</form:option>
							<form:options items="${categoryList}" itemLabel="categoryName" itemValue="id"></form:options>
						</form:select>
						<form:errors path="postCategory.id" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="number">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputnumber" class="col-sm-2 control-label">Post Number</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
									id="inputnumber" path="number" placeholder="Post Number"/>
						<form:errors path="number" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="orderNo">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputOrderNo" class="col-sm-2 control-label">Post Number</label>
					<div class="col-sm-9">
						<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
									id="inputOrderNo" path="orderNo" placeholder="Order No"/>
						<form:errors path="orderNo" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="postTitle">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputPostTitle" class="col-sm-2 control-label">Post Title</label>
					<div class="col-sm-9">
						<form:textarea class="form-control richtext" data-validation="trim" id="inputPostTitle"
									   path="postTitle" placeholder="Post Title"/>
						<form:errors path="postTitle" cssClass="help-block text-danger" element="span"/>
					</div>
				</div>
			</spring:bind>
				<spring:bind path="post">
       	        <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
				    	<label for="inputPost" class="col-sm-2 control-label">Post</label>
				    	<div class="col-sm-9">
							<form:textarea class="form-control richtext" data-validation="trim" id="inputPost"
										   path="post" placeholder="Post"/>
							<form:errors path="post" cssClass="help-block text-danger" element="span"/>
				    	</div>
				  	</div>
				  	</spring:bind>

			<c:forEach var="item" items="${post.postTags}">
				<c:set var="p" value="${p}${item.tagName}" />
			</c:forEach>
			<%--<c:out value="${p}"></c:out>--%>
            <spring:bind path="postTags">
                <div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
                    <label for="inputpostTags" class="col-sm-2 control-label">Post Tags</label>
                    <div class="col-sm-9">
						<%--<form:select path="postTags"  id="inputpostTags" items="${postTagCache}" multiple="true" itemValue="id"  itemLabel="tagName" class="form-control input-sm" selected="true"${fn:contains(p, postTagCache.tagName) ? 'selected' : ''}/>--%>
							<select name="postTags" id="inputpostTags" multiple>
								<c:forEach  items="${postTagCache}" var="postTagCache">
									<c:out value="${postTagCache.tagName}"></c:out>
									<option  value="${postTagCache.id}" ${fn:contains(p, postTagCache.tagName) ? 'selected' : ''}>${postTagCache.tagName}</option>
								</c:forEach>
							</select>
                        <form:errors path="postTags" cssClass="help-block text-danger" element="span"/>
                    </div>
                </div>
            </spring:bind>




            <%--		<jsp:include page="/WEB-INF/views/admin/pages/Post/includes/postTags.jsp"/>--%>

			<%--<spring:bind path="postTags">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputPostTags" class="col-sm-2 control-label">Post Tag</label>
					<div class="col-sm-9">
						<div class="checkbox-inline">
						&lt;%&ndash;	<form:checkboxes  items="${postTags}" data-validation="trim|required|is_boolean" id="inputPostTags" path="postTags" itemLabel="tagName"  itemValue="id"/>&ndash;%&gt;
							<c:forEach items="${postTags}"
									   var="tag" varStatus="status">
								<tr>
									<td>${tag.tagName}</td>
									<td><form:checkbox
											path="tag[${status.index}].selected" /></td>
								</tr>
							</c:forEach>
							<form:errors path="postTags" cssClass="help-block text-danger" element="span" />
						</div>
					</div>
				</div>
			</spring:bind>--%>
			<spring:bind path="postImage">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputPostImage" class="col-sm-2 control-label">Post Image</label>
					<div class="col-sm-9">
						<label class="btn btn-default btn-file">
							Browse <input type="file" class="form-control"
										  data-validation="trim|file_allowed_type[jpeg,jpg,png,doc,docx,pdf,ppt,pptx,csv,xls,xls,zip,mp3,mp4,flv]|min_length[1]|max_length[255]"
										  id="inputPostImage" name="postImageFile"
										  placeholder="Post Image" multiple/>

						</label>
						<form:errors path="postImage" cssClass="help-block text-danger" element="span"/>

					</div>
				</div>
			</spring:bind>

		<spring:bind path="publishDate">
		<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
			<label for="inputpublishDate" class="col-sm-2 control-label">Publish Date</label>
			<div class="col-sm-9">
				<form:input type="text" class="form-control" data-validation="trim|min_length[1]|max_length[255]"
							id="inputpublishDate" path="publishDate" placeholder="Publish Date"/>
				<form:errors path="publishDate" cssClass="help-block text-danger" element="span"/>
			</div>
		</div>
	</spring:bind>
			<spring:bind path="isBanglaPost">
				<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
					<label for="inputIsBanglaPost" class="col-sm-2 control-label">Is Bangla Post</label>
					<div class="col-sm-9">
						<div class="checkbox-inline">
							<form:checkbox data-validation="trim|required|is_boolean" id="inputIsBanglaPost" path="isBanglaPost"  value="1" /> Status
							<form:errors path="isBanglaPost" cssClass="help-block text-danger" element="span" />
						</div>
					</div>
				</div>
			</spring:bind>
			<spring:bind path="status">
       	        	<div class="form-group ${(not empty status.errorMessage) ? ' has-error':''}">
       	   	    	<label for="inputstatus" class="col-sm-2 control-label">Status</label>
				    	<div class="col-sm-9">
				    		<div class="checkbox-inline">
				      			<form:checkbox data-validation="trim|required|is_boolean" id="inputstatus" path="status"  value="1" /> Is Bangla Post
				      			<form:errors path="status" cssClass="help-block text-danger" element="span" />
							</div>
				    	</div>
				  	</div>
				  	</spring:bind>
		    <div class="form-group">
		        <div class="col-sm-offset-4 col-sm-5">
		            <button type="submit" class="btn btn-primary"> &nbsp; Save &nbsp; </button> &nbsp; &nbsp; 
		            <a href="#Post/index" role="button" class="btn btn-warning">Cancel</a>
		        </div>
		    </div>
		</form:form>
	</div>
</div>