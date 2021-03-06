<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="hasRole('ADMIN')">

	<main role="main" class="maincontainer">

	<div class="container-fluid data-container">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Stock</h5>
				<section class="section">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-8">
							<div class="card inner-card">
								<spring:url value="/stock" var="stockUrl" />
								<form:form role="form" class="form-horizontal" method="post"
									modelAttribute="stock" action="${stockUrl}">
									<spring:bind path="categoryId">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Category Name :
											</label>
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
									<spring:bind path="productId">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Product Name :
											</label>
											<div class="col-sm-9">
												<form:select path="productId" class="form-control">
													<form:option value="" label="--- Select ---" />
												</form:select>

												<form:errors path="productId"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="manufacturerId">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Manufacturer
												Name : </label>
											<div class="col-sm-9">
												<form:select path="manufacturerId" class="form-control">
													<form:option value="" label="--- Select ---" />
													<c:forEach items="${manuLst}" var="manu">
														<form:option value="${manu.manufacturerId}"
															label="${manu.manufacturerName}" />
													</c:forEach>
												</form:select>
												<form:errors path="manufacturerId"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="stockQuantity">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Quantity : </label>
											<div class="col-sm-9">
												<form:input path="stockQuantity" type="text"
													class="form-control " id="stockQuantity"
													placeholder="Total number of item(s)" />
												<form:errors path="stockQuantity"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="threshold">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Stock Threshold
												: </label>
											<div class="col-sm-9">
												<form:input path="threshold" type="number"
													class="form-control " id="threshold"
													placeholder="Threshold to alert the stock outage" />
												<form:errors path="threshold"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="mrpPerItem">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">MRP/Item : </label>
											<div class="col-sm-9">
												<form:input path="mrpPerItem" type="text"
													class="form-control " id="productDesc"
													placeholder="MRP per Item" />
												<form:errors path="mrpPerItem"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="gst">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">GST : </label>
											<div class="col-sm-9">
												<form:input path="gst" type="number" class="form-control "
													id="productDesc" placeholder="GST %" />
												<form:errors path="gst" class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>
									<spring:bind path="discountAllowed">
										<div class="form-group row ${status.error ? 'has-error' : ''}">
											<label class="col-sm-3 control-label">Discount
												allowed : </label>
											<div class="col-sm-9">
												<form:radiobutton path="discountAllowed" value="1" />
												Yes
												<form:radiobutton path="discountAllowed" value="0" />
												No
												<form:errors path="discountAllowed"
													class="control-label text-danger" />
											</div>
										</div>
									</spring:bind>

									<div class="form-group row">
										<div class="col-sm-offset-2 col-sm-5">
											<button type="submit" class="btn btn-primary float-left">Add</button>
										</div>
										<div class="col-sm-offset-2 col-sm-5">
											<button type="button" class="btn btn-secondary float-right">Clear</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
						<div class="col-md-1"></div>
					</div>
				</section>
			</div>
		</div>
	</div>
	</main>
</sec:authorize>
<spring:url value="/resources/js/dropdown.js" var="tsbDropDownJs" />
<script type="text/javascript" src="${tsbDropDownJs}"></script>
