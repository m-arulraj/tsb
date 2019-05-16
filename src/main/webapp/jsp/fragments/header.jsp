<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="tsbHomeUrl" />
<header>
	<!-- Fixed navbar -->
	<nav class="navbar mr-auto navbar-expand-md  navbar-light fixed-top ">
		<div class="brand">
			<div class="logo">
				<span class="l l1"></span> <span class="l l2"></span> <span
					class="l l3"></span> <span class="l l4"></span> <span class="l l5"></span>
			</div>
			<a href="${tsbHomeUrl}" class="color-white">The Enterprise Book</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse flex-grow-1 text-right"
			id="navbarCollapse">
			<ul class="navbar-nav ml-auto flex-nowrap">
				<spring:url value="/login" var="loginUrl" />
				<li class="nav-item"><a class="nav-link" href="#about">ABOUT</a></li>
				<li class="nav-item"><a class="nav-link" href="#services">SERVICES</a></li>
				<li class="nav-item"><a class="nav-link" href="#story">TESTIMONIALS</a></li>
				<li class="nav-item"><a class="nav-link" href="#contact">CONTACT</a></li>
				<li class="nav-item"><a class="nav-link" href="${loginUrl }">LOGIN</a></li>
			</ul>

		</div>
	</nav>
</header>

