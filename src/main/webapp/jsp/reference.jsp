<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url value="/resources/js/app.js" var="tsbAppJs" />
<!-- Reference block for JS -->
<div class="ref" id="ref">
	<div class="color-primary"></div>
	<div class="chart">
		<div class="color-primary"></div>
		<div class="color-secondary"></div>
	</div>
</div>
<script src="${tsbAppJs }"></script>
<input type="file" multiple="multiple" class="dz-hidden-input"
	style="visibility: hidden; position: absolute; top: 0px; left: 0px; height: 0px; width: 0px;">
<div class="responsive-bootstrap-toolkit">
	<div class="device-xs 				  hidden-sm-up"></div>
	<div class="device-sm hidden-xs-down hidden-md-up"></div>
	<div class="device-md hidden-sm-down hidden-lg-up"></div>
	<div class="device-lg hidden-md-down hidden-xl-up"></div>
	<div class="device-xl hidden-lg-down			  "></div>
</div>
<div class="jqvmap-label" style="display: none;"></div>
<div class="jqvmap-label" style="display: none;"></div>