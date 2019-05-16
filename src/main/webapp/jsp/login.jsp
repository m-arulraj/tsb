<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
<jsp:include page="fragments/pageheader.jsp" flush="true"></jsp:include>
</head>
<body class="loaded">
	<jsp:include page="fragments/header.jsp" flush="true"></jsp:include>
	<!-- Begin page content -->
	<main role="main" class="maincontainer">

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-12">
				<div class="auth">
					<div class="auth-container">
						<div class="card ">
							<div class="auth-content">
								<p class="text-center">Login To Continue</p>
								<form id="login-form" action="login" method='post'
									novalidate="novalidate">
									<div class="form-group">
										<label for="username">Username</label> <input type="email"
											class="form-control underlined" name="username" id="username"
											placeholder="Your email address" required="">
									</div>
									<div class="form-group">
										<label for="password">Password</label> <input type="password"
											class="form-control underlined" name="password" id="password"
											placeholder="Your password" required="">
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">Login</button>
									</div>
									<div class="form-group float-right">
										<p class="text-muted text-center">
											<a href="reset.html" class="forgot-btn  color-blue">Forgot
												password?</a>
										</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>



			</div>

		</div>
	</div>


	</main>
	<jsp:include page="fragments/footer.jsp" flush="true"></jsp:include>
</body>
</html>