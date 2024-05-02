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
										<li class="nav-item active"><a class="nav-link"
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
						<!-- Card -->
				
						<div class="card">
							<!-- Card header -->
							<div class="card-header">
								<h3 class="mb-0">Thông tin cá nhân</h3>
								<p class="mb-0">Chỉnh sửa thông tin cá nhân tại đây.</p>
							</div>
							<!-- Card body -->
							<form action="capnhattaikhoan?userId=${user.userId}"
								method="post" enctype="multipart/form-data">
								<input name="userId" value="${user.userId}" class="hide"
									style="display: none">
								<div class="card-body">
									<div
										class="d-lg-flex align-items-center justify-content-between">
										<div class="d-flex align-items-center mb-4 mb-lg-0">
											<div style="width: 100px">
												<c:if test="${currentUser.image != null}">
													<img class="rounded-circle"
														style="width: 100px; height: 100px;"
														src='<c:url value='/image?fname=userAvatar/${ currentUser.image}'/>'
														alt="anh dai dien">
												</c:if>
												<c:if test="${currentUser.image == null}">
													<img class="rounded-circle"
														style="width: 100px; height: 100px;"
														src='<c:url value = "https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"/>'
														alt="anh dai dien">
												</c:if>
													</div>
				
											<div class="ms-3">
												<h4 class="mb-0">Ảnh đại diện</h4>
												<!-- <p class="mb-0">PNG or JPG no bigger than 800px wide and
													tall.</p> -->
											</div>
										</div>
										<div>
											<input type="file" class="form-control" value="Input"
												name="inputImage" id="inputimage"
												accept="image/jpeg, image/png">
				
										</div>
									</div>
									<hr class="my-5" />
									
									<div>
				
										<div class="row gx-3 ">
											<!--  name -->
											<div class="mb-3 col-12 col-md-6">
												<label class="form-label" for="fname">Họ và tên</label> <input
													type="text" class="form-control " id="inputname"
													name="inputName" placeholder="Họ và tên"
													value="${ currentUser.name}" required>
												<div class="invalid-feedback">Hãy điền tên vào</div>
											</div>
											<!-- Email-->
											<div class="mb-3 col-12 col-md-6">
												<label class="form-label" for="Email">Email</label> <input
													type="text" class="form-control " id="inputemail" disabled
													name="inputEmail" placeholder="Email"
													value="${ currentUser.email}" required>
												<div class="invalid-feedback">Hãy điền Email.</div>
											</div>
				
											<!-- Phone -->
											<div class="mb-3 col-12 col-md-6">
												<label class="form-label" for="phone">Số điện thoại</label> <input
													type="text" class="form-control" id="inputphone"
													name="inputPhone" placeholder="Số điện thoại"
													value="${ currentUser.phoneNumber}" required />
				
												<div class="invalid-feedback">Hãy điền số điện thoại.</div>
											</div>
											<!-- Birthday -->
											<div class="mb-3 col-12 col-md-6">
												<label class="form-label" for="birth">Ngày sinh</label> <input
													class="form-control flatpickr" type="text"
													placeholder="Ngày sinh" id="datepicker" name="datePicker"
													data-mdb-toggle="datepicker"
													value="${ currentUser.dateOfBirth}" required />
												<div class="invalid-feedback">Hãy chọn ngày.</div>
											</div>
											<!-- Address -->
											<div class="mb-3 col-12 col-md-12">
												<label class="form-label" for="address">Địa chỉ</label> <input
													type="text" class="form-control" id="inputaddress"
													name="inputAddress" placeholder="Địa chỉ"
													value="${ currentUser.address}" required />
												<div class="invalid-feedback">Hãy điền địa chỉ .</div>
											</div>
											<!-- Networth -->
											<div class="mb-3 col-12 col-md-12">
												<label class="form-label" for="address">Số dư</label> <input
													type="text" class="form-control " id="inputnetworth"
													name="inputNetworth" placeholder="Số dư"
													value="${ currentUser.networth}" disabled>
				
											</div>
											<!-- Alert -->
											<c:if test="${not empty messError }">
												<div class="mb-3 col-12 col-md-12">
													<div class="alert alert-warning d-flex align-items-center"
														role="alert">
														<svg xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" fill="currentColor"
															class="bi bi-exclamation-triangle-fill me-2"
															viewBox="0 0 16 16">
														<path
																d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
													</svg>
														<div>${messError }</div>
													</div>
												</div>
											</c:if>
											<!-- Button -->
											<div class="mb-3 col-12 col-md-6">
												<button type="button"
													class="btn btn-primary text--description color-white text--description px-3 py-2 float-end"
													data-bs-toggle="modal" data-bs-target="#exampleModal">Nạp
													tiền</button>
											</div>
											<div class="mb-3 col-12 col-md-6">
												<button type="submit" name="action"
													class="btn btn-primary text--description color-white text--description px-3 py-2">Cập
													nhật</button>
											</div>
											<div class="modal fade" id="exampleModal" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog modal-dialog-centered">
													<div class="modal-content">
														<div
															class="modal-header bg-color-blue--primary color-white align-items-center">
															<h1 class="modal-title fs-5 text--title ps-2"
																id="exampleModalLabel">Nạp tiền</h1>
															<button type="button" class="btn" data-bs-dismiss="modal">
																<svg xmlns="http://www.w3.org/2000/svg" width="24"
																	height="24" viewBox="0 0 24 24" fill="none">
										<path d="M18 6L6 18" stroke="white" stroke-width="2"
																		stroke-linecap="square" stroke-linejoin="round" />
										<path d="M6 6L18 18" stroke="white" stroke-width="2"
																		stroke-linecap="square" stroke-linejoin="round" />
									</svg>
															</button>
														</div>
														<div class="modal-body">
															<div class="col-12 mb-3 px-2">
																<lable for="inputName" class="form-lable text--h4">Số
																tiền cần nạp</lable>
																<input type="text" class="form-control shadow-none mt-2"
																	id="inputnetworth" name="inputNetworth"
																	placeholder="Số tiền">
															</div>
															<div class="d-flex flex-column align-items-center">
																<div class="px-2">
																	<div class="card mb-3"
																		style="height: 250px; width: 250px">
																		<img
																			src='<c:url value = "https://www.qr-code-generator.com/wp-content/themes/qr/images/banners/frames/websiteQRCode_noFrame.png"></c:url>' />
																	</div>
																</div>
																<p class="text--description m-0">Quét mã QR để nạp
																	tiền</p>
															</div>
														</div>
														<div class="modal-footer justify-content-center">
															<button type="submit"
																class="btn text--description color-white bg-color-blue--primary">Hoàn
																tất</button>
														</div>
													</div>
												</div>
											</div>
										</div>
				
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