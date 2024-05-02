<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
										
										<li class="nav-item"><a class="nav-link"
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
										<li class="nav-item active"><a class="nav-link"
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
						<!-- Card -->
						
						<div class="card">
							<!-- Card header -->
							<div class="card-header">
								<h3 class="mb-0">Bảo mật</h3>
								<p class="mb-0">Thay đổi mật khẩu của bạn tại đây.</p>
							</div>
							<!-- Card body -->
							<form action="capnhatmatkhau?userId=${user.userId}"  method="post">
					<input name="userId" value ="${user.userId}" class="hide" style="display:none">
							<div class="card-body">
								<div>
									<!-- Form -->
										<form class="row needs-validation" novalidate>
										<div class="col-lg-6 col-md-12 col-12">
											<!-- Current password -->
											<div class="mb-3">
												<label class="form-label" for="currentpassword">Mật khẩu hiện tại</label>
												<input id="currentpassword" type="password" name="currentpassword" class="form-control" placeholder="" required>
												<div class="invalid-feedback">Nhập mật khẩu hiện tại của bạn.</div>
											</div>
											<!-- New password -->
											<div class="mb-3 password-field">
												<label class="form-label" for="newpassword">Mật khẩu mới</label>
												<input id="newpassword" type="password" name="newpassword" class="form-control mb-2" placeholder="" required>
												<div class="invalid-feedback">Nhập mật khẩu mới.</div>
												<div class="row align-items-center g-0">
													<div class="col-6">
														<span
															data-bs-toggle="tooltip"
															data-placement="right"
															title="Test it by typing a password in the field below. To reach full strength, use at least 6 characters, a capital letter and a digit, e.g. 'Test01'">
															Độ bảo mật
															<i class="fe fe-help-circle ms-1"></i>
														</span>
													</div>
												</div>
											</div>
											<div class="mb-3">
											<!-- Confirm new password -->
												<label class="form-label" for="confirmpassword">Xác nhận mật khẩu mới</label>
												<input id="confirmpassword" type="password" name="confirmpassword" class="form-control mb-2" placeholder="" required>
												<div class="invalid-feedback">Xác nhận mật khẩu mới.</div>
											</div>
											<!-- Alert -->
											<c:if test="${not empty messError }">
												<div class="mb-3 col-12 col-md-12">
												<div class="alert alert-warning d-flex align-items-center" role="alert">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill me-2" viewBox="0 0 16 16">
															<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
														</svg>
														<div>
															${messError }
														</div>
												</div>
											</div>
											</c:if>
											<!-- Button -->
											<button type="submit" class="btn btn-primary">Lưu mật khẩu</button>
											<div class="col-6"></div>
										</div>
										
									</form>
								</div>
							</form>
							</div>
					</div>

				</div>

			</div>

			</div>
		</section>
	</main>
			
</body>
</html>