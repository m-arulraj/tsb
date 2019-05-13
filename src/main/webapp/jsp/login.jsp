<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html class="no-js" lang="en">
<head>
<jsp:include page="pageheader.jsp" flush="true"></jsp:include>
</head>
<body class="loaded login-bg">
	<div class="container-fluid h-100 ">
		<div class="row justify-content-center ">
			<div class="col-md-12 align-items-center hidden-md-down ">
				<div class="text-center">
					<h4 class="card-title-text">A smarter way to maintain your
						inventory and billing!!!</h4>
				</div>
			</div>
		</div>
		<div class="row justify-content-center h-100 ">
			<div class="col-md-7 align-items-center hidden-md-down ">
				<div
					class="card shadow-none  bg-transparent  justify-content-center">
					<div class="card-header bg-transparent "></div>

					<div class="card-body bg-transparent">
						<spring:url value="/resources/img/inventory-management-system.png"
							var="imgInventoryCss" />
						<img alt="" src="${imgInventoryCss}"
							class="img-fluid rounded mx-auto d-block">
					</div>
				</div>
			</div>
			<div class="col-md-5 hidden-md-down" id="yellow">
				<div class="auth">
					<div class="auth-container">
						<div class="card border rounded">
							<header class="auth-header">
								<h1 class="auth-title">
									<div class="logo">
										<span class="l l1"></span> <span class="l l2"></span> <span
											class="l l3"></span> <span class="l l4"></span> <span
											class="l l5"></span>
									</div>
									The Stock Book
								</h1>
							</header>
							<div class="auth-content">
								<p class="text-center">LOGIN TO CONTINUE</p>
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
										<label for="remember"> <input class="checkbox"
											id="remember" type="checkbox"> <span>Remember
												me</span>
										</label> <a href="reset.html" class="forgot-btn pull-right">Forgot
											password?</a>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-block btn-primary">Login</button>
									</div>
									<div class="form-group">
										<p class="text-muted text-center">
											Do not have an account? <a href="signup.html">Sign Up!</a>
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

	<jsp:include page="reference.jsp" flush="true"></jsp:include>


</body>
</html>