<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<main role="main" class="maincontainer">
<div class="container-fluid data-container">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">Billing</h5>
			<c:if test="${not empty bill }">
				<h6 class="card-subtitle">
					<font size="1.5">Bill information of # ${bill.billId }
						Created By: <b><i>${bill.createdBy }</i></b> and Generated On: <b><i><fmt:formatDate
									value="${bill.createdOn}" pattern="dd-MM-yyyy hh:mm:ss a" /></i></b>
					</font>
				</h6>
			</c:if>
			<spring:url value="/billing" var="billingUrl" />
			<form method="post" action="${billingUrl }">
				<section class="section">
					<div class="row">
						<div class="col-md-5">
							<button id="add_row" name="add_row" type="button"
								class="btn btn-oval btn-primary float-left">Add Row</button>
							<button id='delete_row' name="delete_row" type="button"
								class="float-right btn btn-oval btn-secondary">Delete
								Row</button>
						</div>
						<div class=" col-md-2">
							<c:if test="${empty bill }">
								<input type="hidden" name="billId" id="billId" value="" />
							</c:if>
							<c:if test="${not empty bill }">
								<input type="hidden" name="billId" id="billId"
									value="${bill.billId }" />
							</c:if>
						</div>
						<div class=" col-md-5">
							<button type="submit" class="btn btn-oval btn-primary float-left"
								name="Save">Save</button>
							<button type="submit" class="float-right btn btn-oval btn-info"
								name="Save_Print">Save &amp; Print</button>
						</div>
					</div>
				</section>

				<section class="example">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive">
								<table class="table-striped  table-hover" id="tab_logic">
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
										<c:if test="${empty bill }">
											<tr id='addr0'>
												<td><div id="id" class="id">1</div> <input type="radio"
													id="rowId" class="form-control rowId"
													style="display: inline;" value="1" /></td>
												<td><input type="text" name='stock'
													placeholder='Enter Product Name' class="form-control stock"
													autofocus id="stock" /> <input type="hidden"
													name='stockId' placeholder='0.00' class="form-control "
													readonly id="stockId" /></td>
												<td><input type="number" name='qty'
													placeholder='Enter Qty' class="form-control qty" step="0"
													min="0" /></td>
												<td><input type="number" name='price'
													placeholder='Enter Unit Price' class="form-control price"
													step="0.00" min="0" id="price" readonly /></td>
												<td><div class="input-group">
														<input type="number" name='tax' class="form-control tax"
															id="tax" placeholder="0" readonly>
														<div class="input-group-addon">%</div>
													</div></td>
												<td><div id="baseprice_dis" class="baseprice_dis"></div>
													<input type="hidden" name='baseprice' placeholder='0.00'
													class="form-control baseprice" readonly /></td>
												<td><div id="taxprice_dis" class="taxprice_dis"></div>
													<input type="hidden" name='taxprice' placeholder='0.00'
													class="form-control taxprice" readonly /></td>
												<td><input type="number" name='discountprice'
													value='0.00' placeholder='0.00'
													class="form-control discountprice" /></td>
												<td><div id="total_dis" class="total_dis"></div> <input
													type="hidden" name='total' placeholder='0.00'
													class="form-control total" readonly /></td>
											</tr>
											<tr id='addr1'></tr>
										</c:if>
										<c:if test="${not empty bill }">
											<c:forEach items="${bill.items }" var="item" varStatus="loop">
												<tr id='addr${loop.index}'>
													<td><div id="id" class="id">${loop.index+1 }</div> <input
														type="radio" id="rowId" name="rowId"
														class="form-control rowId" value="${loop.index+1 }" /></td>
													<td><input type="text" name='stock'
														placeholder='Enter Product Name'
														class="form-control stock" autofocus id="stock"
														value="${item.stock.manufacturer.manufacturerName} - ${item.stock.product.productName} - ${item.stock.category.categoryName}" />
														<input type="hidden" name='stockId' placeholder='0.00'
														class="form-control " readonly id="stockId"
														value="${item.stock.stockId}" /></td>
													<td><input type="number" name='qty'
														placeholder='Enter Qty' class="form-control qty" step="0"
														min="0"
														value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="0" maxFractionDigits="0" value="${item.quantity}" />" /></td>
													<td><input type="number" name='price'
														placeholder='Enter Unit Price' class="form-control price"
														step="0.00" min="0" id="price" readonly
														value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${item.mrp}" />" /></td>
													<td><div class="input-group">
															<input type="number" name='tax' class="form-control tax"
																id="tax" placeholder="0" readonly
																value="<fmt:formatNumber type="number"  minFractionDigits="2" maxFractionDigits="2" value="${item.tax}" />">
															<div class="input-group-addon">%</div>
														</div></td>
													<td><div id="baseprice_dis" class="baseprice_dis">
															<fmt:formatNumber type="number" groupingUsed="true"
																minFractionDigits="2" maxFractionDigits="2"
																value="${item.baseAmout}" />
														</div> <input type="hidden" name='baseprice' placeholder='0.00'
														class="form-control baseprice" readonly
														value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${item.baseAmout}" />" /></td>
													<td><div id="taxprice_dis" class="taxprice_dis">
															<fmt:formatNumber type="number" groupingUsed="true"
																minFractionDigits="2" maxFractionDigits="2"
																value="${item.taxAmount}" />
														</div> <input type="hidden" name='taxprice' placeholder='0.00'
														class="form-control taxprice" readonly
														value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${item.taxAmount}" />" /></td>
													<td><input type="number" name='discountprice'
														value='0.00' placeholder='0.00'
														<c:if test="${not item.stock.discountAllowed}"> style="display: none;"</c:if>
														class="form-control discountprice"
														value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${item.discount}" />" /></td>
													<td><div id="total_dis" class="total_dis">
															<fmt:formatNumber type="number" groupingUsed="true"
																minFractionDigits="2" maxFractionDigits="2"
																value="${item.amount}" />
														</div> <input type="hidden" name='total' placeholder='0.00'
														class="form-control total" readonly
														value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${item.amount}" />" /></td>
												</tr>
											</c:forEach>
											<tr id='addr${fn:length(bill.items)}'></tr>
										</c:if>

									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="row clearfix " style="margin-top: 20px">
						<div class=" col-md-6"></div>
						<div class=" col-md-6">
							<table class="table-hover" id="tab_logic_total">
								<tbody>
									<c:if test="${empty bill }">
										<tr>
											<td class="text-center">Base Amount Total</td>
											<td class="text-center"><div id="sub_total_dis"
													class="sub_total_dis"></div> <input type="hidden"
												name='sub_total' placeholder='0.00' class="form-control"
												id="sub_total" readonly /></td>
										</tr>
										<tr>
											<td class="text-center">Tax Amount Total</td>
											<td class="text-center"><div id="tax_amount_dis"
													class="tax_amount_dis"></div> <input type="hidden"
												name='tax_amount' id="tax_amount" placeholder='0.00'
												class="form-control" readonly /></td>
										</tr>
										<tr>
											<td class="text-center">Discount Total</td>
											<td class="text-center"><div id="discount_amount_dis"
													class="discount_amount_dis"></div> <input type="hidden"
												name='discount_amount' id="discount_amount" value='0.00'
												placeholder='0.00' class="form-control" readonly /></td>
										</tr>
										<tr>
											<td class="text-center">Grand Total</td>
											<td class="text-center"><div id="total_amount_dis"
													class="total_amount_dis"></div> <input type="hidden"
												name='total_amount' id="total_amount" placeholder='0.00'
												class="form-control" readonly /></td>
										</tr>
									</c:if>
									<c:if test="${not empty bill }">
										<tr>
											<td class="text-center">Base Amount Total</td>
											<td class="text-center"><div id="sub_total_dis"
													class="sub_total_dis">
													<fmt:formatNumber type="number" groupingUsed="true"
														minFractionDigits="2" maxFractionDigits="2"
														value="${bill.totalBaseAmout}" />
												</div> <input type="hidden" name='sub_total' placeholder='0.00'
												class="form-control" id="sub_total" readonly
												value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${bill.totalBaseAmout}" />" /></td>
										</tr>
										<tr>
											<td class="text-center">Tax Amount Total</td>
											<td class="text-center"><div id="tax_amount_dis"
													class="tax_amount_dis">
													<fmt:formatNumber type="number" groupingUsed="true"
														minFractionDigits="2" maxFractionDigits="2"
														value="${bill.totalTaxAmount}" />
												</div> <input type="hidden" name='tax_amount' id="tax_amount"
												placeholder='0.00' class="form-control" readonly
												value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${bill.totalTaxAmount}" />" /></td>
										</tr>
										<tr>
											<td class="text-center">Discount Total</td>
											<td class="text-center"><div id="discount_amount_dis"
													class="discount_amount_dis">
													<fmt:formatNumber type="number" groupingUsed="true"
														minFractionDigits="2" maxFractionDigits="2"
														value="${bill.totalDiscountAmount}" />
												</div> <input type="hidden" name='discount_amount'
												id="discount_amount" value='0.00' placeholder='0.00'
												class="form-control" readonly
												value="<fmt:formatNumber type="number"  groupingUsed="true" minFractionDigits="2" maxFractionDigits="2" value="${bill.totalDiscountAmount}" />" /></td>
										</tr>
										<tr>
											<td class="text-center">Grand Total</td>
											<td class="text-center"><div id="total_amount_dis"
													class="total_amount_dis">
													<fmt:formatNumber type="number" groupingUsed="true"
														minFractionDigits="2" maxFractionDigits="2"
														value="${bill.totalAmount}" />
												</div> <input type="hidden" name='total_amount' id="total_amount"
												placeholder='0.00' class="form-control" readonly
												value="<fmt:formatNumber type="number"  groupingUsed="true"  minFractionDigits="2" maxFractionDigits="2" value="${bill.totalAmount}" />" /></td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row clearfix " style="margin-top: 10px">
						<div class="col-md-5">
							<button id="add_row" name="add_row" type="button"
								class="btn btn-oval btn-primary float-left">Add Row</button>
							<button id='delete_row' name="delete_row" type="button"
								class="float-right btn btn-oval btn-secondary">Delete
								Row</button>
						</div>
						<div class=" col-md-2"></div>
						<div class=" col-md-5">
							<button type="submit" class="btn btn-oval btn-primary float-left"
								name="Save">Save</button>
							<button type="submit" class="float-right btn btn-oval btn-info"
								name="Save_Print">Save &amp; Print</button>
						</div>
					</div>
				</section>

			</form>
		</div>
	</div>
</div>
</main>
<spring:url value="/resources/js/billing.js" var="tsbBillingJs" />
<script type="text/javascript" src="${tsbBillingJs}"></script>