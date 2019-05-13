$(document).ready(
		function() {
			$("[name=discountprice]:last").hide();
			$("[name=stock]").each(function(index) {
				enableAutoComplete($(this));
			});
			$("[name=add_row]").each(function(index) {
				addbutton($(this));
			});
			$("[name=delete_row]").each(function(index) {
				deletebutton($(this));
			});
			
			

			$('#tab_logic tbody').on('keyup change', function() {
				calc();
				
			});
			$('#tax').on('keyup change', function() {
				calc_total();
			});

		});

function addbutton($element){
	var i = 1;
	$element.click(
			function() {
				b = i - 1;
				$('#addr' + i).html($('#addr' + b).html()).find(
						'td:first-child').html(i + 1);
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.baseprice_dis').text('');
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.taxprice_dis').text('');
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.total_dis').text('');

				$('#addr' + i).html($('#addr' + i).html()).find(
						'.baseprice').val('0.0');
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.taxprice').val('0.0');
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.total').val('0.0');
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.stock').focus();
				$('#tab_logic').append(
						'<tr id="addr' + (i + 1) + '"></tr>');
				i++;
				enableAutoComplete($("[name=stock]:last"));
				$('#addr' + i).html($('#addr' + i).html()).find(
						'.stock').focus();
				$("[name=discountprice]:last").hide();
			});
}

function deletebutton($element){
	$element.click(function() {
		if (i > 1) {
			$("#addr" + (i - 1)).html('');
			i--;
		}
		calc();
	});
}


function calc() {
	$('#tab_logic tbody tr')
			.each(
					function(i, element) {
						var html = $(this).html();

						if (html != '') {
							var qty = $(this).find('.qty').val();
							var price = $(this).find('.price').val();
							var tax = $(this).find('.tax').val();
							var discountprice= $(this).find('.discountprice').val();
							var totalAmount = parseInt(qty * price);

							var taxAmt = totalAmount
									- (totalAmount * (100 / (100 + parseInt(tax))));
							var baseAmt = totalAmount - taxAmt.toFixed(2);
							var totalDis = parseFloat(baseAmt.toFixed(2)) - parseFloat(discountprice) + parseFloat(taxAmt.toFixed(2));

							if (!isNaN(taxAmt)) {
								$(this).find('.taxprice_dis').text(taxAmt.toFixed(2));
								$(this).find('.taxprice').val(taxAmt.toFixed(2));
								$(this).find('.baseprice_dis').text(baseAmt.toFixed(2));
								$(this).find('.baseprice').val(baseAmt.toFixed(2));
								$(this).find('.total_dis').text(totalDis);
								$(this).find('.total').val(totalDis);
								calc_total();
							}

						}
					});
}

function defaulVal() {

	$(this).find('.taxprice_dis').text('0.0'.toFixed(2));
	$(this).find('.taxprice').val('0.0'.toFixed(2));

	$(this).find('.baseprice_dis').text('0.0'.toFixed(2));
	$(this).find('.baseprice').val('0.0'.toFixed(2));

	$(this).find('.total_dis').text('0.0'.toFixed(2));
	$(this).find('.total').val('0.0'.toFixed(2));
}

function calc_total() {
	total = 0;
	$('.total').each(function() {
		total += parseFloat($(this).val());
	});
	basetotal = 0;
	$('.baseprice').each(function() {
		basetotal += parseFloat($(this).val());
	});
	tax_sum = 0;
	$('.taxprice').each(function() {
		tax_sum += parseFloat($(this).val());
	});
	discount=0;
	$('.discountprice').each(function(){
		discount +=  parseFloat($(this).val());
	});
	$('#sub_total_dis').text(basetotal.toFixed(2));
	$('#tax_amount_dis').text(tax_sum.toFixed(2));
	$('#total_amount_dis').text(total.toFixed(2));
	$('#discount_amount_dis').text(discount.toFixed(2));
	$('#discount_amount').val(discount.toFixed(2));
	$('#sub_total').val(basetotal.toFixed(2));
	$('#tax_amount').val(tax_sum.toFixed(2));
	$('#total_amount').val(total.toFixed(2));
}

function enableAutoComplete($element) {
	console.log($element.attr('name'));
	$element.autocomplete({
		minLength : 1,
		delay : 500,
		source : function(request, response) {
			$.getJSON("/tsb/stock/products", request, function(result) {
				response($.map(result, function(item) {
					console.log(item.manufacturer.manufacturerName + " - "
							+ item.product.productName + " - "
							+ item.category.categoryName);
					return {
						label : item.manufacturer.manufacturerName + " - "
								+ item.product.productName + " - "
								+ item.category.categoryName,
						value : item.stockId,
						taxAmt : item.gst,
						mrp : item.mrpPerItem,
						discount : item.discountAllowed
					}
				}));
			});
		},

		// define select handler
		select : function(event, ui) {
			if (ui.item) {
				event.preventDefault();
				$("[name=stock]:last").val(ui.item.label);
				$("[name=stockId]:last").val(ui.item.value);
				$("[name=tax]:last").val(ui.item.taxAmt);
				$("[name=price]:last").val(ui.item.mrp);
				if (ui.item.discount == true || ui.item.discount == 'true') {
					$("[name=discountprice]:last").show();
				}
				return false;
			}
		}
	});
}


$(document).ready(function () {
	$('#tab_bills').DataTable();
	$('.dataTables_length').addClass('bs-select');
	});