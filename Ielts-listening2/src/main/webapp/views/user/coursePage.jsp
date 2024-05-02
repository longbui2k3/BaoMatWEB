<%@page import="hcmute.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
Long count = (Long) request.getAttribute("countCourse");
%>
<%
User user = (User) session.getAttribute("user");
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
	<section class="py-6">
		<div class="">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-12 mb-4">
					<div
						class="row d-md-flex justify-content-between align-items-center">
						<div class="col-md-6 col-lg-8 col-xl-7 d-flex">
							<h4 class="mb-3 mb-md-0 mt-2"><%=count%>
								Khóa Học
							</h4>
							<div class="input-group ms-5" style="width: 400px;">
								<span class="input-group-text" id="basic-addon1"
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
						</div>
						<div class="d-inline-flex col-md-6 col-lg-4 col-xl-5">
							<div class="me-2">
								<!-- Nav -->
								<div class="nav btn-group flex-nowrap" role="tablist">
									<button id="gridButton" class="btn btn-outline-secondary"
										data-bs-toggle="tab" data-bs-target="#tabPaneGrid" role="tab"
										aria-controls="tabPaneGrid" aria-selected="true">
										<span class="fe fe-grid"></span>
									</button>
									<button id="listButton" class="btn btn-outline-secondary"
										data-bs-toggle="tab" data-bs-target="#tabPaneList" role="tab"
										aria-controls="tabPaneList" aria-selected="false">
										<span class="fe fe-list"></span>
									</button>
								</div>
							</div>
							<div class="ms-2 d-flex  adminkhoahoc-filter--rate ">
								<p class="my-auto">Đánh giá:</p>
								<div class="dropdown dropdown-rate my-auto ms-2">
									<button
										class="btn bg-color-white dropdown-toggle border border-secondary-subtle"
										type="button" data-bs-toggle="dropdown" aria-expanded="false"
										style="width: 160px">
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
										<li><a class="dropdown-item" href="?rate=caodenthap">Cao
												đến thấp</a></li>
										<li><a class="dropdown-item" href="?rate=thapdencao">Thấp
												đến cao</a></li>
										<li><a class="dropdown-item" href="?">Mặc định</a></li>
									</ul>
								</div>
							</div>
							<div class="ms-4 d-flex  adminkhoahoc-filter--gia ">
								<p class="my-auto">Giá:</p>
								<div class="dropdown dropdown-gia my-auto ms-2">
									<button
										class="btn bg-color-white dropdown-toggle border border-secondary-subtle "
										type="button" data-bs-toggle="dropdown" aria-expanded="false"
										style="width: 160px">
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
									<div class="col-lg-3 col-md-6 col-12 " data-bs-toggle="popover"
										data-bs-trigger="hover focus" title="${i.courseName}"
										data-bs-content="${i.description}">
										<div class="card mb-4 card-hover">
												<a href="course-detail?courseId=${i.courseId}">
												<img onerror="setDefaultImage(this)"
													style="height: 200px; object-fit: cover;"
													src="<c:url value='/image?fname=courseIMG/${ i.image}'/>"
													alt="course" class="card-img-top img-fluid"></a>
											
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
												href="course-detail?courseId=${i.courseId}"><img
												style="height: 200px; object-fit: cover;"
												src="<c:url value='/image?fname=courseIMG/${ i.image}'/>"
												alt="course" class="img-fluid w-100"></a>
										</c:if>
										<c:if test="${i.image == null}">
											<a
												class="col-12 col-md-12 col-xl-3 col-lg-3 bg-cover img-left-rounded"
												href="course-detail?courseId=${i.courseId}"><img
												style="height: 200px; object-fit: cover;"
												src="https://th.bing.com/th/id/OIP.xaADddZHWRoU3TbjEVGssQHaFj?rs=1&pid=ImgDetMain"
												alt="course" class="img-fluid w-100"></a>
										</c:if>
										<div class="col-lg-9 col-md-12 col-12">
											<!-- Card body -->
											<div class="card-body">
												<h3 class="mb-2 text-truncate-line-2">
													<a href="course-detail?courseId=${i.courseId }"
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
															</div></li>
												</ul>
												<div class="d-flex align-items-center gap-3">
													<p class="card-text color-blue--primary fw-bold fs-5">
														<fmt:formatNumber value="${i.cost}" pattern="###,### VNĐ" />
													<p class="card-text fw-bold fs-5"
														style="color: rgb(113, 113, 113)"></p>
													</p>
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
												<div></div>
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
	    function showLoginPopup() {
	        // Add your logic to show a login popup or redirect to the login page
	        showToast("Please log in to add to cart!");
	    }
	   
	    function showToast(message) {
	        // Tạo một toast message
	        const toast = document.createElement("div");
	        toast.classList.add("show", "toast", "position-fixed", "top-0", "end-0", "end-0");
	        toast.setAttribute("role", "alert");
	        toast.setAttribute("aria-live", "assertive");
	        toast.setAttribute("aria-atomic", "true");
	        toast.setAttribute("style", "border-left:4px solid red; z-index:3");
	        // Tạo nội dung toast
	        const toastBody = document.createElement("div");
	        toastBody.classList.add("toast-body");
	        toastBody.innerText = message;
	        // Thêm nội dung vào toast và toast vào trang
	        toast.appendChild(toastBody);
	        document.body.appendChild(toast);
	        // Hiển thị toast
	        const bootstrapToast = new bootstrap.Toast(toast);
	        bootstrapToast.show();
	        // Ẩn toast sau 5 giây
	        setTimeout(function () {
	            bootstrapToast.hide();
	        }, 5000);
	        // Thêm event listener để ẩn toast khi người dùng click vào nó
	        toast.addEventListener("click", function () {
	            bootstrapToast.hide();
	        });
	    }
	   
	    function formatMoneyVND(amount) {
	    	  // Check if the input is a valid number
	    	  if (isNaN(amount)) {
	    	    return 'Invalid input';
	    	  }
	    	  // Convert the number to a string and split it into integer and decimal parts
	    	  const [integerPart, decimalPart] = amount.toFixed(0).toString().split('.');
	    	  // Add commas to the integer part for thousand separators
	    	  const formattedIntegerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	    	  // Combine the formatted integer part with the decimal part and add the VND symbol
	    	  const formattedAmount = formattedIntegerPart + (decimalPart ? '.' + decimalPart : '') + ' VND';
	    	  return formattedAmount;
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
</body>
</html>

