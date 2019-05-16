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
			<h5 class="card-title">
				Bill information of # ${bill.billId } <font size="1.5">Created
					By: <b><i>${bill.createdBy }</i></b> and Generated On: <b><i><fmt:formatDate
								value="${bill.createdOn}" pattern="dd-MM-yyyy hh:mm:ss a" /></i></b>
				</font>
			</h5>
			<section class="example">
				<div class="row clearfix " style="margin-top: 10px">
					<div class=" col-md-12">
						<button type="submit" class="btn  btn-primary float-left"
							name="edit">Edit</button>
						<button type="submit" class="float-right btn  btn-info"
							name="print">Print</button>
					</div>
				</div>
				<div class="row" style="margin-top: 10px">
					<div class="col-md-12">
						<div class="table-responsive">
							<spring:url value="/bill/${bill.billId }" var="billUrl" />
							<form method="get" id="billsForm" action="${billUrl }">
								<table class="table-striped table-hover" id="tab_bill">
									<thead>
										<tr>
											<th class="text-center">#</th>
											<th class="text-center">Product</th>
											<th class="text-center">Qty</th>
											<th class="text-center">MRP</th>
											<th class="text-center">Tax</th>
											<th class="text-center">Base Amount</th>
											<th class="text-center">Tax Amount</th>
											<th class="text-center">Discount Amount</th>
											<th class="text-center">Total</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bill.items }" var="item" varStatus="loop">
											<tr id='addr0'>
												<td>${loop.index+1 }</td>
												<td>${item.stock.manufacturer.manufacturerName}-
													${item.stock.product.productName} -
													${item.stock.category.categoryName}</td>
												<td>${item.quantity}</td>
												<td class="text-right"><fmt:formatNumber type="number"
														groupingUsed="true" minFractionDigits="2"
														maxFractionDigits="2" value="${item.mrp}" /></td>
												<td class="text-right"><fmt:formatNumber type="number"
														minFractionDigits="2" maxFractionDigits="2"
														value="${item.tax}" /> %</td>
												<td class="text-right"><fmt:formatNumber type="number"
														groupingUsed="true" minFractionDigits="2"
														maxFractionDigits="2" value="${item.baseAmout}" /></td>
												<td class="text-right"><fmt:formatNumber type="number"
														groupingUsed="true" minFractionDigits="2"
														maxFractionDigits="2" value="${item.taxAmount}" /></td>
												<td class="text-right"><fmt:formatNumber type="number"
														groupingUsed="true" minFractionDigits="2"
														maxFractionDigits="2" value="${item.discount}" /></td>
												<td class="text-right"><fmt:formatNumber type="number"
														groupingUsed="true" minFractionDigits="2"
														maxFractionDigits="2" value="${item.amount}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div class="row " style="margin-top: 20px">
					<div class=" col-md-6"></div>
					<div class=" col-md-6">
						<table class="table-hover" id="tab_logic_total">
							<tbody>
								<tr>
									<td class="text-center">Base Amount Total</td>
									<td class="text-right"><fmt:formatNumber type="number"
											groupingUsed="true" minFractionDigits="2"
											maxFractionDigits="2" value="${bill.totalBaseAmout}" /></td>
								</tr>
								<tr>
									<td class="text-center">Tax Amount Total</td>
									<td class="text-right"><fmt:formatNumber type="number"
											groupingUsed="true" minFractionDigits="2"
											maxFractionDigits="2" value="${bill.totalTaxAmount}" /></td>
								</tr>
								<tr>
									<td class="text-center">Discount Total</td>
									<td class="text-right"><fmt:formatNumber type="number"
											groupingUsed="true" minFractionDigits="2"
											maxFractionDigits="2" value="${bill.totalDiscountAmount}" /></td>
								</tr>
								<tr class="bg-grey">
									<td class="text-center">Grand Total</td>
									<td class="text-right"><fmt:formatNumber type="number"
											groupingUsed="true" minFractionDigits="2"
											maxFractionDigits="2" value="${bill.totalAmount}" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row clearfix " style="margin-top: 10px">
					<div class=" col-md-12">
						<button type="submit" class="btn  btn-primary float-left"
							name="edit">Edit</button>
						<button type="submit" class="btn  btn-info float-right"
							name="print">Print</button>
					</div>
				</div>

			</section>
		</div>
	</div>
</div>
</main>

<spring:url value="/resources/js/billing.js" var="tsbBillingJs" />
<script type="text/javascript" src="${tsbBillingJs}"></script>