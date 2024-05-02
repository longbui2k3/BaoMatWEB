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
										<li class="nav-item active"><a class="nav-link"
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
								<h3 class="mb-0">Điểm số</h3>
								<p class="mb-0">Theo dõi quá trình học tập tại đây.</p>
							</div>
							<!-- Card body -->
							<form action="capnhatmatkhau?userId=${user.userId}" method="post">
								<input name="userId" value="${user.userId}" class="hide"
									style="display: none">
								<div class="card-body">
									<!-- Line chart -->
									<div id="earning2" class="apex-charts"></div>
									<!-- End Line chart -->
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>

			</div>
		</section>
	</main>

	
    <script>
    var jsonData = '${jsonData}';
    var jsonDay = '${jsonDay}';
    var data = JSON.parse(jsonData);
    var days = JSON.parse(jsonDay);


        var e = {
            series: [
                {
                    name: "Score",
                    data: data,
                },
            ],
            /* labels: [
                "Jan",
                "Feb",
                "March",
                "April",
                "May",
                "Jun",
                "Jul",
                "Aug",
                "Sep",
                "Oct",
                "Nov",
                "Dec",
                
            ], */
            labels: days,
        
        
            chart: {
                fontFamily: "$font-family-base",
                height: "280px",
                type: "line",
                toolbar: { show: false },
            },
            colors: ["#754ffe"],
            stroke: { width: 4, curve: "smooth", colors: "#754ffe" },
            xaxis: {
                axisBorder: { show: false },
                axisTicks: { show: false },
                crosshairs: { show: true },
                labels: {
                    offsetX: 0,
                    offsetY: 5,
                    style: { fontSize: "13px", fontWeight: 400, cssClass: "apexcharts-xaxis-label" },
                },
            },
            yaxis: {
                labels: {
                    formatter: function (e) {
                        return e ;
                    },
                    style: { fontSize: "13px", fontWeight: 400, cssClass: "apexcharts-xaxis-label" },
                    offsetX: -15,
                },
                tickAmount: 10,
                min: 0,
                max: 10,
            },
            grid: {
                borderColor: "#dddddd",
                strokeDashArray: 5,
                xaxis: { lines: { show: false } },
                yaxis: { lines: { show: true } },
                padding: { top: 0, right: 0, bottom: 0, left: 0 },
            },
            legend: {
                position: "top",
                horizontalAlign: "right",
                offsetY: -50,
                fontSize: "16px",
                markers: {
                    width: 10,
                    height: 10,
                    strokeWidth: 0,
                    strokeColor: "#ffffff",
                    fillColors: undefined,
                    radius: 12,
                    onClick: undefined,
                    offsetX: 0,
                    offsetY: 0,
                },
                itemMargin: { horizontal: 0, vertical: 20 },
            },
            tooltip: { theme: "light", marker: { show: true }, x: { show: false } },
            responsive: [{ breakpoint: 575, options: { legend: { offsetY: -30 } } }],
        };

        document.addEventListener("DOMContentLoaded", function () {
            new ApexCharts(document.querySelector("#earning2"), e).render();
        });
    </script>

</body>
</html>