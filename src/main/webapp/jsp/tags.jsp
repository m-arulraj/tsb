<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//attach autocomplete
						$("#tagQuery")
								.autocomplete(
										{
											minLength : 1,
											delay : 500,
											//define callback to format results
											source : function(request, response) {
												$
														.getJSON(
																"/tsb/tags/get_tag_list",
																request,
																function(result) {
																	response($
																			.map(
																					result,
																					function(
																							item) {
																						return {
																							// following property gets displayed in drop down
																							label : item.name
																									+ "("
																									+ item.nrOfPodcasts
																									+ ")",
																							// following property gets entered in the textbox
																							value : item.name,
																							// following property is added for our own use
																							tag_url : "http://"
																									+ window.location.host
																									+ "/tags/"
																									+ item.tagId
																									+ "/"
																									+ item.name
																						}
																					}));
																});
											},

											//define select handler
											select : function(event, ui) {
												if (ui.item) {
													event.preventDefault();
													$("#selected_tags span")
															.html(
																	'<a href=' + ui.item.tag_url + ' target="_blank">'
																			+ ui.item.label
																			+ '</a>');
													$("#tagQuery").val(ui.item.value);
													$("#tagQuery").blur();
													return false;
												}
											}
										});
					});
</script>
</head>
<body>
	<div>
		<input name="tagQueryName" id="tagQuery" class=""
			placeholder="Type keyword...">
	</div>

	<div id="selected_tags">
		<span></span>
	</div>
	<div class="clear"></div>
</body>
</html>