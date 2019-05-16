<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<main role="main" class="maincontainer">
<div class="container-fluid data-container">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Bills</h5>
			<section class="example">
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive">
							<form method="get" id="billsForm">
								<table class="table-striped table-hover"
									id="tab_bills">
									<thead>
										<tr>
											<th class="text-center">#</th>
											<th class="text-center">Bill Id</th>
											<th class="text-center">Billed On</th>
											<th class="text-center">Total Amount</th>
											<th class="text-center">Billed By</th>
											<th class="text-center">Actions</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bills }" var="bill" varStatus="loop">
											<tr id='addr0'>
												<td>${loop.index+1 }</td>
												<td>${bill.billId}</td>
												<td><fmt:formatDate value="${bill.createdOn}"
														pattern="dd-MM-yyyy hh:mm:ss" /></td>
												<td>${bill.totalAmount}</td>
												<td>${bill.createdBy}</td>
												<td><spring:url value="/bill/${bill.billId}"
														var="billingUrl" />
													<button id="add-btn"
														class="btn btn-oval btn-primary float-left" name="view"
														onclick='this.form.action="${billingUrl}"'>View</button>
													<button id='delete-btn' class="btn btn-oval btn-warning"
														name="edit" onclick='this.form.action="${billingUrl}"'>Edit</button>
													<button id='print-btn' class="btn btn-oval btn-info"
														name="print" onclick='this.form.action="${billingUrl}"'>Print</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
</main>
<spring:url value="/resources/js/billing.js" var="tsbBillingJs" />
<script type="text/javascript" src="${tsbBillingJs}"></script>