<%@page import="hcmute.entity.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// Retrieve the cart list from the session
List<Cart> carts = (List<Cart>) session.getAttribute("cart");

// Set the size of the cart list using JSTL
pageContext.setAttribute("cartSize", carts != null ? carts.size() : 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

</head>
<body>
	<nav class="navbar navbar-expand-lg shadow-lg header-fixed">
		<div class="container px-0">
			<a class="navbar-brand" href="/Ielts-listening2/user/home"><img
				src="../assets/final.png" alt="Geeks" style=" width: 100%; height: 26px;object-fit: cover; object-position: center;" /></a>
			<div class="d-flex align-items-center order-lg-3 gap-3">

				<div class="d-flex align-items-center">
					<div class="dropdown me-2">
						<button
							class="btn btn-light btn-icon rounded-circle d-flex align-items-center"
							type="button" aria-expanded="false" data-bs-toggle="dropdown"
							aria-label="Toggle theme (auto)">
							<i class="bi theme-icon-active"></i> <span
								class="visually-hidden bs-theme-text">Toggle theme</span>
						</button>
						<ul class="dropdown-menu dropdown-menu-end shadow"
							aria-labelledby="bs-theme-text">
							<li>
								<button type="button"
									class="dropdown-item d-flex align-items-center"
									data-bs-theme-value="light" aria-pressed="false">
									<i class="bi theme-icon bi-sun-fill"></i> <span class="ms-2">Light</span>
								</button>
							</li>
							<li>
								<button type="button"
									class="dropdown-item d-flex align-items-center"
									data-bs-theme-value="dark" aria-pressed="false">
									<i class="bi theme-icon bi-moon-stars-fill"></i> <span
										class="ms-2">Dark</span>
								</button>
							</li>

						</ul>
					</div>
					<c:if test="${user == null}">
						<div class="d-none d-md-block me-2">
							<a href="<c:url value='/authentication-login' />"
								class="btn btn-primary">Đăng nhập</a>
						</div>
					</c:if>
					<c:if test="${user != null}">
						<a style="margin-right: 8px"
							href="/Ielts-listening2/user/mycart?userId=${user.userId}"
							class="btn btn-light btn-icon rounded-circle d-flex align-items-center position-relative">
							<i class="fe fe-shopping-cart"></i> <span
							style="z-index: 2; background-color: white; top: -4px; right: -8px; width: 24px; height: 24px; padding; 2; border-radius: 100%;"
							class="position-absolute text-primary border ">${cartSize}</span>

						</a>
						<li class="dropdown ms-2 d-inline-block position-static"><a
							class="rounded-circle" href="#" data-bs-toggle="dropdown"
							data-bs-display="static" aria-expanded="false">
								<div class="avatar avatar-md avatar-indicators avatar-online">


									<c:if test="${user.image != null}">
										<img
											src='<c:url value='/image?fname=userAvatar/${user.image}'/>'
											class="avatar-xl rounded-circle border border-4 border-white"
											alt="avatar" />
									</c:if>
									<c:if test="${user.image == null}">
										<img class="rounded-circle"
											src='<c:url value = "https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"/>'
											alt="anh dai dien">
									</c:if>

								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-end position-absolute mx-3 my-5">
								<div class="mx-4">
									<div class="d-flex">
										<div class="avatar avatar-md avatar-indicators avatar-online">
											<c:if test="${user.image != null}">
												<img
													src='<c:url value='/image?fname=userAvatar/${user.image}'/>'
													class="avatar-xl rounded-circle border border-4 border-white"
													alt="avatar" />
											</c:if>
											<c:if test="${user.image == null}">
												<img class="rounded-circle"
													src='<c:url value = "https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"/>'
													alt="anh dai dien">
											</c:if>
											<!-- <img alt="avatar" src="../assets/images/avatar/avatar-1.jpg"
												class="rounded-circle" /> -->
										</div>

										<div class="ms-3 lh-1">
											<h5 class="mb-0" name="idUser" value="${user.userId}">${user.name}</h5>
											<h5 class="mb-0">${user.email }</h5>
										</div>
									</div>
								</div>
								<div class="dropdown-divider"></div>
								<ul class="list-unstyled">
									<li><a class="dropdown-item"
										href="/Ielts-listening2/user/capnhattaikhoan?userId=${user.userId}">
											<i class="fe fe-user me-2"></i> Tài khoản
									</a></li>
									<li><a class="dropdown-item"
										href="khoahoccuatoi?userId=${user.userId}"> 
										<i class="fe fe-book me-2"></i> Khóa học của tôi
									</a></li>
									<li><a class="dropdown-item"
										href="/Ielts-listening2/user/mycart?userId=${user.userId}">
											<i class="fe fe-shopping-cart me-2"></i> Giỏ hàng
									</a></li>
									<li><a class="dropdown-item"
										href="/Ielts-listening2/user/blogs?userId=${user.userId}">
											<i class="fe fe-book me-2"></i> Blogs cá nhân
									</a></li>
									<li><a class="dropdown-item"
										href="capnhatmatkhau?userId=${user.userId}"> <i
											class="fe fe-settings me-2"></i> Bảo mật
									</a></li>
								</ul>
								<div class="dropdown-divider"></div>
								<ul class="list-unstyled m-0">
									<li>
										<form action=logout method="post">
											<button class="dropdown-item">
												<i class="fe fe-power me-2"></i> Đăng Xuất
											</button>
										</form>
									</li>
								</ul>
							</div></li>

					</c:if>

				</div>
				<div>
					<button class="navbar-toggler collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbar-default"
						aria-controls="navbar-default" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar top-bar mt-0"></span> <span
							class="icon-bar middle-bar"></span> <span
							class="icon-bar bottom-bar"></span>
					</button>
				</div>
			</div>
			<!-- Button -->

			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="navbar-default">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><a class="nav-link "
						href="/Ielts-listening2/user/home">Trang chủ</a></li>

					<li class="nav-item "><a class="nav-link " href="course">Khóa
							học</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarLanding"
						data-bs-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Luyện đề</a>
						<ul class="dropdown-menu" aria-labelledby="navbarLanding">
							<li>
								<h4 class="dropdown-header">Luyện đề</h4>
							</li>

							<li><a href="/Ielts-listening2/user/luyen-de-home"
								class="dropdown-item justify-content-between">Tất cả bộ đề</a></li>
							<li><a href="/Ielts-listening2/user/luyen-de-home?tab=2"
								class="dropdown-item justify-content-between">Bộ đề mới nhất</a></li>
							<li><a href="/Ielts-listening2/user/luyen-de-home?tab=3"
								class="dropdown-item">Bộ đề HOT</a></li>

						</ul></li>
					<li class="nav-item "><a class="nav-link " href="blogs-page"
						id="navbarLanding">Blogs</a>
					<li class="nav-item"><a class="nav-link " href="helpcenter">FAQs</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<style>
.header-fixed {
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	z-index: 2;
}
</style>


</body>
</html>
