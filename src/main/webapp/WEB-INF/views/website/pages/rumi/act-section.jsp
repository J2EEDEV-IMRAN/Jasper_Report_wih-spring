<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://ataur.me/jstl" prefix="ata" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>
<c:set var="footnoteNo" value="1" scope="page"/>
<div class="col-md-12 boxed-layout">
	<section class="bg-top">
		<div class="row">
			<div class="col-md-6 acts-top">
				<a class="pull-left" href="#"  onclick="window.history.back();return false;"><i class="fa fa-arrow-left" title="Back" aria-hidden="true"></i></a>
				&nbsp;
				<a href="${contextPath}/volume-${volume.id}.html">
					<spring:message code="website.actList.text"/>
				</a>
			</div>
			<div class=" acts-form col-md-6">
				<div class="input-group pull-right">
					<span class="collapse navbar-collapse">

					  <ul class="dropdown-list nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							  ${volume.volumeHead}
							  <span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
							   <li>
								   <a href="${contextPath}/chronological-index-acts.html">
										<spring:message code="website.chronologicalIndex.text"/>
								   </a>
							   </li>
							   <c:forEach var="vol" varStatus="loop" items="${volumes}">
								   <li><a href="${contextPath}/volume-${vol.volumeNumber}.html">${vol.volumeHead}</a></li>
							   </c:forEach>
							</ul>
						</li>
					  </ul>
                	</span>
				</div>
			</div>
		</div>
	</section>
	<section class="bg-act-section padding-bottom-20">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="text-center">
					<h3 >
						<c:choose>
							<c:when test="${empty act.shortTitleFootnoteList}">
								${act.shortTitle}
							</c:when>
							<c:otherwise>
								<c:set var="shortTitle" value="${act.shortTitle}"/>
								<c:forEach items="${act.shortTitleFootnoteList}" var="shortTitleFootnote">
									<c:set var="myFootnote">
										<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${shortTitleFootnote.footnote}"/>">
											<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
										</a>
									</c:set>

									<c:choose>
										<c:when test="${shortTitleFootnote.footnoteSign==null}">
											<c:set var="shortTitle" value="${myFootnote} ${shortTitle}"/>
										</c:when>
										<c:otherwise>
											<c:if test="${shortTitleFootnote.footnoteSign=='['}">
												<c:set var="myFootnote">${myFootnote}&#91;</c:set>
											</c:if>
											<c:set var="shortTitle" value="${ata:replaceFirst(shortTitle, shortTitleFootnote.footnoteSign,myFootnote)}"/>
										</c:otherwise>
									</c:choose>
									<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
								</c:forEach>
								${shortTitle}
							</c:otherwise>
						</c:choose>
					</h3>
					<h4> (
						<c:choose>
							<c:when test="${act.isBanglaAct==true}">

								${act.year} সনের ${act.number} নং
								<c:choose>
									<c:when test="${act.isOrdinance==true}">অধ্যাদেশ</c:when>
									<c:otherwise>আইন</c:otherwise>
								</c:choose>

							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${act.isOrdinance==true}">Ordinance</c:when>
									<c:otherwise>ACT</c:otherwise>
								</c:choose>
								NO. ${act.number} Of ${act.year}
							</c:otherwise>
						</c:choose>

						)
					</h4>
				</div>
			</div>
		</div>
	</section>
	<section class="bt-act-section-search">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<form class="form-inline part">
					<div class="form-group">
		  				<label>Part No :</label>
		  				<input class="form-control input-sm" name="" type="text">
					</div>
					<div class="form-group">
		  				<label>Chapter No :</label>
		  				<input class="form-control input-sm"  name="" type="text">
					</div>
					<div class="form-group">
		  				<label>Section No :</label>
		  				<input class="form-control input-sm"  name="" type="text">
					</div>
					<div class="form-group">
						<button class="btn btn-danger btn-u-sm" type="submit">Go</button>
					</div>
					<div class="form-group pull-right">
						<p>[ 4th June, 1984	]</p>
					</div>
				</form>
				<!-- <p class="pull-right">[ 4th June, 1984	]</p> -->
				
			</div>
		</div>
	</section>
	<section class="padding-bottom-20">
		<a class="btn btn-success pull-right" href="${contextPath}/act-details-${act.id}.html">Click Here To View Full Act</a>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<p>
					<strong>
						<c:choose>

							<c:when test="${empty act.actRoleFootnoteList}">
								${act.actRole}
							</c:when>
							<c:otherwise>
								<c:set var="actRole" value="${act.actRole}"/>
								<c:forEach items="${act.actRoleFootnoteList}" var="actRoleFootnote">

									<c:set var="myFootnote">
										<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${actRoleFootnote.footnote}"/>">
											<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
										</a></c:set>

									<c:choose>
										<c:when test="${actRoleFootnote.footnoteSign==null}">
											<c:set var="actRole" value="${myFootnote} ${actRole}"/>

										</c:when>
										<c:otherwise>
											<c:if test="${actRoleFootnote.footnoteSign=='['}">
												<c:set var="myFootnote">${myFootnote}&#91;</c:set>
											</c:if>
											<c:set var="actRole" value="${ata:replaceFirst(actRole, actRoleFootnote.footnoteSign,myFootnote)}"/>
										</c:otherwise>
									</c:choose>
									<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
								</c:forEach>
								${actRole}

							</c:otherwise>
						</c:choose>
					</strong>
				</p>


				<p>
					<c:choose>

						<c:when test="${empty act.preambleFootnoteList}">
							${act.preamble}
						</c:when>
						<c:otherwise>
							<c:set var="preamble" value="${act.preamble}"/>
							<c:forEach items="${act.preambleFootnoteList}" var="preambleFootnote">

								<c:set var="myFootnote">
									<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${preambleFootnote.footnote}"/>">
										<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
									</a>
								</c:set>

								<c:choose>
									<c:when test="${preambleFootnote.footnoteSign==null}">
										<c:set var="preamble" value="${myFootnote} ${preamble}"/>
									</c:when>
									<c:otherwise>
										<c:if test="${preambleFootnote.footnoteSign=='['}">
											<c:set var="myFootnote">${myFootnote}&#91;</c:set>
										</c:if>
										<c:set var="preamble" value="${ata:replaceFirst(preamble, preambleFootnote.footnoteSign,myFootnote)}"/>
									</c:otherwise>
								</c:choose>
								<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
							</c:forEach>
							${preamble}
						</c:otherwise>
					</c:choose>
				</p>
				<p class="content-head">
					<c:choose>
						<c:when test="${act.isBanglaAct==true}">
							সূচি
						</c:when>
						<c:otherwise>
							CONTENTS
						</c:otherwise>
					</c:choose>
				</p>
				<p class="section-head">
					<c:choose>
						<c:when test="${act.isBanglaAct==true}">
							ধারাসমূহ
						</c:when>
						<c:otherwise>
							SECTIONS
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
	</section>
	<section class="padding-bottom-20 padding-top-20">
		<div class="row">
			<c:set var="partId" value="0"/>
			<c:set var="chapterId" value="0"/>
			<c:forEach items="${sections}" var="section" varStatus="loop">

				<c:if test="${section.partId!= null && partId!=section.partId.id}">
					<div class="act-part-group">
						<c:if test="${ fn:trim(section.partId.partNo)!=''}">
							<p class="act-part-no">
								<c:set var="partNo" value="${section.partId.partNo}"/>
								<c:if test="${act.isBanglaAct==false}">
									<c:set var="partNo">
										<spring:message code="website.part.text"/> ${section.partId.partNo}
									</c:set>
								</c:if>

								<c:choose>

									<c:when test="${empty section.partId.partNoFootnoteList}">
										${partNo}
									</c:when>
									<c:otherwise>


										<c:forEach items="${section.partId.partNoFootnoteList}" var="partNoFootnote">

											<c:set var="myFootnote">
												<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${partNoFootnote.footnote}"/>">
													<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
												</a>
											</c:set>

											<c:choose>
												<c:when test="${partNoFootnote.footnoteSign==null}">
													<c:set var="partNo" value="${myFootnote} ${partNo}"/>
												</c:when>
												<c:otherwise>
													<c:if test="${partNoFootnote.footnoteSign=='['}">
														<c:set var="myFootnote">${myFootnote}&#91;</c:set>
													</c:if>
													<c:set var="partNo" value="${ata:replaceFirst(partNo, partNoFootnote.footnoteSign,myFootnote)}"/>
												</c:otherwise>
											</c:choose>
											<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
										</c:forEach>
										${partNo}
									</c:otherwise>
								</c:choose>
							</p>
						</c:if>
						<c:if test="${ fn:trim(section.partId.partName)!=''}">
							<p class="act-part-name">
								<c:set var="partName" value="${section.partId.partName}"/>
								<c:choose>

									<c:when test="${empty section.partId.partNameFootnoteList}">
										${partName}
									</c:when>
									<c:otherwise>


										<c:forEach items="${section.partId.partNameFootnoteList}" var="partNameFootnote">

											<c:set var="myFootnote">
												<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${partNameFootnote.footnote}"/>">
													<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
												</a>
											</c:set>

											<c:choose>
												<c:when test="${partNameFootnote.footnoteSign==null}">
													<c:set var="partName" value="${myFootnote} ${partName}"/>
												</c:when>
												<c:otherwise>
													<c:if test="${partNameFootnote.footnoteSign=='['}">
														<c:set var="myFootnote">${myFootnote}&#91;</c:set>
													</c:if>
													<c:set var="partName" value="${ata:replaceFirst(partName, partNameFootnote.footnoteSign,myFootnote)}"/>
												</c:otherwise>
											</c:choose>
											<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
										</c:forEach>
										${partName}
									</c:otherwise>
								</c:choose>
							</p>
						</c:if>
					</div>
				</c:if>

				<c:if test="${section.chapterId!=null && chapterId!=section.chapterId.id}">
					<div class="act-chapter-group">
						<c:if test="${fn:trim(section.chapterId.chapterNo)!=''}">
							<p class="act-chapter-no">

								<c:set var="chapterNo" value="${section.chapterId.chapterNo}"/>
								<c:if test="${act.isBanglaAct==false}">
									<c:set var="chapterNo">
										<spring:message code="website.chapter.text"/> ${section.chapterId.chapterNo}
									</c:set>
								</c:if>

								<c:choose>

									<c:when test="${empty section.chapterId.chapterNoFootnoteList}">
										${chapterNo}
									</c:when>
									<c:otherwise>


										<c:forEach items="${section.chapterId.chapterNoFootnoteList}" var="chapterNoFootnote">

											<c:set var="myFootnote">
												<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${chapterNoFootnote.footnote}"/>">
													<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
												</a>
											</c:set>

											<c:choose>
												<c:when test="${chapterNoFootnote.footnoteSign==null}">
													<c:set var="chapterNo" value="${myFootnote} ${chapterNo}"/>
												</c:when>
												<c:otherwise>
													<c:if test="${chapterNoFootnote.footnoteSign=='['}">
														<c:set var="myFootnote">${myFootnote}&#91;</c:set>
													</c:if>
													<c:set var="chapterNo" value="${ata:replaceFirst(chapterNo, chapterNoFootnote.footnoteSign,myFootnote)}"/>
												</c:otherwise>
											</c:choose>
											<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
										</c:forEach>
										${chapterNo}
									</c:otherwise>
								</c:choose>
							</p>
						</c:if>
						<c:if test="${fn:trim(section.chapterId.chapterName)!=''}">
							<p class="act-chapter-name">
								<c:set var="chapterName" value="${section.chapterId.chapterName}"/>
								<c:choose>

									<c:when test="${empty section.chapterId.chapterNameFootnoteList}">
										${chapterName}
									</c:when>
									<c:otherwise>


										<c:forEach items="${section.chapterId.chapterNameFootnoteList}" var="chapterNameFootnote">

											<c:set var="myFootnote">
												<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${chapterNameFootnote.footnote}"/>">
													<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
												</a>
											</c:set>

											<c:choose>
												<c:when test="${chapterNameFootnote.footnoteSign==null}">
													<c:set var="chapterName" value="${myFootnote} ${chapterName}"/>
												</c:when>
												<c:otherwise>
													<c:if test="${chapterNameFootnote.footnoteSign=='['}">
														<c:set var="myFootnote">${myFootnote}&#91;</c:set>
													</c:if>
													<c:set var="chapterName" value="${ata:replaceFirst(chapterName, chapterNameFootnote.footnoteSign,myFootnote)}"/>
												</c:otherwise>
											</c:choose>
											<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
										</c:forEach>
										${chapterName}
									</c:otherwise>
								</c:choose>
							</p>
						</c:if>
					</div>
				</c:if>

				<c:if test="${section.sectionHead!=null || fn:trim(section.sectionHead)!=''}">
					<p class="act-section-head">

						<c:choose>
							<c:when test="${empty section.sectionHeadFootnoteList}">
								${section.sectionHead}
							</c:when>
							<c:otherwise>
								<c:set var="sectionHead" value="${section.sectionHead}"/>
								<c:forEach items="${section.sectionHeadFootnoteList}" var="sectionHeadFootnote">
									<c:set var="myFootnote">
										<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${sectionHeadFootnote.footnote}"/>">
											<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
										</a>
									</c:set>

									<c:choose>
										<c:when test="${sectionHeadFootnote.footnoteSign==null}">
											<c:set var="sectionHead" value="${myFootnote} ${sectionHead}"/>
										</c:when>
										<c:otherwise>
											<c:if test="${sectionHeadFootnote.footnoteSign=='['}">
												<c:set var="myFootnote">${myFootnote}&#91;</c:set>
											</c:if>
											<c:set var="sectionHead" value="${ata:replaceFirst(sectionHead, sectionHeadFootnote.footnoteSign,myFootnote)}"/>
										</c:otherwise>
									</c:choose>
									<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
								</c:forEach>
								${sectionHead}
							</c:otherwise>
						</c:choose>
					</p>
				</c:if>

				<p class="act-section-name">
					<a href="${contextPath}/act-${section.actId.id}/section-${section.id}.html">
							<c:choose>
								<c:when test="${empty section.sectionNameFootnoteList}">
									${section.sectionName}
								</c:when>
								<c:otherwise>
									<c:set var="sectionName" value="${section.sectionName}"/>
									<c:forEach items="${section.sectionNameFootnoteList}" var="sectionNameFootnote">
										<c:set var="myFootnote">
											<a class="footnote" data-toggle="tooltip" href="#" title="<c:out value="${sectionNameFootnote.footnote}"/>">
												<sup class="${act.isBanglaAct==true? "bn":"en"}">${footnoteNo}</sup>
											</a>
										</c:set>

										<c:choose>
											<c:when test="${sectionNameFootnote.footnoteSign==null}">
												<c:set var="sectionName" value="${myFootnote} ${sectionName}"/>
											</c:when>
											<c:otherwise>
												<c:if test="${sectionNameFootnote.footnoteSign=='['}">
													<c:set var="myFootnote">${myFootnote}&#91;</c:set>
												</c:if>
												<c:set var="sectionName" value="${ata:replaceFirst(sectionName, sectionNameFootnote.footnoteSign,myFootnote)}"/>
											</c:otherwise>
										</c:choose>
										<c:set var="footnoteNo" value="${footnoteNo +1 }"/>
									</c:forEach>
									${sectionName}
								</c:otherwise>
							</c:choose>
					</a>
				</p>
				<c:if test="${section.partId!= null}">
					<c:set var="partId" value="${section.partId.id}"/>
				</c:if>
				<c:if test="${section.chapterId!= null}">
					<c:set var="chapterId" value="${section.chapterId.id}"/>
				</c:if>

			</c:forEach>
		</div>
	</section>
</div>