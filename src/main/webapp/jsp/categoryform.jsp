<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ADMIN')">

	<article class="content forms-page">
		<div class="title-block">
			<h1 class="title">Category</h1>
			<p class="title-description">Product categories listed here</p>
		</div>
		<section class="section">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-block">
							<section class="example">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>Name</th>
												<th>Description</th>
												<th>Added On</th>
												<th>Added By</th>
												<th>Updated On</th>
												<th>Updated By</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody>

											<c:forEach items="${catLst}" var="cat">
												<tr>
													<td>${cat.categoryName}</td>
													<td>${cat.categoryDesc}</td>
													<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
															value="${cat.createdOn}" /></td>
													<td>${cat.createdBy}</td>
													<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
															value="${cat.modifiedOn}" /></td>
													<td>${cat.modifiedBy}</td>
													<td><spring:url value="/category/${cat.categoryId}"
															var="catUrl" /> <form:form role="form" id="listForm"
															class="form-horizontal" action="${catUrl }" method="POST">
															<button class="btn btn-primary" name="Update">Update</button>
															<button class="btn btn-danger" name="Delete">Delete</button>
														</form:form></td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section">
			<div class="row sameheight-container">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="card card-block sameheight-item" style="height: 713px;">
						<div class="title-block">
							<h3 class="title">Add a new Category</h3>
						</div>
						<spring:url value="/category" var="categoryUrl" />
						<form:form role="form" class="form-horizontal" method="post"
							modelAttribute="category" action="${categoryUrl}">
							<spring:bind path="categoryName">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<label class="col-sm-3 control-label">Name : </label>
									<div class="col-sm-9">
										<form:input path="categoryName" type="text"
											class="form-control " id="categoryName"
											placeholder="Category Name" />
										<form:errors path="categoryName"
											class="control-label text-danger" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="categoryDesc">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<label class="col-sm-3 control-label">Description : </label>
									<div class="col-sm-9">
										<form:input path="categoryDesc" type="text"
											class="form-control " id="categoryDesc"
											placeholder="Type something about the category" />
										<form:errors path="categoryDesc"
											class="control-label text-danger" />
									</div>
								</div>
							</spring:bind>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn-lg btn-primary pull-right">Add</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</section>
	</article>
</sec:authorize>