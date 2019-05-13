<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%><header
	class="header">
	<div class="header-block header-block-collapse d-lg-none d-xl-none">
		<button class="collapse-btn" id="sidebar-collapse-btn">
			<i class="fa fa-bars"></i>
		</button>
	</div>

	<div class="header-block header-block-buttons">
		<span>View on GitHub</span>
	</div>
	<div class="header-block header-block-nav">
		<ul class="nav-profile">
			<li class="notifications new"><a href="#" data-toggle="dropdown">
					<i class="fa fa-bell-o"></i> <sup> <span class="counter">8</span>
				</sup>
			</a></li>
			<sec:authorize access="isAuthenticated()">
				<li class="profile dropdown"><a
					class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-user-circle"></i> <span class="name"> <sec:authentication property="name" />
					</span>
				</a>
					<div class="dropdown-menu profile-dropdown-menu"
						aria-labelledby="dropdownMenu1">
						<a class="dropdown-item" href="##"> <i class="fa fa-user icon"></i>
							Profile
						</a> <a class="dropdown-item" href="#"> <i class="fa fa-bell icon"></i>
							Notifications
						</a> <a class="dropdown-item" href="#"> <i class="fa fa-gear icon"></i>
							Settings
						</a>
						<div class="dropdown-divider"></div>
						<spring:url value="/logout" var="logoutUrl" />
						<a class="dropdown-item" href="${logoutUrl}"> <i
							class="fa fa-power-off icon"></i> Logout
						</a>
					</div></li>
			</sec:authorize>
		</ul>
	</div>
</header>