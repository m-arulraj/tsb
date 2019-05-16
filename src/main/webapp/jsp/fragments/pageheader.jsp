<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>:: The Enterprise Book ::</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
	
<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css" />	
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

<!-- Custom styles for this template -->
<spring:url value="/resources/css/app.css" var="tsbAppCss" />
<spring:url value="/resources/css/override.css" var="tsbOverrideCss" />
<spring:url value="/resources/css/table.css" var="tsbTableCss" />
<link href="${tsbOverrideCss }" rel="stylesheet">
<link href="${tsbAppCss }" rel="stylesheet">
<link href="${tsbTableCss }" rel="stylesheet">
</head>