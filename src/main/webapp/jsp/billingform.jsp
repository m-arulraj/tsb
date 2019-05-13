<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<article class="content forms-page">
	<section class="section">
		<spring:url value="/billing" var="billingUrl" />
		<form method="post" action="${billingUrl }">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-block">
							<div class="card-title-block">
								<div class="row">
									<div class="col-md-5">
										<button id="add_row" name="add_row" type="button"
											class="btn btn-oval btn-primary pull-left">Add Row</button>
										<button id='delete_row' name="delete_row" type="button"
											class="pull-right btn btn-oval btn-secondary">Delete
											Row</button>
									</div>
									<div class=" col-md-2"></div>
									<div class=" col-md-5">
										<button type="submit"
											class="btn btn-oval btn-primary pull-left" name="Save">Save
										</button>
										<button type="submit" class="pull-right btn btn-oval btn-info"
											name="Save_Print">Save & Print</button>
									</div>
								</div>
							</div>
							<section class="example">
								<div class="row">
									<div class="col-md-12">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover"
												id="tab_logic">

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
													<tr id='addr0'>
														<td>1</td>
														<td><input type="text" name='stock'
															placeholder='Enter Product Name'
															class="form-control stock" autofocus id="stock" /> <input
															type="hidden" name='stockId' placeholder='0.00'
															class="form-control " readonly id="stockId" /></td>
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
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="row clearfix " style="margin-top: 20px">
									<div class=" col-md-4"></div>
									<div class=" col-md-8">
										<table class="table table-bordered table-hover"
											id="tab_logic_total">
											<tbody>
												<tr>
													<th class="text-center">Base Amount Total</th>
													<td class="text-center"><div id="sub_total_dis"
															class="sub_total_dis"></div> <input type="hidden"
														name='sub_total' placeholder='0.00' class="form-control"
														id="sub_total" readonly /></td>
												</tr>
												<tr>
													<th class="text-center">Tax Amount Total</th>
													<td class="text-center"><div id="tax_amount_dis"
															class="tax_amount_dis"></div> <input type="hidden"
														name='tax_amount' id="tax_amount" placeholder='0.00'
														class="form-control" readonly /></td>
												</tr>
												<tr>
													<th class="text-center">Discount Total</th>
													<td class="text-center"><div id="discount_amount_dis"
															class="discount_amount_dis"></div> <input type="hidden"
														name='discount_amount' id="discount_amount" value='0.00'
														placeholder='0.00' class="form-control" readonly /></td>
												</tr>
												<tr>
													<th class="text-center">Grand Total</th>
													<td class="text-center"><div id="total_amount_dis"
															class="total_amount_dis"></div> <input type="hidden"
														name='total_amount' id="total_amount" placeholder='0.00'
														class="form-control" readonly /></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row clearfix " style="margin-top: 10px">
									<div class="col-md-5">
										<button id="add_row" name="add_row" type="button"
											class="btn btn-oval btn-primary pull-left">Add Row</button>
										<button id='delete_row' name="delete_row" type="button"
											class="pull-right btn btn-oval btn-secondary">Delete
											Row</button>
									</div>
									<div class=" col-md-2"></div>
									<div class=" col-md-5">
										<button type="submit"
											class="btn btn-oval btn-primary pull-left" name="Save">Save
										</button>
										<button type="submit" class="pull-right btn btn-oval btn-info"
											name="Save_Print">Save & Print</button>
									</div>
								</div>
							</section>

						</div>
					</div>
				</div>
			</div>
		</form>
	</section>
</article>
<spring:url value="/resources/js/billing.js" var="tsbBillingJs" />
<script type="text/javascript" src="${tsbBillingJs}"></script>