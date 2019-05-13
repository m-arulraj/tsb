<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<jsp:include page="pageheader.jsp" flush="true"></jsp:include>
</head>
<body class="loaded">
	<div class="main-wrapper">
		<div class="app" id="app">
			<jsp:include page="header.jsp" flush="true"></jsp:include>
			<jsp:include page="sidebar.jsp" flush="true"></jsp:include>
			<jsp:include page="categoryform.jsp" flush="true"></jsp:include>
			<jsp:include page="footer.jsp" flush="true"></jsp:include>
		</div>
	</div>
	<jsp:include page="reference.jsp" flush="true"></jsp:include>
</body>
</html>