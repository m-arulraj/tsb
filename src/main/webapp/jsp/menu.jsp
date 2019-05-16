<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<aside class="sidebar">
	<div class="sidebar-container">
		<div class="sidebar-header">
			<div class="brand">
				<div class="logo">
					<span class="l l1"></span> <span class="l l2"></span> <span
						class="l l3"></span> <span class="l l4"></span> <span class="l l5"></span>
				</div>
				The Stock Book
			</div>
		</div>
		<spring:url value="/home" var="homeUrl" />
		<spring:url value="/category" var="catUrl" />
		<spring:url value="/manufacturer" var="manuUrl" />
		<spring:url value="/product" var="prodUrl" />
		<spring:url value="/stock" var="stockUrl" />
		<spring:url value="/billing" var="billingUrl" />
		<spring:url value="/bills" var="billsUrl" />
		<nav class="menu">
			<ul class="sidebar-menu metismenu" id="sidebar-menu">
				<li class="active"><a href="${homeUrl}"> <i
						class="fa fa-home"></i> Home
				</a></li>
				<sec:authorize access="hasRole('ADMIN')">
					<li><a href=""> <i class="fas fa-sitemap"></i> Master <i
							class="fa arrow"></i>
					</a>
						<ul class="sidebar-nav collapse" aria-expanded="false">
							<li><a href="#"> <i class="fas fa-users"></i> User
							</a></li>
							<li><a href="${catUrl}"> <i class="fas fa-book-open"></i>
									Category
							</a></li>
							<li><a href="${manuUrl }"> <i class="fas fa-industry"></i>Manufacturer
							</a></li>
							<li><a href="${prodUrl }"> <i class="fas fa-boxes"></i>
									Product
							</a></li>
							<li><a href="${stockUrl }"> <i class="fas fa-tag"></i>
									Stocks
							</a></li>

						</ul></li>
				</sec:authorize>

				<sec:authorize access="hasRole('USER')">
					<li><a href=""> <i class="far fa-edit"></i> Billing <i
							class="fa arrow"></i>
					</a>
						<ul class="sidebar-nav collapse" aria-expanded="false">
							<li><a href="${billingUrl}"> <i class="fas fa-cart-plus"></i>
									Create Bill
							</a></li>
							<li><a href="${billsUrl}"> <i class="fas fa-tasks"></i>
									Manage Bills
							</a></li>
						</ul></li>
				</sec:authorize>

				<li><a href="#"> <i class="fas fa-chart-pie"></i> Reports <i
						class="fa arrow"></i>
				</a>
					<ul class="sidebar-nav collapse" aria-expanded="false">
						<sec:authorize access="hasRole('USER')">
							<li><a href="#"> <i class="fas fa-chart-line"></i> Sales
							</a></li>
							<sec:authorize access="hasRole('ADMIN')">
								<li><a href="#"> <i class="fas fa-chart-bar"></i>
										Profit
								</a></li>
							</sec:authorize>
							<li><a href="#"> <i class="fas fa-dolly"></i> Stocks
							</a></li>
						</sec:authorize>

					</ul></li>

			</ul>
		</nav>
	</div>

</aside>
<div class="sidebar-overlay" id="sidebar-overlay"></div>
<div class="sidebar-mobile-menu-handle" id="sidebar-mobile-menu-handle"></div>
<div class="mobile-menu-handle"></div>