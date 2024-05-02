<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>

	<main>
		<section class="pt-5 pb-5">
			<div class="container">
				<!-- User info -->
				<div class="row align-items-center">
					<div class="col-xl-12 col-lg-12 col-md-12 col-12">
						<div class="rounded-top"
							style="background: url(../assets/images/background/profile-bg.jpg) no-repeat; background-size: cover; height: 100px"></div>
						<div
							class="card px-4 pt-2 pb-4 shadow-sm rounded-top-0 rounded-bottom-0 rounded-bottom-md-2">
							<div class="d-flex align-items-e nd justify-content-between">
								<div class="d-flex align-items-center">
									<div
										class="me-2 position-relative d-flex justify-content-end align-items-end mt-n5">
										<c:if test="${currentUser.image != null}">
											<img
												src='<c:url value='/image?fname=userAvatar/${ currentUser.image}'/>'
												class="avatar-xl rounded-circle border border-4 border-white"
												alt="avatar" />
										</c:if>
										<c:if test="${currentUser.image == null}">
											<img class="rounded-circle"
												style="width: 100px; height: 100px;"
												src='<c:url value = "https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"/>'
												alt="anh dai dien">
										</c:if>
									</div>
									<div class="lh-1">
										<h2 class="mb-0" name="userId" value="${user.userId}">
											<c:if test="${ currentUser.name != null}">
											${ currentUser.name}
										</c:if>
											<c:if test="${ currentUser.name == null}">
											${user.userId }
										</c:if>
											<a href="#" class="" data-bs-toggle="tooltip"
												data-placement="top" title="Beginner"> <svg width="16"
													height="16" viewBox="0 0 16 16" fill="none"
													xmlns="http://www.w3.org/2000/svg">
														<rect x="3"
														y="8" width="2" height="6" rx="1" fill="#754FFE"></rect>
														<rect x="7"
														y="5" width="2" height="9" rx="1" fill="#DBD8E9"></rect>
														<rect x="11"
														y="2" width="2" height="12" rx="1" fill="#DBD8E9"></rect>
													</svg>
											</a>
										</h2>
										<p class="mb-0 d-block">${user.email }</p>
									</div>
								</div>
			
							</div>
						</div>
					</div>
				</div>
	
				<div class="row mt-0 mt-md-4">
					<!-- Left sidebar -->
					<div class="col-lg-3 col-md-4 col-12">
						<!-- Side navbar -->
						<nav
							class="navbar navbar-expand-md shadow-sm mb-4 mb-lg-0 sidenav">
							<!-- Menu -->
							<a class="d-xl-none d-lg-none d-md-none text-inherit fw-bold"
								href="#">Menu</a>
							<!-- Button -->
							<button
								class="navbar-toggler d-md-none icon-shape icon-sm rounded bg-primary text-light"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#sidenav" aria-controls="sidenav"
								aria-expanded="false" aria-label="Toggle navigation">
								<span class="fe fe-menu"></span>
							</button>
							<!-- Collapse navbar -->
							<div class="collapse navbar-collapse" id="sidenav">
								<div class="navbar-nav flex-column">
									<span class="navbar-header">CÁ NHÂN</span>
									<!-- List -->
									<ul class="list-unstyled ms-n2 mb-4">
										<!-- Nav item -->
										<li class="nav-item"><a class="nav-link"
											href="khoahoccuatoi?userId=${user.userId}"> <i
												class="fe fe-calendar nav-icon"></i> Khóa học
										</a></li>
										<!-- Nav item -->
										<li class="nav-item"><a class="nav-link"
											href="thongkediem?userId=${user.userId}"> <i
												class="fe fe-calendar nav-icon"></i> Điểm số
										</a></li>

										<!-- Nav item -->
										
										<li class="nav-item active"><a class="nav-link"
											href="myorder?userId=${user.userId}"> <i
												class="fe fe-calendar nav-icon"></i> Hóa đơn
										</a></li>

									</ul>
									<span class="navbar-header">TÀI  KHOẢN</span>
									<!-- List -->
									<ul class="list-unstyled ms-n2 mb-0">
										<!-- Nav item -->
										<li class="nav-item"><a class="nav-link"
											href="capnhattaikhoan?userId=${user.userId}"> <i
												class="fe fe-settings nav-icon"></i> Thông tin cá nhân
										</a></li>
										<!-- Nav item -->
										<li class="nav-item"><a class="nav-link"
											href="capnhatmatkhau?userId=${user.userId}"> <i
												class="fe fe-user nav-icon"></i> Bảo mật
										</a></li>

										<!-- Nav item -->
										<form action=logout method="post">
											<li class="nav-item">
												<button class="nav-link" style="width: 100%;"> 
													<i class="fe fe-power nav-icon"></i>
													Đăng xuất
												</button>
											</li>
										</form>
									</ul>
								</div>
							</div>
						</nav>
					</div>

					<div class="col-lg-9 col-md-8 col-12">
						<!-- Container fluid -->
						<section class="container-fluid">
							<div class="row">
								<div class="col-lg-12 col-md-12 col-12">
									<!-- Page header -->
									<div class="border-bottom pb-3 mb-3">
										<div>
											<h1 class="mb-1 h2 fw-bold">Hóa đơn</h1>
											<!-- Breadcrumb -->
											<nav aria-label="breadcrumb">
												<ol class="breadcrumb">
													<li class="breadcrumb-item"><a
														href="/Ielts-listening2/user/home">Trang chủ</a></li>
				
													<li class="breadcrumb-item active" aria-current="page">Hóa đơn</li>
												</ol>
											</nav>
										</div>
									</div>
								</div>
							</div>
				
							<div class="row">
								<!-- basic table -->
								<div class="col-md-12 col-12 mb-5">
									<div class="card">
										<!-- card header  -->
										<div class="card-header">
											<h4 class="mb-1">Hóa đơn</h4>
											<p class="mb-0">Tìm kiếm lịch sử mua hàng tại đây.</p>
										</div>
										<!-- table  -->
										<div class="card-body">
											<div class="table-card">
												<table id="dataTableBasic" class="table table-hover"
													style="width: 100%">
													<thead class="table-light">
														<tr>
															<th>Hóa đơn</th>
															<th>Số lượng</th>
															<th>Tình trạng</th>
															<th>Ngày mua</th>
															<th>Tổng tiền</th>
														</tr>
				
													</thead>
													<tbody>
														<c:forEach var="i" items="${list}">
															<tr>
																<c:set var="count" value="0"></c:set>
																<c:forEach var="detail" items="${i.payDetail}">
				
																	<c:set var="count" value="${count + 1 }"></c:set>
																</c:forEach>
				
																<td><a href="myoddetail?id=${i.paymentId}">${i.paymentId}</a></td>
				
																<td>${count}</td>
																<td><span
																	class="badge text-success bg-light-success">Đã thanh toán</span></td>
																<td>${i.dateBuy}</td>
																<td>${i.cost} VNĐ</td>
				
															</tr>
				
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<!-- basic table -->
								<div class="col-md-12 col-12 mb-5">
									<div class="card">
										<!-- card header  -->
				
									</div>
								</div>
							</div>
						</section>
					</div>

				</div>

			</div>

			</div>
		</section>
	</main>
	

</body>