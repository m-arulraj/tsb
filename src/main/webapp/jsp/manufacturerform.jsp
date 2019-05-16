<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ADMIN')">

	<!-- Begin page content -->
	<main role="main" class="maincontainer">

	<div class="container-fluid data-container">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Manufacturer</h5>
				<h6 class="card-subtitle mb-2 text-muted">Product manufacturers
					listed here</h6>
				<section class="section">
					<div class="panel panel-default">
						<div class="table-responsive">
							<table class="table-striped table-hover">
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

									<c:forEach items="${manuLst}" var="manu">
										<tr>
											<td>${manu.manufacturerName}</td>
											<td>${manu.manufacturerDesc}</td>
											<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
													value="${manu.createdOn}" /></td>
											<td>${manu.createdBy}</td>
											<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
													value="${manu.modifiedOn}" /></td>
											<td>${manu.modifiedBy}</td>
											<td><spring:url
													value="/manufacturer/${manu.manufacturerId}" var="manuUrl" />
												<form:form role="form" id="listForm" class="form-horizontal"
													action="${manuUrl }" method="POST">
													<button class="btn btn-primary" name="Update">Update</button>
													<button class="btn btn-danger" name="Delete">Delete</button>
												</form:form></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</section>
				<section class="section">
					<div class="row sameheight-container">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="card inner-card">
								<div class="title-block">
									<h3 class="title">Add a new Manufacturer</h3>
								</div>
								<spring:url value="/manufacturer" var="manufacturerUrl" />
								<form:form role="form" class="form-horizontal" method="post"
									modelAttribute="manufacturer" action="${manufacturerUrl}">
									<spring:bind path="manufacturerName">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Name : </label>
											<div class="col-sm-9">
												<form:input path="manufacturerName" type="text"
													class="form-control " id="manufacturerName"
													placeholder="Manufacturer Name" />
												<form:errors path="manufacturerName"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="manufacturerDesc">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Description : </label>
											<div class="col-sm-9">
												<form:input path="manufacturerDesc" type="text"
													class="form-control " id="manufacturerDesc"
													placeholder="Type something about the manufacturer" />
												<form:errors path="manufacturerDesc"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-primary float-right">Add</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
						<div class="col-md-2"></div>
					</div>
				</section>
			</div>
		</div>
	</div>
	</main>
</sec:authorize>