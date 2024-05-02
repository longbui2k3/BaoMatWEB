<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Long countUser = (Long) request.getAttribute("countUser");
%>

<%
Long countCourse = (Long) request.getAttribute("countCourse");
%>
<%
Long sumRevenue = (Long) request.getAttribute("sumRevenue");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Analytics</title>
</head>
<body>
	<main class="page-content">
		<section class="container-fluid p-4">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-12">
					<div
						class="border-bottom pb-3 mb-3 d-lg-flex justify-content-between align-items-center">
						<div class="mb-3 mb-lg-0">
							<h1 class="mb-0 h2 fw-bold">Thống kê</h1>
						</div>
						<!-- <div class="d-flex">
							<div class="input-group me-3">
								<input class="form-control flatpickr" type="text"
									placeholder="Select Date" aria-describedby="basic-addon2">

								<span class="input-group-text" id="basic-addon2"><i
									class="fe fe-calendar"></i></span>
							</div>
							<a href="#" class="btn btn-primary">Setting</a>
						</div> -->
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-lg-6 col-md-12 col-12">
					<!-- Card -->
					<div class="card mb-4">
						<!-- Card body -->
						<div class="card-body">
							<div
								class="d-flex align-items-center justify-content-between mb-3 lh-1">
								<div>
									<span class="fs-6 text-uppercase fw-semibold ls-md">Tổng
										doanh thu</span>
								</div>
								<div>
									<span class="fe fe-shopping-bag fs-3 text-primary"></span>
								</div>
							</div>

							<h2 class="fw-bold mb-1">
								<fmt:formatNumber value="<%=sumRevenue%>" pattern="###,### VNĐ" />
							</h2>
							<!-- <span class="text-success fw-semibold"> <i
								class="fe fe-trending-up me-1"></i> +20.9$
							</span> <span class="ms-1 fw-medium">Number of sales</span> -->
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-6 col-md-12 col-12">
					<!-- Card -->
					<div class="card mb-4">
						<!-- Card body -->
						<div class="card-body">
							<div
								class="d-flex align-items-center justify-content-between mb-3 lh-1">
								<div>
									<span class="fs-6 text-uppercase fw-semibold ls-md">Tổng
										khóa học</span>
								</div>
								<div>
									<span class="fe fe-book-open fs-3 text-primary"></span>
								</div>
							</div>
							<h2 class="fw-bold mb-1"><%=countCourse%></h2>
							<!-- <span class="text-danger fw-semibold">120+</span> <span
								class="ms-1 fw-medium">Number of pending</span> -->
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-6 col-md-12 col-12">
					<!-- Card -->
					<div class="card mb-4">
						<!-- Card body -->
						<div class="card-body">
							<div
								class="d-flex align-items-center justify-content-between mb-3 lh-1">
								<div>
									<span class="fs-6 text-uppercase fw-semibold ls-md">Tổng
										học viên</span>
								</div>
								<div>
									<span class="fe fe-users fs-3 text-primary"></span>
								</div>
							</div>
							<h2 class="fw-bold mb-1"><%=countUser%></h2>
							<!-- <span class="text-success fw-semibold"> <i
								class="fe fe-trending-up me-1"></i> +1200
							</span> <span class="ms-1 fw-medium">Students</span> -->
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-8 col-lg-12 col-md-12 col-12">
					<!-- Card -->
					<div class="card mb-4">
						<!-- Card header -->
						<div
							class="card-header align-items-center card-header-height d-flex justify-content-between align-items-center">
							<div>
								<h4 class="mb-0">Doanh thu năm 2023</h4>
							</div>
							<div>
								<div class="dropdown dropstart">
									<!-- <a class="btn-icon btn btn-ghost btn-sm rounded-circle"
										href="#" role="button" id="courseDropdown1"
										data-bs-toggle="dropdown" aria-expanded="false"> <i
										class="fe fe-more-vertical"></i>
									</a> -->
									<div class="dropdown-menu" aria-labelledby="courseDropdown1">
										<span class="dropdown-header">Settings</span> <a
											class="dropdown-item" href="#"> <i
											class="fe fe-external-link dropdown-item-icon"></i> Export
										</a> <a class="dropdown-item" href="#"> <i
											class="fe fe-mail dropdown-item-icon"></i> Email Report
										</a> <a class="dropdown-item" href="#"> <i
											class="fe fe-download dropdown-item-icon"></i> Download
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- Card body -->
						<div class="card-body">
							<!-- bar chart -->
							<div id="orderColumn1" class="apex-charts"></div>
							<!-- End bar chart -->
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-12 col-md-12 col-12">
					<!-- Card -->
					<div class="card mb-4">
						<!-- Card header -->
						<div
							class="card-header align-items-center card-header-height d-flex justify-content-between align-items-center">
							<div>
								<h4 class="mb-0">Doanh thu năm 2023</h4>
							</div>
							<div>
								<div class="dropdown dropstart">
									<!-- <a class="btn-icon btn btn-ghost btn-sm rounded-circle"
										href="#" role="button" id="courseDropdown2"
										data-bs-toggle="dropdown" aria-expanded="false"> <i
										class="fe fe-more-vertical"></i>
									</a> -->
									<div class="dropdown-menu" aria-labelledby="courseDropdown2">
										<span class="dropdown-header">Settings</span> <a
											class="dropdown-item" href="#"> <i
											class="fe fe-external-link dropdown-item-icon"></i> Export
										</a> <a class="dropdown-item" href="#"> <i
											class="fe fe-mail dropdown-item-icon"></i> Email Report
										</a> <a class="dropdown-item" href="#"> <i
											class="fe fe-download dropdown-item-icon"></i> Download
										</a>
									</div>
								</div>
							</div>
						</div>
						<!-- Card body -->
						<div class="card-body">
							<div id="traffic1"
								class="apex-charts d-flex justify-content-center"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-4 col-lg-12 col-md-12 col-12 mb-4">
					<!-- Card -->
					<div class="card h-100">
						<!-- Card header -->
						<div
							class="card-header d-flex align-items-center justify-content-between card-header-height">
							<h4 class="mb-0">Học viên có đóng góp nhiều</h4>
							<a href="/Ielts-listening2/admin/listUser"
								class="btn btn-outline-secondary btn-sm">View all</a>
						</div>
						<!-- Card body -->
						<div class="card-body">

							<ul class="list-group list-group-flush">



								<c:forEach var="index" begin="0" end="${userId.size() - 1}"
									step="1" varStatus="loop">
									<li class="list-group-item px-0"><a
										href="/Ielts-listening2/admin/capnhattaikhoan?userId=${userId[loop.index]}">

											<div class="row">
												<div class="col-auto">
													<div
														class="avatar avatar-md avatar-indicators avatar-online">
														<c:if test="${image[loop.index] != null}">
															<img class="rounded-circle"
																style="width: 40px; height: 40px;"
																src='<c:url value='/image?fname=userAvatar/${ image[loop.index]}'/>'
																alt="avatar">
														</c:if>
														<c:if test="${image[loop.index] == null}">
															<img class="rounded-circle"
																style="width: 40px; height: 40px;"
																src='<c:url value = "https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"/>'
																alt="anh dai dien">
														</c:if>
													</div>
												</div>
												<div class="col ms-n3">
													<h4 class="mb-0 h5">${userId[loop.index]}</h4>
													<span class="me-2 fs-6"> <span
														class="text-dark me-1 fw-semibold">${countCourse1[loop.index]}</span>
														Courses
													</span> <span class="me-2 fs-6"> <span
														class="text-dark me-1 fw-semibold">${countRating1[loop.index]}</span>
														Rated
													</span> <span class="fs-6"> <span
														class="text-dark me-1 fw-semibold"> <fmt:formatNumber
																value="${sumCost[loop.index]}" pattern="###,### VNĐ" /></span>
													</span>
												</div>

											</div></li>
									</a>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-12 col-md-12 col-12 mb-4">
					<!-- Card -->
					<div class="card h-100">
						<!-- Card header -->
						<div
							class="card-header d-flex align-items-center justify-content-between card-header-height">
							<h4 class="mb-0">Các khóa học mới nhất</h4>
							<a href="/Ielts-listening2/admin/khoahoc"
								class="btn btn-outline-secondary btn-sm">View all</a>
						</div>
						<!-- Card body -->
						<div class="card-body">
							<!-- List group flush -->
							<ul class="list-group list-group-flush">

								<c:forEach var="i" items="${listCourseJsp}">
									<li class="list-group-item px-0"><a
										href="/Ielts-listening2/admin/listLesson?courseId=${i.courseId }">
											<div class="row">
												<div class="col-md-3 col-12 mb-3 mb-md-0">
													<a
														href="/Ielts-listening2/admin/listLesson?courseId=${i.courseId }">
														<c:if test="${i.image != null}">
															<a
																href="/Ielts-listening2/admin/listLesson?courseId=${i.courseId }"><img
																style="height: 50px; "
																src="<c:url value='/image?fname=courseIMG/${ i.image}'/>"
																alt="course" class=" img-fluid"></a>
														</c:if> <c:if test="${i.image == null}">
															<a
																href="/Ielts-listening2/admin/listLesson?courseId=${imageCourse[loop.index] }"><img
																style="height: 50px; "
																src=https://blog.faceseo.vn/wp-content/uploads/2021/01/gia-su-ielts-hinh-nen-2-min.jpg
																alt="course" class=" img-fluid"></a>
														</c:if>
													</a>
												</div>
												<div class="col-md-8 col-10">


													<a
														href="/Ielts-listening2/admin/listLesson?courseId=${i.courseId }">
														<h5 class="text-primary-hover">${i.courseName }</h5>
													</a>
													<div class="d-flex align-items-center">
														<span class="d-inline-block text-truncate"
															style="max-width: 150px;" class="fs-6">${i.description }</span>
													</div>
												</div>

											</div></li>
									</a>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-12 col-md-12 col-12 mb-4">
					<!-- Card -->
					<div class="card h-100">
						<!-- Card header -->
						<div
							class="card-header card-header-height d-flex align-items-center">
							<h4 class="mb-0">Bài viết mới nhất</h4>
						</div>
						<!-- Card body -->
						<div class="card-body">
							<!-- List group -->
							<ul class="list-group list-group-flush list-timeline-activity">

								<c:if test="${blogJsp.size() > 0}">
								<c:forEach var="index" begin="0" end="${blogJsp.size() - 1}"
									step="1" varStatus="loop">

									<li class="list-group-item px-0 pt-0 border-0 mb-2">
										<div class="row ">
											<div class="col-2">
												<div
													class="avatar avatar-md avatar-indicators avatar-online">

													<c:if test="${image[loop.index] != null}">
														<img class="rounded-circle"
															style="width: 40px; height: 40px;"
															src='<c:url value='/image?fname=userAvatar/${ image[loop.index]}'/>'
															alt="avatar">
													</c:if>
													<c:if test="${image[loop.index] == null}">
														<img class="rounded-circle"
															style="width: 40px; height: 40px;"
															src='<c:url value = "https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"/>'
															alt="anh dai dien">
													</c:if>


												</div>
											</div>
											<div class="col-10 ms-n2">
												<h4 class="mb-0 h5">${blogJsp[loop.index].title }</h4>
												<div class="mb-1 " style="display: none;display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;overflow: hidden;">${blogJsp[loop.index].content }</div>
												<c:if
													test="${differentHour[loop.index] == 0 && differentMinute[loop.index] < 60}">
													<p class="fs-6">${differentMinute[loop.index]}minute
														ago</p>
												</c:if>

												<c:if test="${differentHour[loop.index] != 0}">
													<p class="fs-6">${differentHour[loop.index]}hour ago</p>
												</c:if>

												<c:if
													test="${differentMinute[loop.index] == 0 && differentSecond[loop.index] < 60}">
													<p class="fs-6">${differentSecond[loop.index]}second
														ago</p>
												</c:if>


											</div>
										</div>
									</li>


								</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Script -->
	<script>
		var jsonData = '${jsonData}';
		var data = JSON.parse(jsonData);

		var jsonData1 = '${jsonData1}';
		var data1 = JSON.parse(jsonData1);

		var trafficChart;
		var orderColumnChart;
		//var data1 = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 ];

		document.addEventListener("DOMContentLoaded", function() {
			var traffic = document.getElementById("traffic1");
			var orderColumn = document.getElementById("orderColumn1");

			if (traffic) {
				var trafficOptions = {
					dataLabels : {
						enabled : true,
						formatter : function(val, opts) {
							return data1[opts.seriesIndex] + "%";
						}
					},
					series : data1,
					labels : [ "Jan", "Feb", "March", "April", "May", "Jun",
							"Jul", "Aug", "Sep", "Oct", "Nov", "Dec", ],
					colors : [ window.theme.darkPrimary, window.theme.primary,
							window.theme.lightPrimary ],
					chart : {
						width : 392,
						type : "donut"
					},
					plotOptions : {
						pie : {
							expandOnClick : false,
							donut : {
								size : "78%"
							}
						}
					},
					legend : {
						labels : {
							colors : [ window.theme.gray500 ],
							useSeriesColors : false
						},
						position : "bottom",
						fontFamily : "inter",
						fontWeight : 500,
						fontSize : "14px",
						markers : {
							width : 8,
							height : 8,
							strokeWidth : 0,
							strokeColor : window.theme.white,
							fillColors : undefined,
							radius : 12,
							customHTML : undefined,
							onClick : undefined,
							offsetX : 0,
							offsetY : 0
						},
						itemMargin : {
							horizontal : 8,
							vertical : 0
						}
					},
					tooltip : {
						theme : "light",

						marker : {
							show : true
						},
						x : {
							show : false
						},

					},
					states : {
						hover : {
							filter : {
								type : "none"
							}
						}
					},
					stroke : {
						show : true,
						colors : [ window.theme.transparent ]
					}
				};

				trafficChart = new ApexCharts(traffic, trafficOptions);
				trafficChart.render();
			}

			if (orderColumn) {
				var orderColumnOptions = {
					series : [ {
						data : data
					} ],
					chart : {
						toolbar : {
							show : false
						},
						type : "bar",
						height : 280
					},
					colors : window.theme.primary,
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : "12%",
							endingShape : "rounded"
						}
					},
					dataLabels : {
						enabled : false
					},
					stroke : {
						show : true,
						width : 1,
						colors : [ "transparent" ]
					},
					grid : {
						borderColor : window.theme.borderColor,
						strokeDashArray : 5,
						xaxis : {
							lines : {
								show : false
							}
						},
						yaxis : {
							lines : {
								show : true
							}
						},
						padding : {
							top : 0,
							right : 0,
							bottom : 0,
							left : -10
						}
					},
					xaxis : {
						categories : [ "Jan", "Feb", "March", "April", "May",
								"Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
								"Dec", ],
						axisBorder : {
							show : false
						},
						labels : {
							offsetX : 0,
							offsetY : 5,
							style : {
								fontSize : "14px",
								fontWeight : 400,
								colors : window.theme.gray500
							}
						}
					},
					yaxis : {
						titletext : undefined,
						plotOptions : {
							bar : {
								horizontal : false,
								endingShape : "rounded",
								columnWidth : "80%"
							}
						},
						labels : {
							style : {
								fontSize : "13px",
								fontWeight : 400,
								colors : "#a8a3b9"
							},
							offsetX : -10
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {

							formatter : function(e) {
								return new Intl.NumberFormat('vi-VN', {
									style : 'currency',
									currency : 'VND'
								}).format(e);

							}
						},
						marker : {
							show : true
						}
					}
				};

				orderColumnChart = new ApexCharts(orderColumn,
						orderColumnOptions);
				orderColumnChart.render();
			}
		});
	</script>
</body>
</html>

