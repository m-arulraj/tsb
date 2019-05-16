<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<spring:url value="/home" var="homeUrl" />
<spring:url value="/category" var="catUrl" />
<spring:url value="/manufacturer" var="manuUrl" />
<spring:url value="/product" var="prodUrl" />
<spring:url value="/stock" var="stockUrl" />
<spring:url value="/billing" var="billingUrl" />
<spring:url value="/bills" var="billsUrl" />
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
			<span class="navbar-toggler-icon"></span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<div class="collapse navbar-collapse flex-grow-1 text-right"
			id="navbarCollapse">
			<ul class="navbar-nav ml-auto flex-nowrap">

				<sec:authorize access="hasRole('ADMIN')">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-sitemap"></i> Master <i
							class="fa arrow"></i>
					</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#"> <i class="fas fa-users"></i>
								User
							</a><a class="dropdown-item" href="${catUrl}"> <i
								class="fas fa-book-open"></i> Category
							</a><a class="dropdown-item" href="${manuUrl }"> <i
								class="fas fa-industry"></i> Manufacturer
							</a><a class="dropdown-item" href="${prodUrl }"> <i
								class="fas fa-boxes"></i> Product
							</a><a class="dropdown-item" href="${stockUrl }"> <i
								class="fas fa-tag"></i> Stocks
							</a>
						</div></li>
				</sec:authorize>

				<sec:authorize access="hasRole('USER')">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="far fa-edit"></i> Billing <i
							class="fa arrow"></i>
					</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${billingUrl}"> <i
								class="fas fa-cart-plus"></i> Create Bill
							</a><a class="dropdown-item" href="${billsUrl}"> <i
								class="fas fa-tasks"></i> Manage Bills
							</a>
						</div></li>
				</sec:authorize>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-chart-pie"></i> Reports
						<i class="fa arrow"></i>
				</a>
					<div class="dropdown-menu">
						<sec:authorize access="hasRole('USER')">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-chart-line"></i> Sales
							</a>
							<sec:authorize access="hasRole('ADMIN')">
								<a class="dropdown-item" href="#"> <i
									class="fas fa-chart-bar"></i> Profit
								</a>
							</sec:authorize>
							<a class="dropdown-item" href="#"> <i class="fas fa-dolly"></i>
								Stocks
							</a>
						</sec:authorize>
					</div></li>

			</ul>
			<sec:authorize access="isAuthenticated()">
				<ul class="navbar-nav " style="border-left: 2px solid white;">
					<!-- PROFILE DROPDOWN - scrolling off the page to the right -->
					<li class="nav-item dropdown"><a href="#"
						class="nav-link dropdown-toggle" id="navDropDownLink"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-user-circle"></i> <span class="name"> <sec:authentication
									property="name" /></span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navDropDownLink">
							<a class="dropdown-item" href="#"> <i class="fa fa-user icon"></i>
								Profile
							</a> <a class="dropdown-item" href="#"> <i
								class="fa fa-bell icon"></i> Notifications
							</a> <a class="dropdown-item" href="#"> <i
								class="fas fa-cog icon"></i> Settings
							</a>
							<div class="dropdown-divider"></div>
							<spring:url value="/logout" var="logoutUrl" />
							<a class="dropdown-item" href="${logoutUrl}"> <i
								class="fa fa-power-off icon"></i> Logout
							</a>
						</div></li>
				</ul>
			</sec:authorize>
		</div>
	</nav>
</header>

