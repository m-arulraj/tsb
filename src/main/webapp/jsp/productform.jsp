<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ADMIN')">

	<article class="content forms-page">
		<section class="section">
			<div class="row sameheight-container">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="card card-block sameheight-item" style="height: 713px;">
						<div class="title-block">
							<h3 class="title">Add a new Product</h3>
						</div>
						<spring:url value="/product" var="productUrl" />
						<form:form role="form" class="form-horizontal" method="post"
							modelAttribute="product" action="${productUrl}">
							<spring:bind path="categoryId">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<label class="col-sm-3 control-label">Category Name : </label>
									<div class="col-sm-9">
										<form:select path="categoryId" class="form-control">
											<form:option value="" label="--- Select ---" />
											<c:forEach items="${catLst}" var="cat">
												<form:option value="${cat.categoryId}"
													label="${cat.categoryName}" />
											</c:forEach>
										</form:select>

										<form:errors path="categoryId"
											class="control-label text-danger" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="productName">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<label class="col-sm-3 control-label">Name : </label>
									<div class="col-sm-9">
										<form:input path="productName" type="text"
											class="form-control " id="productName"
											placeholder="Product Name" />
										<form:errors path="productName"
											class="control-label text-danger" />
									</div>
								</div>
							</spring:bind>
							<spring:bind path="productDesc">
								<div class="form-group row ${status.error ? 'has-error' : ''}">
									<label class="col-sm-3 control-label">Description : </label>
									<div class="col-sm-9">
										<form:input path="productDesc" type="text"
											class="form-control " id="productDesc"
											placeholder="Type something about the product" />
										<form:errors path="productDesc"
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
		<section class="section">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-block">
							<div class="title-block">
								<h3 class="title">Product List</h3>
							</div>
							<section class="example">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>Category Name</th>
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

											<c:forEach items="${prodLst}" var="prod">
												<tr>
													<td>${prod.category.categoryName}</td>
													<td>${prod.productName}</td>
													<td>${prod.productDesc}</td>
													<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
															value="${prod.createdOn}" /></td>
													<td>${prod.createdBy}</td>
													<td><fmt:formatDate pattern="dd-MM-yyyy hh:mm:ss a"
															value="${prod.modifiedOn}" /></td>
													<td>${prod.modifiedBy}</td>
													<td><spring:url value="/product/${prod.productId}"
															var="prodUrl" /> <form:form role="form" id="listForm"
															class="form-horizontal" action="${prodUrl }"
															method="POST">
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

	</article>
</sec:authorize>