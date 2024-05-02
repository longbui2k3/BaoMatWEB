<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="../assets/libs/glightbox/dist/css/glightbox.min.css">
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codescandy" />

<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="../assets/images/favicon/favicon.ico" />

<!-- darkmode js -->
<script src="../assets/js/vendors/darkMode.js"></script>

<!-- Libs CSS -->
<link href="../assets/fonts/feather/feather.css" rel="stylesheet" />
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet" />
<link href="../assets/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet" />

<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">

<link rel="canonical" href="course-single.html">
<title>Course Single | Geeks - Bootstrap 5 Template</title>


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body>
	<main>
		<!-- Page header -->
		<section class="pt-lg-8 pb-8 bg-primary">
			<div class="container pb-lg-8">
				<div class="row align-items-center">
					<div class="col-xl-7 col-lg-7 col-md-12">
						<div>
							<h1 class="text-white display-4 fw-semibold">${course.courseName }</h1>
							<p class="text-white mb-6 lead">${course.description }</p>
							<div class="d-flex align-items-center">

								<form action="addToCart" method="post">
									<input type="hidden" name="courseId"
										value="${course.courseId }">
									<button class="bookmark text-white" type="submit"
										style="border: none; background: none;">
										<i class="ti ti-shopping-cart fs-4 me-2"></i> Giỏ hàng
									</button>
								</form>

								<span class="text-white ms-3"> <i class="fe fe-user"></i>
									${countUser } người đăng ký
								</span>

								<c:set var="people" value="0"></c:set>
								<c:set var="totalStars" value="0"></c:set>

								<c:forEach var="lesson" items='${course.lessons }'>
									<c:forEach var="enrrol_lesson" items='${lesson.enrrolLesson }'>
										<c:if test="${enrrol_lesson.numberOfStar > 0}">
											<c:set var="totalStars"
												value="${totalStars + enrrol_lesson.numberOfStar }"></c:set>
											<c:set var="people" value="${people + 1 }"></c:set>
										</c:if>
									</c:forEach>
								</c:forEach>
								<c:choose>
									<c:when test="${people > 0 }">
										<c:set var="star" value="${totalStars/people }"></c:set>
									</c:when>
									<c:otherwise>
										<c:set var="star" value="0"></c:set>
									</c:otherwise>
								</c:choose>
								<fmt:formatNumber type="number" maxFractionDigits="0"
									value="${star}" var="starInteger" />
								<c:if test="${people > 0 }">
									<div>
										<span class="fs-6 ms-4 align-text-top"> <c:forEach
												var="i" begin="1" end="${starInteger }">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" fill="currentColor"
													class="bi bi-star-fill text-warning" viewBox="0 0 16 16">
		                                            <path
														d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
		                                            </path>
	                                        	</svg>
											</c:forEach> <c:forEach var="i" begin="1" end="${5 - starInteger }">
												<svg xmlns="http://www.w3.org/2000/svg" width="12"
													height="12" fill="currentColor"
													class="bi bi-star-fill text-light" viewBox="0 0 16 16">
	                                                <path
														d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
	                                                            </path>
	                                            </svg>
											</c:forEach>
										</span> <span class="text-white">(${people})</span>
									</div>
								</c:if>
								<c:if test="${people == 0 }">
									<span class="ms-4 text-white">Chưa có đánh giá</span>
								</c:if>
								<span class="text-white ms-4 d-none d-md-block"> <svg
										width="16" height="16"
										viewBox="0 0 16
                              16" fill="none"
										xmlns="http://www.w3.org/2000/svg">
                                        <rect x="3" y="8" width="2"
											height="6" rx="1" fill="#DBD8E9"></rect>
                                        <rect x="7" y="5" width="2"
											height="9" rx="1" fill="#DBD8E9"></rect>
                                        <rect x="11" y="2" width="2"
											height="12" rx="1" fill="#DBD8E9"></rect>
                                    </svg> <span class="align-middle">Cơ
										bản</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Page content -->
		<section class="pb-8">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12 col-12 mt-n8 mb-4 mb-lg-0">
						<!-- Card -->
						<div class="card rounded-3">
							<!-- Card header -->
							<div class="card-header border-bottom-0 p-0">
								<div>
									<!-- Nav -->
									<ul class="nav nav-lb-tab" id="tab" role="tablist">
										<li class="nav-item"><a class="nav-link active"
											id="table-tab" data-bs-toggle="pill" href="#table" role="tab"
											aria-controls="table" aria-selected="true">Bài học</a></li>
										<li class="nav-item"><a class="nav-link"
											id="description-tab" data-bs-toggle="pill"
											href="#description" role="tab" aria-controls="description"
											aria-selected="false"> Mô tả </a></li>
										<li class="nav-item"><a class="nav-link" id="review-tab"
											data-bs-toggle="pill" href="#review" role="tab"
											aria-controls="review" aria-selected="false">Đánh giá</a></li>
										<li class="nav-item d-none"><a class="nav-link"
											id="transcript-tab" data-bs-toggle="pill" href="#transcript"
											role="tab" aria-controls="transcript" aria-selected="false">
												Transcript </a></li>
										<li class="nav-item d-none"><a class="nav-link"
											id="faq-tab" data-bs-toggle="pill" href="#faq" role="tab"
											aria-controls="faq" aria-selected="false">FAQ</a></li>
									</ul>
								</div>
							</div>
							<!-- Card Body -->
							<div class="card-body">
								<div class="tab-content" id="tabContent">
									<div class="tab-pane fade show active" id="table"
										role="tabpanel" aria-labelledby="table-tab">
										<!-- Card -->
										<div class="accordion" id="courseAccordion">
											<div>
												<!-- List group -->
												<ul class="list-group list-group-flush">
													<li class="list-group-item px-0 pt-0">
														<!-- Toggle --> <a
														class="h4 mb-0 d-flex align-items-center active"
														data-bs-toggle="collapse" href="#courseTwo"
														aria-expanded="true" aria-controls="courseTwo">
															<div class="me-auto">${course.courseName }</div>
													</a>
														<div class="progress-enrolled mt-2">
															<div class="progress" style="height: 6px">
																<div class="progress-bar bg-success" role="progressbar"
																	style="width: 0%" aria-valuenow="0" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
															<small class=" progress-text">0% Completed</small>
														</div> <!-- Row --> <!-- Collapse -->
														<div class="collapse show" id="courseTwo"
															data-bs-parent="#courseAccordion">
															<div class="pt-3 pb-2 disable">
																<!-- List group item -->
																<ul class="list-group list-group-flush">
																	<c:if test="${isBuy ==0 }">
																		<c:forEach var="lesson" items="${listLesson }">
																			<li class="list-group-item list-group-item-action">
																				<div
																					class="d-flex justify-content-between align-items-center text-inherit">
																					<div class="text-truncate">
																						<span
																							class="icon-shape bg-light text-primary icon-sm rounded-circle me-2">
																							<i class="fe fe-lock"></i>
																						</span> <span class="main-lesson__title">${lesson.lessonName }</span>
																					</div>
																					<div class="text-truncate">
																						<span class="main-lesson__time">1m 7s</span>
																					</div>
																				</div>
																			</li>
																		</c:forEach>
																	</c:if>
																	<c:if test="${isBuy ==1 }">
																		<c:forEach var="lesson" items="${listLesson }">
																			<li class="list-group-item list-group-item-action">
																				<a href="lesson?id=${lesson.lesson.lessonId }"
																				class="d-flex justify-content-between align-items-center text-inherit">
																					<div class="text-truncate">
																						<span
																							class="icon-shape bg-light text-primary icon-sm rounded-circle me-2">
																							<svg xmlns="http://www.w3.org/2000/svg"
																								width="14" height="14" fill="currentColor"
																								class="bi bi-play-fill" viewBox="0 0 16 16">
                                                                        <path
																									d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z">
                                                                    </path></svg>
																						</span> <span class="main-lesson__title">${lesson.lesson.lessonName}</span>
																					</div>
																					<div class="text-truncate">
																						<span class="main-lesson__time"> <c:if
																								test="${lesson.enrollLesson != null }">
																								<span>${lesson.enrollLesson.score}</span>
																							</c:if> <c:if test="${lesson.enrollLesson == null }">
																								<span>1m 7s</span>
																							</c:if>
																						</span>
																					</div>
																			</a>
																			</li>
																		</c:forEach>
																	</c:if>
																</ul>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="description" role="tabpanel"
										aria-labelledby="description-tab">
										<!-- Description -->
										<div class="mb-4">
											<h3 class="mb-2">Mô tả khóa học</h3>
											<p>${course.description}</p>
											<!-- 											<p>Next, you’ll explore the basics of the language,
												giving plenty of examples. Lastly, you’ll put your
												JavaScript knowledge to work and modify a modern, responsive
												web page. When you’re finished with this course, you’ll have
												the skills and knowledge in JavaScript to create simple
												programs, create simple web applications, and modify web
												pages.</p> -->
										</div>
										<!-- <h4 class="mb-3">What you’ll learn</h4>
										<div class="row mb-3">
											<div class="col-12 col-md-6">
												<ul class="list-unstyled">
													<li class="d-flex mb-2"><span class="me-2"> <svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" fill="currentColor"
																class="bi bi-check-circle text-success"
																viewBox="0 0 16 16">
  <path
																	d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																	d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
</svg>
													</span> <span>Recognize the importance of understanding
															your objectives when addressing an audience.</span></li>
													<li class="d-flex mb-2"><span class="me-2"> <svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" fill="currentColor"
																class="bi bi-check-circle text-success"
																viewBox="0 0 16 16">
  <path
																	d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																	d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
</svg>
													</span> <span>Identify the fundaments of composing a
															successful close.</span></li>
													<li class="d-flex mb-2"><span class="me-2"> <svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" fill="currentColor"
																class="bi bi-check-circle text-success"
																viewBox="0 0 16 16">
  <path
																	d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																	d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
</svg>
													</span> <span>Explore how to connect with your audience
															through crafting compelling stories.</span></li>
												</ul>
											</div>
											<div class="col-12 col-md-6">
												<ul class="list-unstyled">
													<li class="d-flex mb-2"><span class="me-2"> <svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" fill="currentColor"
																class="bi bi-check-circle text-success"
																viewBox="0 0 16 16">
  <path
																	d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																	d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
</svg>
													</span> <span>Examine ways to connect with your audience by
															personalizing your content.</span></li>
													<li class="d-flex mb-2"><span class="me-2"> <svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" fill="currentColor"
																class="bi bi-check-circle text-success"
																viewBox="0 0 16 16">
  <path
																	d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																	d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
</svg>
													</span> <span>Break down the best ways to exude executive
															presence.</span></li>
													<li class="d-flex mb-2"><span class="me-2"> <svg
																xmlns="http://www.w3.org/2000/svg" width="14"
																height="14" fill="currentColor"
																class="bi bi-check-circle text-success"
																viewBox="0 0 16 16">
  <path
																	d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
																	d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z" />
</svg>
													</span> <span>Explore how to communicate the unknown in an
															impromptu communication.</span></li>
												</ul>
											</div>
										</div> -->
										<!-- <p>Maecenas viverra condimentum nulla molestie
											condimentum. Nunc ex libero, feugiat quis lectus vel, ornare
											euismod ligula. Aenean sit amet arcu nulla.</p>
										<p>Duis facilisis ex a urna blandit ultricies. Nullam
											sagittis ligula non eros semper, nec mattis odio ullamcorper.
											Phasellus feugiat sit amet leo eget consectetur.</p> -->
									</div>
									<div class="tab-pane fade" id="review" role="tabpanel"
										aria-labelledby="review-tab">
										<!--  -->
										<div class="mb-3">
											<h3 class="mb-4">Đánh giá của học viên</h3>
											<c:if test="${people > 0 }">
												<div class="row align-items-center">
													<div class="col-auto text-center">
														<fmt:formatNumber type="number" maxFractionDigits="1"
															value="${star}" var="starRounded" />
														<h3 class="display-2 fw-bold">${starRounded}</h3>
														<fmt:formatNumber type="number" maxFractionDigits="0"
															value="${star}" var="starInteger" />
														<span class="fs-6"> <c:forEach var="i" begin="1"
																end="${starInteger }">
																<svg xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
					                                            <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
					                                            </path>
				                                        	</svg>
															</c:forEach> <c:forEach var="i" begin="1" end="${5 - starInteger }">
																<svg xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
				                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
				                                                            </path>
				                                            </svg>
															</c:forEach>
														</span>
														<p class="mb-0 fs-6">(Dựa trên ${people } đánh giá)</p>
													</div>


													<!-- Progress Bar -->
													<div class="col order-3 order-md-2"
														style="padding-top: 19px;">
														<c:forEach var="i" begin="0" end="4" step="1">
															<div class="progress mb-3" style="height: 6px">
																<div class="progress-bar bg-warning" role="progressbar"
																	style="width: ${percentCountOfStars[4 - i]}%"
																	aria-valuenow="90" aria-valuemin="0"
																	aria-valuemax="100"></div>
															</div>
														</c:forEach>
													</div>
													<div class="col-md-auto col-6 order-2 order-md-3">
														<!-- Rating -->
														<div>
															<span class="fs-6"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg>
															</span> <span class="ms-1">${percentCountOfStars[4] }%</span>
														</div>
														<div>
															<span class="fs-6"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg>
															</span> <span class="ms-1">${percentCountOfStars[3]}%</span>
														</div>
														<div>
															<span class="fs-6"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg>
															</span> <span class="ms-1">${percentCountOfStars[2]}%</span>
														</div>
														<div>
															<span class="fs-6"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg>
															</span> <span class="ms-1">${percentCountOfStars[1]}%</span>
														</div>
														<div>
															<span class="fs-6"> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-warning"
																	viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg> <svg
																	xmlns="http://www.w3.org/2000/svg" width="12"
																	height="12" fill="currentColor"
																	class="bi bi-star-fill text-light" viewBox="0 0 16 16">
                                                                <path
																		d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                            </svg>
															</span> <span class="ms-1">${percentCountOfStars[0]}%</span>
														</div>
													</div>
												</div>
											</c:if>
											<c:if test="${people == 0 }">
												<img class="mx-auto d-block my-3"
													src='<c:url value="/assets/images/bee-find.svg"/>'
													width="150px" />
												<h3 class="text-center">Chưa có đánh giá</h3>
											</c:if>
										</div>
										<hr class="my-5">
										<div class="mb-3">
											<div
												class="d-lg-flex align-items-center justify-content-between mb-5">
												<!--  -->
												<div class="mb-3 mb-lg-0">
													<h3 class="mb-0">Bình luận</h3>
												</div>
												<!-- <div>
													<form class="form-inline">
														<div class="d-flex align-items-center me-2">
															<span class="position-absolute ps-3"> <i
																class="fe fe-search"></i>
															</span> <input type="search" class="form-control ps-6"
																placeholder="Tìm kiếm">
														</div>
													</form>
												</div> -->
											</div>
											<!-- rating item-->
											<c:if test="${commentLessonsList.size() == 0 }">
												<img class="mx-auto d-block my-3"
													src='<c:url value="/assets/images/bee-find.svg"/>'
													width="150px" />
												<h3 class="text-center">Chưa có bình luận</h3>
											</c:if>
											<c:forEach var="c" items='${commentLessonsList}'>
												<div
													class="rating-item d-flex align-items-start border-bottom pb-4 mb-4">
													<c:if test="${c.users.image == null }">
														<c:set var="image"
															value="https://res.cloudinary.com/dh6bfx865/image/upload/v1698335051/cuahangdientu/default_avatar.png"></c:set>
													</c:if>
													<c:if test="${c.users.image != null}">
														<c:set var="image"
															value="http://localhost:8080/Ielts-listening2/image?fname=/userAvatar/${c.users.image }"></c:set>
													</c:if>
													<img src="${image }" alt=""
														class="rounded-circle avatar-md">
													<div class="ms-3">
														<h4
															class="rating-name mb-1 d-flex justify-content-between align-items-center">
															<div class="rating-name">
																${ c.users.name }
																<!-- <span class="rating-date ms-1 fs-6 color-dimgrey">Bài 01</span> -->
															</div>
															<div class="rating-day">
																<span class="rating-time ms-1 fs-6 color-dimgrey">${c.createTime.getHours()}:${c.createTime.getMinutes() }</span>
																<span class="rating-date ms-1 fs-6 color-dimgrey">${c.createTime.getDate()}/${c.createTime.getMonth() + 1}/${c.createTime.getYear() + 1900}
																</span>
															</div>
														</h4>
														<p class="rating-content" style="width: 725px">${c.comment}</p>
														<!-- <div class="rating-question d-lg-flex">
															<p class="mb-0">Bình luận này có bổ ích với bạn không?</p>
															<a href="#" class="btn btn-xs btn-primary ms-lg-3">Có</a>
															<a href="#" class="btn btn-xs btn-outline-secondary ms-1">Không</a>
														</div> -->
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<!-- <div class="tab-pane fade" id="transcript" role="tabpanel"
										aria-labelledby="transcript-tab">
										Description
										<div>
											<h3 class="mb-3">Transcript from the "Introduction"
												Lesson</h3>
											<div class="mb-4">
												<h4>
													Course Overview <a href="#" class="text-primary ms-2 h4">[00:00:00]</a>
												</h4>
												p.
												<p class="mb-0">My name is John Deo and I work as human
													duct tape at Gatsby, that means that I do a lot of
													different things. Everything from dev roll to writing
													content to writing code. And I used to work as an architect
													at IBM. I live in Portland, Oregon.</p>
											</div>
											<div class="mb-4">
												<h4>
													Introduction <a href="#" class="text-primary ms-2 h4">[00:00:16]</a>
												</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
											<div class="mb-4">
												<h4>
													Why Take This Course? <a href="#"
														class="text-primary ms-2 h4">[00:00:37]</a>
												</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
											<div class="mb-4">
												<h4>
													A Look at the Demo Application <a href="#"
														class="text-primary ms-2 h4">[00:00:54]</a>
												</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
											<div class="mb-4">
												<h4>
													Summary <a href="#" class="text-primary ms-2 h4">[00:01:31]</a>
												</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
										</div>
									</div>
									Tab pane
									<div class="tab-pane fade" id="faq" role="tabpanel"
										aria-labelledby="faq-tab">
										FAQ
										<div>
											<h3 class="mb-3">Course - Frequently Asked Questions</h3>
											<div class="mb-4">
												<h4>How this course help me to design layout?</h4>
												<p>My name is Jason Woo and I work as human duct tape at
													Gatsby, that means that I do a lot of different things.
													Everything from dev roll to writing content to writing
													code. And I used to work as an architect at IBM. I live in
													Portland, Oregon.</p>
											</div>
											<div class="mb-4">
												<h4>What is important of this course?</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
											<div class="mb-4">
												<h4>Why Take This Course?</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
											<div class="mb-4">
												<h4>Is able to create application after this course?</h4>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
												<p>We'll dive into GraphQL, the fundamentals of GraphQL.
													We're only gonna use the pieces of it that we need to build
													in Gatsby. We're not gonna be doing a deep dive into what
													GraphQL is or the language specifics. We're also gonna get
													into MDX. MDX is a way to write React components in your
													markdown.</p>
											</div>
										</div>
									</div> -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-12 mt-lg-n8">
						<!-- Card -->
						<div class="card mb-3 mb-4">
							<div class="p-1">
								<c:set var="image"
									value="http://localhost:8080/Ielts-listening2/video?fname=courseIMG/${course.image}"></c:set>
								<c:if test="${course.image == null }">
									<c:set var="image"
										value="https://th.bing.com/th/id/OIP.xaADddZHWRoU3TbjEVGssQHaFj?rs=1&pid=ImgDetMain"></c:set>
								</c:if>
								<div
									class="trailer d-flex justify-content-center align-items-center rounded border-white border rounded-3 bg-cover"
									style="background-image: url('${image}'); height: 210px">
									<a class="glightbox icon-shape rounded-circle btn-play icon-xl"
										href="<c:url value='/image?fname=videoLesson/${course.trailer }'/>">
										<i class="fe fe-play"></i>
									</a>
								</div>
							</div>
							<!-- Card body -->
							<div class="card-body">
								<!-- Price single page -->
								<div
									class="price-container d-flex justify-content-between align-items-start">
									<div class="mb-3">
										<span class="fw-bold fs-3 color-blue--primary"></span>
										<!-- <del class="fs-4">1.000.000</del> -->
									</div>

								</div>
								<div class="d-grid card-button">
									<c:if test="${isBuy ==0 }">
										<form action="order" method=get>

											<input name="listCourseId" value="${course.courseId}"
												id="listCourseId" class="d-none">
											<h3 class="text-primary text-center">

												<fmt:formatNumber value="${course.cost}"
													pattern="###,### VNĐ" />

											</h3>
											<button
												class="w-100 btn btn-primary bg-color-blue--primary mb-2 card-button__reg">Đăng
												ký</button>
										</form>
									</c:if>


									<a href="helpcenter"
										class="btn btn-outline-primary card-button__chat">Tư vấn</a>
								</div>
							</div>
						</div>

						<!-- course-summary-card -->
						<div class="card mb-4 course-summary-card">
							<div>
								<!-- Card header -->
								<div class="card-header">
									<h4 class="mb-0">Thông tin</h4>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item bg-transparent"><i
										class="fe fe-play-circle align-middle me-2 text-primary"></i>
										1h:30p</li>
									<li class="list-group-item bg-transparent"><i
										class="fe fe-award me-2 align-middle text-success"></i> Giấy
										chứng nhận</li>
									<li class="list-group-item bg-transparent"><i
										class="fe fe-calendar align-middle me-2 text-info"></i>
										${course.lessons.size()} bài học</li>
									<li class="list-group-item bg-transparent"><i
										class="fe fe-video align-middle me-2 text-secondary"></i> Học
										trực tuyến</li>
									<li class="list-group-item bg-transparent border-bottom-0">
										<i class="fe fe-clock align-middle me-2 text-warning"></i> Vô
										thời hạn
									</li>
								</ul>
							</div>
						</div>

						<!-- Card -->
						<div class="card d-none">
							<!-- Card body -->
							<div class="card-body">
								<div class="d-flex align-items-center">
									<div class="position-relative">
										<img src="../assets/images/avatar/avatar-1.jpg" alt="avatar"
											class="rounded-circle avatar-xl"> <a href="#"
											class="position-absolute mt-2 ms-n3" data-bs-toggle="tooltip"
											data-placement="top" title="Verifed"> <img
											src="../assets/images/svg/checked-mark.svg"
											alt="checked-mark" height="30" width="30">
										</a>
									</div>
									<div class="ms-4">
										<h4 class="mb-0">Jenny Wilson</h4>
										<p class="mb-1 fs-6">Front-end Developer, Designer</p>
										<p class="fs-6 mb-1 d-flex align-items-center">
											<span class="text-warning">4.5</span> <span class="mx-1">
												<svg xmlns="http://www.w3.org/2000/svg" width="10"
													height="10" fill="currentColor"
													class="bi bi-star-fill text-warning" viewBox="0 0 16 16">
                                                    <path
														d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                                </svg>
											</span> Instructor Rating
										</p>
									</div>
								</div>
								<div class="border-top row mt-3 border-bottom mb-3 g-0">
									<div class="col">
										<div class="pe-1 ps-2 py-3">
											<h5 class="mb-0">11,604</h5>
											<span>Students</span>
										</div>
									</div>
									<div class="col border-start">
										<div class="pe-1 ps-3 py-3">
											<h5 class="mb-0">32</h5>
											<span>Courses</span>
										</div>
									</div>
									<div class="col border-start">
										<div class="pe-1 ps-3 py-3">
											<h5 class="mb-0">12,230</h5>
											<span></span>
										</div>
									</div>
								</div>
								<p>I am an Innovation designer focussing on UX/UI based in
									Berlin. As a creative resident at Figma explored the city of
									the future and how new technologies.</p>
								<a href="instructor-profile.html"
									class="btn btn-outline-secondary btn-sm">View Details</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Card relation-->
				<div class="pt-8 pb-3">
					<div class="row d-md-flex align-items-center mb-4">
						<div class="col-12">
							<h2 class="mb-0">Khóa học nổi bật</h2>
						</div>
					</div>
					<div class="row">
						<c:set var="countCourse" value="0"></c:set>
						<c:forEach var="i" items='${courses}'>
							<c:if test="${i.courseId != course.courseId && countCourse < 4}">
								<div class="col-lg-3 col-md-6 col-12 " data-bs-toggle="popover"
									data-bs-trigger="hover focus" title="${i.courseName}"
									data-bs-content="${i.description}">
									<div class="card mb-4 card-hover">
										<c:if test="${i.image != null}">
											<a href="course-detail?courseId=${i.courseId}"><img
												style="height: 200px; object-fit: cover;"
												src="<c:url value='/image?fname=courseIMG/${ i.image}'/>"
												alt="course" class="card-img-top img-fluid"></a>
										</c:if>
										<c:if test="${i.image == null}">
											<a href="course-detail?courseId=${i.courseId}"><img
												style="height: 200px; object-fit: cover;"
												src="https://th.bing.com/th/id/OIP.xaADddZHWRoU3TbjEVGssQHaFj?rs=1&pid=ImgDetMain"
												alt="course" class="card-img-top img-fluid"></a>
										</c:if>
										<!-- Card Body -->
										<div class="card-body">
											<h4 class="mb-2 text-truncate-line-2">
												<a href="course-detail?courseId=${i.courseId }"
													class="text-inherit">${i.courseName}</a>
											</h4>
											<!-- List inline -->
											<div class="d-flex align-items-center gap-3">
												<p class="card-text color-blue--primary fw-bold fs-5">
													<fmt:formatNumber value="${i.cost}" pattern="###,### VNĐ" />
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
																		<c:when test="${enrrol_lesson.numberOfStar != 0}">
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
																	<c:set var="averageStars" value="${totalStars / count}" />
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
															<form action="addToCart" method="post">
																<input type="hidden" name="courseId"
																	value="${i.courseId }">
																<button type="submit"
																	style="border: none; background: none;">
																	<i class="fe fe-shopping-cart fs-4"></i>
																</button>
															</form>
														</c:when>
														<c:otherwise>
															<!-- User is not logged in, show a login popup or perform any other action -->
															<button style="border: none; background: none;"
																type="button" onclick="showLoginPopup()">
																<i class="fe fe-shopping-cart fs-4"></i>
															</button>
														</c:otherwise>
													</c:choose>

												</div>
											</div>
										</div>
									</div>
								</div>
								<c:set var="countCourse" value="${countCourse + 1 }"></c:set>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- Footer -->
	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<div class="row align-items-center g-0 border-top py-2">
				<!-- Desc -->
				<div class="col-md-6 col-12 text-center text-md-start">
					<span> © <span id="copyright"> <script>
						document.getElementById("copyright").appendChild(
								document.createTextNode(new Date()
										.getFullYear()));
					</script>
					</span> Geeks. All Rights Reserved.
					</span>
				</div>
				<!-- Links -->
				<div class="col-12 col-md-6">
					<nav
						class="nav nav-footer justify-content-center justify-content-md-end">
						<a class="nav-link active ps-0" href="#!">Privacy</a> <a
							class="nav-link" href="#!">Terms</a> <a class="nav-link"
							href="#!">Feedback</a> <a class="nav-link" href="#!">Support</a>
					</nav>
				</div>
			</div>
		</div>
	</footer>


	<!-- Scroll top -->
	<div class="btn-scroll-top">
		<svg class="progress-square svg-content" width="100%" height="100%"
			viewBox="0 0 40 40">
        <path
				d="M8 1H32C35.866 1 39 4.13401 39 8V32C39 35.866 35.866 39 32 39H8C4.13401 39 1 35.866 1 32V8C1 4.13401 4.13401 1 8 1Z" />
    </svg>
	</div>
	<script>
		let number = $
		{
			course.cost
		};
		let formattedNumber = number.toLocaleString('en-US');
		const cost = document.querySelector(".price-container span");
		cost.textContent = formattedNumber;
	</script>
	<!-- Scripts -->
	<!-- Libs JS -->
	<script src="../assets/libs/%40popperjs/core/dist/umd/popper.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="../assets/js/theme.min.js"></script>


	<script src="../assets/libs/tippy.js/dist/tippy-bundle.umd.min.js"></script>

	<script src="../assets/js/vendors/tooltip.js"></script>
	<script src="../assets/libs/glightbox/dist/js/glightbox.min.js"></script>
	<script src="../assets/js/vendors/glight.js"></script>
</body>


</html>