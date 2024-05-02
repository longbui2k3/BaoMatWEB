<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
Long count = (Long) request.getAttribute("countCourse");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.servlet.jsp.PageContext"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<style>
.dropdown-item:hover {
	background-color: #0071f9 !important;
	color: white;
}

.adminkhoahoc-course--detail:hover {
	cursor: pointer;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.adminkhoahoc-course--detail {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0
		rgba(0, 0, 0, 0.05);
}

.card-text {
	display: -webkit-box;
	overflow: hidden;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.adminkhoahoc-course--detail {
	margin-bottom: 60px;
	margin-right: 40px;
}

.button-delete-course:hover {
	color: red;
}
</style>
	<div class="adminkhoahoc container-fluid p-0 m-0 row pt-8 pb-4">
		<div class="d-flex justify-content-between">
			<div class="input-group" style="width: 400px;">
				<span class="input-group-text px-3 boDescription for topic 1rder-0"
					id="basic-addon1"
					style="background-color: white; color: rgb(107, 114, 128);">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
		  					<path
							d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
						</svg>
				</span> <input type="text"
					class="btn__search form-control py-2 fs-5 border"
					placeholder="Tìm kiếm" aria-label="Search"
					aria-describedby="basic-addon1"
					value='${param.search == null ? "" : param.search }'>
			</div>
			<div
				class="adminkhoahoc-button d-flex flex-row justify-content-center">
				<button href="#" type="button" class="btn" onclick="showModel()"
					style="background-color: rgb(0, 177, 53)">
					<span style="color: white">Thêm Khóa Học</span>
				</button>
			</div>
		</div>
	</div>
	<c:if test="${course.size() == 0}">
		<div class="w-100 d-flex flex-row justify-content-center my-5">
			<div>
				<img class="mx-auto d-block my-3"
					src='<c:url value="/assets/images/bee-find.svg"/>' width="150px" />
				<p class="fs-4 fw-bold mb-0 text-center">Không tìm thấy kết quả
					phù hợp</p>
				<p class="text-center"
					style="color: rgb(123, 137, 155); font-size: 18px; width: 680px;">Hiện
					tại, khóa học của Prep chưa có khóa học nào phù hợp với yêu cầu của
					bạn rồi ! Hãy thử lại bằng cách bỏ bớt bộ lọc nhé.</p>
			</div>
		</div>
	</c:if>
	<!-- Model -->
	<div id="model" class="course_input"
		style="max-width: 800px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 3; display: none;">
		<form action="insertCourse" method="POST"
			enctype="multipart/form-data">
			<div id="test-l-1" class="bs-stepper-pane"
				aria-labelledby="courseFormtrigger1">
				<!-- Card -->
				<div class="card mb-3">
					<div class="card-header border-bottom px-4 py-3">
						<h4 class="mb-0">Tạo khóa học mới</h4>
					</div>
					<!-- Card body -->
					<div style="max-height: 450px" class=" overflow-auto">
						<div class="card-body">
							<div class="mb-3">
								<label for="courseName" class="form-label">Tên khóa học</label>
								<input id="" name="courseName" class="form-control courseName"
									type="text" placeholder="Tên khóa học" required> <small>Write
									a 60 character course title.</small>
							</div>
							<div class="mb-3">
								<label class="form-label">Mô tả</label>
								<textarea class="form-control description" name="description"
									aria-label="With textarea"></textarea>
							</div>
							<div class="d-flex align-items-center justify-content-between">
								<div style="min-width: 350px" class="mb-3">
									<label for="fee" class="form-label">Học phí</label> <input
										id="" name="cost" class="form-control cost" type="text"
										placeholder="Học phí" required>
								</div>
								<div style="min-width: 350px" class="mb-3">
									<label class="form-label" for="startdate">Ngày bắt đầu</label>
									<input class="form-control flatpickr enrrollmentDate"
										type="text" placeholder="Start date" required id=""
										name="enrrollmentDate" data-mdb-toggle="datepicker" />
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Thêm ảnh bìa</label> <input
									type="file" class="form-control image" name="image" id=""
									accept="image/jpeg, image/png" require>
							</div>
							<div>
								<div class="mb-3">
									<label class="form-label">Thêm video xem trước</label> <input
										type="file" class="form-control trailer" name="trailer" id=""
										accept="video/mp4" require>
									<div id="audio"></div>
								</div>
							</div>
						</div>
						<!-- Button -->
						<button class="btn btn-primary m-4" type="submit" onclick="show()">Xác
							nhận</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="model1"
		style="max-width: 800px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 3; display: none;">
		<form action="updateCourse" method="post"
			enctype="multipart/form-data">
			<div id="test-l-1" class="course_Update bs-stepper-pane"
				aria-labelledby="courseFormtrigger1">
				<!-- Card -->
				<div class="card mb-3">
					<div class="card-header border-bottom px-4 py-3">
						<h4 class="mb-0">Sửa khóa học</h4>
					</div>
					<!-- Card body -->
					<div style="max-height: 450px" class=" overflow-auto">
						<div class="card-body">
							<div class="mb-3">
								<label for="courseId" class="form-label">ID</label> <input
									id="courseId" name="CourseId" class="form-control cost"
									type="text" readonly>
							</div>
							<div class="mb-3">
								<label for="courseName" class="form-label">Tên khóa học</label>
								<input id="courseName" name="CourseName"
									value="${i.courseName }" class="form-control courseName"
									type="text" placeholder="Tên khóa học" required> <small>Write
									a 60 character course title.</small>
							</div>
							<div class="mb-3">
								<label class="form-label">Mô tả</label>
								<textarea id="description" class="form-control description"
									name="Description" aria-label="With textarea"></textarea>
							</div>
							<div class="d-flex align-items-center justify-content-between">
								<div style="min-width: 350px" class="mb-3">
									<label for="fee" class="form-label">Học phí</label> <input
										id="cost" name="Cost" class="form-control cost" type="text"
										placeholder="Học phí" required>
								</div>
								<div style="min-width: 350px" class="mb-3">
									<label class="form-label" for="startdate">Ngày bắt đầu</label>
									<input class="form-control flatpickr enrrollmentDate"
										type="text" placeholder="Start date" id=""
										name="EnrrollmentDate" data-mdb-toggle="datepicker" required />
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Ảnh bìa</label> <input type="file"
									class="form-control image" name="Image" id="image"
									accept="image/jpeg, image/png" require>
							</div>
							<div>
								<div class="mb-3">
									<label class="form-label">Video xem trước</label> <input
										type="file" class="form-control trailer" name="Trailer" id=""
										accept="video/mp4" require>
									<div id="audio"></div>
								</div>
							</div>
						</div>
						<!-- Button -->
						<button class="btn btn-primary m-4" type="submit" onclick="show()">Cập
							nhật</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div id="shadow"
		class="position-fixed top-0 start-0 bottom-0 end-0 bg-dark"
		style="opacity: 0.5; display: none; z-index: 2"
		onclick="hideShadow(),hideShadow1()"></div>
	<div>
		<div class="d-flex flex-row justify-content-between mb-4">
			<section class="py-6">
				<div class="">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-12 mb-4">
							<div
								class="row d-md-flex justify-content-between align-items-center">
								<div class="col-md-6 col-lg-8 col-xl-5">
									<h4 class="mb-3 mb-md-0"><%=count%>
										Khóa Học
									</h4>
								</div>
								<div class="d-inline-flex col-md-6 col-lg-4 col-xl-7">
									<div class="me-2">
										<!-- Nav -->
										<div class="nav btn-group flex-nowrap" role="tablist">
											<button id="gridButton" class="btn btn-outline-secondary"
												data-bs-toggle="tab" data-bs-target="#tabPaneGrid"
												role="tab" aria-controls="tabPaneGrid" aria-selected="true">
												<span class="fe fe-grid"></span>
											</button>
											<button id="listButton" class="btn btn-outline-secondary"
												data-bs-toggle="tab" data-bs-target="#tabPaneList"
												role="tab" aria-controls="tabPaneList" aria-selected="false">
												<span class="fe fe-list"></span>
											</button>
										</div>
									</div>
									<div class="d-flex  adminkhoahoc-filter--rate ">
										<p class="my-auto">Rate:</p>
										<div class="dropdown dropdown-rate my-auto ms-2">
											<button
												class="btn bg-color-white dropdown-toggle border border-secondary-subtle"
												type="button" data-bs-toggle="dropdown"
												aria-expanded="false" style="width: 160px">
												<!-- 								<span class="me-3">Mặc định</span>
-->
												<c:choose>
													<c:when test="${param.rate == 'thapdencao'}">
														<span class="me-3">Thấp đến cao</span>
													</c:when>
													<c:when test="${param.rate == 'caodenthap'}">
														<span class="me-3">Cao đến thấp</span>
													</c:when>
													<c:otherwise>
														<span class="me-3">Mặc định</span>
													</c:otherwise>
												</c:choose>
											</button>
											<ul class="dropdown-menu bg-color-grey">
												<li><a class="dropdown-item"
													href="/Ielts-listening2/admin/khoahoc?rate=caodenthap">Cao
														đến thấp</a></li>
												<li><a class="dropdown-item"
													href="/Ielts-listening2/admin/khoahoc?rate=thapdencao">Thấp
														đến cao</a></li>
												<li><a class="dropdown-item"
													href="/Ielts-listening2/admin/khoahoc">Mặc định</a></li>
											</ul>
										</div>
									</div>
									<div class="d-flex  adminkhoahoc-filter--gia ">
										<p class="my-auto">Giá:</p>
										<div class="dropdown dropdown-gia my-auto ms-2">
											<button
												class="btn bg-color-white dropdown-toggle border border-secondary-subtle "
												type="button" data-bs-toggle="dropdown"
												aria-expanded="false" style="width: 160px">
												<c:choose>
													<c:when test="${param.gia == 'thapdencao'}">
														<span class="me-3">Thấp đến cao</span>
													</c:when>
													<c:when test="${param.gia == 'caodenthap'}">
														<span class="me-3">Cao đến thấp</span>
													</c:when>
													<c:otherwise>
														<span class="me-3">Mặc định</span>
													</c:otherwise>
												</c:choose>
											</button>
											<ul class="dropdown-menu bg-color-grey"
												aria-labelledby="navbarLanding">
												<li><a class="dropdown-item justify-content-between"
													href="?gia=caodenthap">Cao đến thấp</a></li>
												<li><a class="dropdown-item justify-content-between"
													href="?gia=thapdencao">Thấp đến cao</a></li>
												<li><a class="dropdown-item justify-content-between"
													href="?">Mặc định</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Tab content -->
						<div class="col-xl-12 col-lg-9 col-md-8 col-12">
							<div class="tab-content">
								<!-- Tab pane -->
								<div class="tab-pane fade show active pb-4" id="tabPaneGrid"
									role="tabpanel" aria-labelledby="tabPaneGrid">
									<div class="row">
										<c:forEach var="i" items="${course}">
											<div class="col-lg-3 col-md-6 col-12 "
												data-bs-toggle="popover" data-bs-trigger="hover focus"
												title="${i.courseName}" data-bs-content="${i.description}">
												<div class="card mb-4 card-hover">
													<c:if test="${i.image != null}">
														<a href="listLesson?courseId=${i.courseId}"><img
															style="height: 200px; object-fit: cover;"
															src="<c:url value='/image?fname=courseIMG/${ i.image}'/>"
															alt="course" class="card-img-top img-fluid"></a>
													</c:if>
													<c:if test="${i.image == null}">
														<a href="listLesson?courseId=${i.courseId}"><img
															style="height: 200px; object-fit: cover;"
															src="https://th.bing.com/th/id/OIP.xaADddZHWRoU3TbjEVGssQHaFj?rs=1&pid=ImgDetMain"
															alt="course" class="card-img-top img-fluid"></a>
													</c:if>
													<!-- Card Body -->
													<div class="card-body">
														<h4 class="mb-2 text-truncate-line-2">
															<a href="listLesson?courseId=${i.courseId }"
																class="text-inherit">${i.courseName}</a>
														</h4>
														<!-- List inline -->
														<div class="d-flex align-items-center gap-3">
															<p class="card-text color-blue--primary fw-bold fs-5">
																<fmt:formatNumber value="${i.cost}"
																	pattern="###,### VNĐ" />
															<p class="card-text fw-bold fs-5"
																style="color: rgb(113, 113, 113)"></p>
															</p>
														</div>
														<div class="lh-1">
															<span class="align-text-top"> <span class="fs-6">
																	<div class="d-flex gap-5">
																		<c:set var="totalStars" value="0" />
																		<c:set var="count" value="0" />
																		<c:forEach var="lesson" items="${i.lessons}">
																			<c:forEach var="enrrol_lesson"
																				items="${lesson.enrrolLesson}">
																				<c:set var="totalStars"
																					value="${totalStars + enrrol_lesson.numberOfStar}" />
																				<c:choose>
																					<c:when
																						test="${enrrol_lesson.numberOfStar != 0 && enrrol_lesson.numberOfStar != null}">
																						<c:set var="count" value="${count + 1}" />
																					</c:when>
																				</c:choose>
																			</c:forEach>
																		</c:forEach>
																		<c:choose>
																			<c:when test="${count == 0}">
																				<c:set var="averageStars" value="0" />
																				<c:set var="roundedAverage">
																					<c:out
																						value="${(averageStars - (averageStars mod 1)) + (averageStars mod 1 > 0 ? 1 : 0)}" />
																				</c:set>
																			</c:when>
																			<c:when test="${count > 0}">
																				<c:set var="averageStars"
																					value="${totalStars / count}" />
																				<c:set var="roundedAverage">
																					<c:out
																						value="${(averageStars - (averageStars mod 1)) + (averageStars mod 1 > 0 ? 1 : 0)}" />
																				</c:set>
																			</c:when>
																		</c:choose>
																		<div class="stars rating-star"
																			data-rating="${roundedAverage}"></div>
																		<div class="rating-avg pe-3 text-warning">${roundedAverage}</div>

																	</div>
															</span>
														</div>
													</div>
													<!-- Card footer -->
													<div class="card-footer">
														<div class="row align-items-center g-0">
															<div class="col-auto"></div>
															<div class="col ms-2"></div>
															<div class="col-auto">
																<c:choose>
																	<c:when test="${user ne null}">
																		<!-- User is logged in, submit the form -->
																		<form action="" method="post">
																			<input type="hidden" name="courseId"
																				value="${i.courseId }">
																			<!-- <button type="submit"
																		style="border: none; background: none;">
																		<i class="fe fe-shopping-cart fs-4"></i>
																	</button> -->
																			<a
																				href="/Ielts-listening2/admin/deletecourse?courseId=${i.courseId}"><button
																					class="btn btn-sm rounded-0 button-delete-course"
																					type="button" data-toggle="tooltip"
																					data-placement="top" title="Delete">
																					<i class="fa fa-trash"></i>
																				</button></a> 
																				<a href="#" value="${i.courseId }"><button
																					onclick="showModel1()"
																					class="btn btn-sm rounded-0 button-add-course"
																					value="${i.courseId }" type="button"
																					data-toggle="tooltip" data-placement="top"
																					title="Update">
																					<i class="fa fa-edit"></i>
																				</button></a>
																		</form>
																	</c:when>
																	<c:otherwise>
																		<!-- User is not logged in, show a login popup or perform any other action -->
																		<!-- <button style="border: none; background: none;"
																		type="button" onclick="showLoginPopup()">
																		<i class="fe fe-shopping-cart fs-4"></i>
																	</button> -->
																		<a
																			href="/Ielts-listening2/admin/deletecourse?courseId=${i.courseId}"><button
																				class="btn btn-sm rounded-0 button-delete-course"
																				type="button" data-toggle="tooltip"
																				data-placement="top" title="Delete"
																				onclick="showLoginPopup()">
																				<i class="fa fa-trash"></i>
																			</button></a>
																		<a value="${i.courseId }"><button
																				class="btn btn-sm rounded-0 button-add-course"
																				value="${i.courseId }" type="button"
																				data-toggle="tooltip" data-placement="top"
																				title="Update">
																				<i class="fa fa-edit"></i>
																			</button></a>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<!-- Tab pane -->
								<div class="tab-pane fade pb-4" id="tabPaneList" role="tabpanel"
									aria-labelledby="tabPaneList">
									<!-- Card -->
									<c:forEach var="i" items="${course}">
										<div class="card mb-4 card-hover">
											<div class="row g-0">
												<c:if test="${i.image != null}">
													<a
														class="col-12 col-md-12 col-xl-3 col-lg-3 bg-cover img-left-rounded"
														href="listLesson?courseId=${i.courseId}"><img
														style="height: 200px; object-fit: cover;"
														src="<c:url value='/image?fname=courseIMG/${ i.image}'/>"
														alt="course" class="img-fluid w-100"></a>
												</c:if>
												<c:if test="${i.image == null}">
													<a
														class="col-12 col-md-12 col-xl-3 col-lg-3 bg-cover img-left-rounded"
														href="listLesson?courseId=${i.courseId}"><img
														style="height: 200px; object-fit: cover;"
														src="https://th.bing.com/th/id/OIP.xaADddZHWRoU3TbjEVGssQHaFj?rs=1&pid=ImgDetMain"
														alt="course" class="img-fluid w-100"></a>
												</c:if>
												<div class="col-lg-9 col-md-12 col-12">
													<!-- Card body -->
													<div class="card-body">
														<h3 class="mb-2 text-truncate-line-2">
															<a href="listLesson?courseId=${i.courseId }"
																class="text-inherit">${i.courseName}</a>
														</h3>
														<!-- list inline -->
														<ul class="list-inline">
															<li class=" list-inline-item align-text-top"><span
																class="fs-6">
																	<div class="d-flex gap-5">
																		<c:set var="totalStars" value="0" />
																		<c:set var="count" value="0" />
																		<c:forEach var="lesson" items="${i.lessons}">
																			<c:forEach var="enrrol_lesson"
																				items="${lesson.enrrolLesson}">
																				<c:if test="${enrrol_lesson.numberOfStar != null}">
																					<c:set var="totalStars"
																						value="${totalStars + enrrol_lesson.numberOfStar}" />
																				</c:if>
																				<c:if
																					test="${enrrol_lesson.numberOfStar != 0 && enrrol_lesson.numberOfStar != null}">
																					<c:set var="count" value="${count + 1}" />
																				</c:if>
																			</c:forEach>
																		</c:forEach>
																		<c:choose>
																			<c:when test="${count == 0}">
																				<c:set var="averageStars" value="0" />
																				<c:set var="roundedAverage">
																					<c:out
																						value="${(averageStars - (averageStars mod 1)) + (averageStars mod 1 > 0 ? 1 : 0)}" />
																				</c:set>
																			</c:when>
																			<c:when test="${count > 0}">
																				<c:set var="averageStars"
																					value="${totalStars / count}" />
																				<c:set var="roundedAverage">
																					<c:out
																						value="${(averageStars - (averageStars mod 1)) + (averageStars mod 1 > 0 ? 1 : 0)}" />
																				</c:set>
																			</c:when>
																		</c:choose>
																		<div class="stars rating-star"
																			data-rating="${roundedAverage}"></div>
																		<div class="rating-avg pe-3 text-warning">${roundedAverage}</div>
																	</div></li>
														</ul>
														<div class="d-flex align-items-center gap-3">
															<p class="card-text color-blue--primary fw-bold fs-5">
																<fmt:formatNumber value="${i.cost}"
																	pattern="###,### VNĐ" />
															<p class="card-text fw-bold fs-5"
																style="color: rgb(113, 113, 113)"></p>
														</div>
														<div class="row align-items-center g-0">
															<div class="col-auto"></div>
															<div class="col ms-2"></div>
															<div class="col-auto">
																<c:choose>
																	<c:when test="${user ne null}">
																		<!-- User is logged in, submit the form -->
																		<form action="addToCart" method="post">
																			<input type="hidden" name="courseId"
																				value="${i.courseId }"> <a
																				href="/Ielts-listening2/admin/deletecourse?courseId=${i.courseId}"><button
																					class="btn btn-sm rounded-0 button-delete-course"
																					type="button" data-toggle="tooltip"
																					data-placement="top" title="Delete">
																					<i class="fa fa-trash"></i>
																				</button></a> <a href="#" value="${i.courseId }"><button
																					class="btn btn-sm rounded-0 button-add-course"
																					value="${i.courseId }" type="button"
																					data-toggle="tooltip" data-placement="top"
																					title="Update" ">
																					<i class="fa fa-edit"></i>
																				</button></a>
																		</form>
																	</c:when>
																	<c:otherwise>
																		<a
																			href="/Ielts-listening2/admin/deletecourse?courseId=${i.courseId}"><button
																				class="btn btn-sm rounded-0 button-delete-course"
																				type="button" data-toggle="tooltip"
																				data-placement="top" title="Delete"
																				onclick="showLoginPopup()">
																				<i class="fa fa-trash"></i>
																			</button></a>
																		<a href="#" value="${i.courseId }"><button
																				class="btn btn-sm rounded-0 button-add-course"
																				value="${i.courseId }" type="button"
																				data-toggle="tooltip" data-placement="top"
																				title="Update">
																				<i class="fa fa-edit"></i>
																			</button></a>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<c:if test="${course.size() > 0}">
									<div class="position-relative w-100 border-top">
										<div class="d-flex flex-row justify-content-center mx-auto"
											style="width: 500px">
											<button
												class="btn__page--previous d-flex flex-row justify-content-between mt-4 mx-auto py-2 fs-5 fw-bold  border-0 rounded-3 align-items-center"
												style="width: 220px; padding: 0 30px 0 30px;"
												${ param.page == null || param.page == "1" ? "disabled":""}>
												<svg xmlns="http://www.w3.org/2000/svg" height="24"
													style="margin-top: 3px;" fill="currentColor"
													class="bi bi-arrow-left" viewBox="0 0 16 16">
		  						<path fill-rule="evenodd"
														d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
							</svg>
												Trang Trước
											</button>
											<button
												class="btn__page--next d-flex flex-row justify-content-between mt-4 mx-auto py-2 fs-5 fw-bold border-0 rounded-3 align-items-center"
												style="width: 220px; padding: 0 30px 0 30px;"
												${ param.page == pageNum || (param.page == null && pageNum == "1") ? "disabled":""}>
												Trang Sau
												<svg xmlns="http://www.w3.org/2000/svg" height="24"
													style="margin-top: 3px;" fill="currentColor"
													class="bi bi-arrow-right" viewBox="0 0 16 16">
		  						<path fill-rule="evenodd"
														d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
							</svg>
											</button>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<script>
	    document.querySelectorAll('.stars').forEach(starContainer => {
	        const rating = parseInt(starContainer.getAttribute('data-rating'));
	        starContainer.innerHTML = getStarRating(rating);
	    });
	
	    function getStarRating(rating) {
	        let stars = '';
	        for (let i = 0; i < 5; i++) {
	            if (i < rating) {
	                stars += '⭐';
	            } else {
	                stars += '★';
	            }
	        }
	        return stars;
	    }
	</script>
		<script>
		var arrCourse = [];
		// Duyệt danh sách Java và thêm dữ liệu vào biến JavaScript
		<c:forEach var="item" items="${course}">
			var item = {
				courseId : "${item.courseId}",
				courseName : "${item.courseName}",
				image : "${item.image}",
				trailer : "${item.trailer}",
				enrrollmentDate: "${item.enrrolmentDate}",
				description: "${item.description}",
				cost: "${item.cost}"
			};
			arrCourse.push(item);
		</c:forEach>
		console.log(arrCourse);
		function showCourseInfo(courseId) {
		    // Find the course object in arrCourse array based on courseId
		    var selectedCourse = arrCourse.find(function(course) {
		      return course.courseId === courseId;
		    });
		    console.log(selectedCourse);
		    console.log(selectedCourse.courseName);
		    // Populate the modal with course information
		    document.getElementById('courseId').setAttribute("value", selectedCourse.courseId);
		    document.getElementById('courseName').value = selectedCourse.courseName;
		    document.getElementById('description').value = selectedCourse.description;
		    document.getElementById('cost').value = selectedCourse.cost;
		    // Populate other fields as needed
		    // Display the modal
		    showModel1()
		  }
		  // Event listener for button clicks
		 /*  document.addEventListener('DOMContentLoaded', function() { */
		    var buttons = document.querySelectorAll('.button-add-course');
			console.log(buttons);
		    buttons.forEach(function(button) {
		      button.addEventListener('click', function() {
		        var courseId = this.value;
		        showCourseInfo(courseId);
		      });
		    });
	</script>
		<!-- <script src="../assets/libs/%40popperjs/core/dist/umd/popper.min.js"></script>
		<script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script> -->
		<script>
	function showFile(fileInputs){
		document.querySelectorAll("h5").forEach(h5 => h5.remove());
		const files = fileInputs.files;
		for (let i = 0; i < files.length; i++){
			const path = (window.URL || window.webkitURL).createObjectURL(files[i]);
			console.log(files[i]);
			const html = "<h5>"+files[i].name+"</h5>";
			document.querySelector("form").insertAdjacentHTML("afterend", html);
		}
	}
	
	
	</script>
		<script>
		const params = new URLSearchParams(document.location.search);
		let page = params.get("page") ? params.get("page"):'1';
		
		const li_List = document.querySelectorAll(".div__tab");
		let currLi = document.querySelectorAll(".div__tab")[0];
		if (li_List) {
			li_List.forEach((li, i) => {
				li.addEventListener("click", (e) => {
					currLi.classList.remove("active");
					currLi = li;
					currLi.classList.add("active");
					params.delete("page");
					if (i === 0) {
						params.delete("tab");
					}
					else params.set("tab", i + 1);
					const isQuestionMark = params.toString() === "" ? "" : "?";
					window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
				})
			})
		}
		const prePageBtn = document.querySelector(".btn__page--previous");
		const nextPageBtn = document.querySelector(".btn__page--next");
		if (prePageBtn) {
			if (prePageBtn.disabled === false) {
				prePageBtn.classList.add("bg-color-blue--primary");
				prePageBtn.classList.add("color-white");
			}
			prePageBtn.addEventListener("click", (e) => {
				e.preventDefault();
				page = Number(page) - 1;
				if (page == 1){
					params.delete("page");
					const isQuestionMark = params.toString() === "" ? "" : "?";
					window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
				}
				else {
					params.set("page", page);
					const isQuestionMark = params.toString() === "" ? "" : "?";
					window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
				}
				
			})
		}
		
		if (nextPageBtn) {
			if (nextPageBtn.disabled === false) {
				nextPageBtn.classList.add("bg-color-blue--primary");
				nextPageBtn.classList.add("color-white");
			}
			nextPageBtn.addEventListener("click", (e) => {
				e.preventDefault();
				page = Number(page) + 1;
				params.set("page", page);
				const isQuestionMark = params.toString() === "" ? "" : "?";
				window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
			})
		}
		
		const inputPageNum = document.querySelector(".input__pageNum");
		if (inputPageNum) {
			inputPageNum.addEventListener("change", (e) => {
				e.preventDefault();
				page = e.target.value;
				if (Number(page) < 1) {
					page = 1;
				}
				if (Number(page) > Number('${pageNum}')) {
					page = '${pageNum}';
				}
				
				params.set("page", page);
				const isQuestionMark = params.toString() === "" ? "" : "?";
				window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
			})
		}
		const minPageBtn = document.querySelector(".btn__page--min");
		const maxPageBtn = document.querySelector(".btn__page--max");
		if (minPageBtn) {
			if (page === "1") {
				minPageBtn.disabled = true;
			}
			else minPageBtn.disabled = false;
			minPageBtn.addEventListener("click", (e) => {
				e.preventDefault();
				params.delete("page");
				const isQuestionMark = params.toString() === "" ? "" : "?";
				window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
			})
		}
		if (maxPageBtn) {
			if (page === '${pageNum}') {
				maxPageBtn.disabled = true;
			}
			else maxPageBtn.disabled = false;
			maxPageBtn.addEventListener("click", (e) => {
				e.preventDefault();
				params.set("page", ${pageNum});
				const isQuestionMark = params.toString() === "" ? "" : "?";
				window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
			})
		}
		const searchBtn = document.querySelector(".btn__search");
		if (searchBtn) {
			searchBtn.addEventListener("keypress", (e) => {
				if (e.key ==="Enter") {
					e.preventDefault();
					params.delete("page");
					if (e.target.value !== "")
						params.set("search", e.target.value);
					else params.delete("search");
					const isQuestionMark = params.toString() === "" ? "" : "?";
					window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
				}
			})
		}
	</script>
		<script>
		function showModel() {
			// Show the shadow
			document.getElementById("shadow").style.display = "block";
			document.getElementById("model").style.display = "block";
		}
		function showModel1() {
			// Show the shadow
			document.getElementById("shadow").style.display = "block";
			document.getElementById("model1").style.display = "block";
		}
		function hideShadow() {
			// Hide the shadow
			document.getElementById("shadow").style.display = "none";
			document.getElementById("model").style.display = "none";
		}
		function hideShadow1() {
			// Hide the shadow
			document.getElementById("shadow").style.display = "none";
			document.getElementById("model1").style.display = "none";
		}
	</script>
		<script>
		document.addEventListener('DOMContentLoaded', () => {
		    const gridButton = document.getElementById('gridButton');
		    const listButton = document.getElementById('listButton');
		    const savedActiveButtonId = localStorage.getItem('activeButtonId');
		    // Lắng nghe sự kiện khi người dùng chuyển đổi chế độ xem
		    if (savedActiveButtonId) {
		        document.getElementById(savedActiveButtonId).classList.add('active');
		    } else {
		        // Nếu không có trạng thái lưu trữ, thiết lập mặc định là 'gridButton' active
		        gridButton.classList.add('active');
		    }
		    gridButton.addEventListener('click', () => {
		        localStorage.setItem('viewMode', 'grid');
		        //setAriaSelectedAttributes('gridButton', 'listButton');
		        saveActiveButton('gridButton');
		    });
		
		    listButton.addEventListener('click', () => {
		        localStorage.setItem('viewMode', 'list');
		        //setAriaSelectedAttributes('listButton', 'gridButton');
		        saveActiveButton('listButton');
		    });
		
		    // Khôi phục trạng thái khi trang được tải
		    const savedViewMode = localStorage.getItem('viewMode');
		    if (savedViewMode === 'grid') {
		        // Áp dụng chế độ xem lưới
		        document.getElementById('tabPaneGrid').classList.add('show', 'active');
		        document.getElementById('tabPaneList').classList.remove('show', 'active');
		        //setAriaSelectedAttributes('gridButton', 'gridButton');
		    } else if (savedViewMode === 'list') {
		        // Áp dụng chế độ xem danh sách
		        document.getElementById('tabPaneList').classList.add('show', 'active');
		        document.getElementById('tabPaneGrid').classList.remove('show', 'active');
		        //setAriaSelectedAttributes('listButton', 'gridButton');
		    }
		    function setAriaSelectedAttributes(selectedButtonId, unselectedButtonId) {
		        document.getElementById(selectedButtonId).setAttribute('aria-selected', 'true');
		        document.getElementById(unselectedButtonId).setAttribute('aria-selected', 'false');
		    }
		    function saveActiveButton(buttonId) {
		        // Xóa lớp 'active' khỏi tất cả các nút
		        gridButton.classList.remove('active');
		        listButton.classList.remove('active');
		        // Thêm lớp 'active' cho nút được bấm
		        document.getElementById(buttonId).classList.add('active');
		        // Lưu ID của nút active vào Local Storage
		        localStorage.setItem('activeButtonId', buttonId);
		    }
		});
		</script>
		<script>
		    document.addEventListener('DOMContentLoaded', function () {
		        flatpickr('.flatpickr', {
		            defaultDate: new Date(),
		            dateFormat: 'Y-m-d',
		        });
		    });
		</script>
		<!-- <script
			src="../assets/libs/datatables.net-bs5/js/dataTables.bootstrap5.min.js"></script>
		<script
			src="../assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
		<script
			src="../assets/libs/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js"></script>
		<script
			src="../assets/libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
		<script
			src="../assets/libs/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js"></script> -->
</body>
</html>

