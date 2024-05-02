<%@page import="hcmute.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
Long count = (Long) request.getAttribute("countcourse.course");
%>
<%
User user = (User) session.getAttribute("user");
%>

<%
int countAddToCart = (int) request.getAttribute("countAddToCartByUser");
%>

<%
int networth = (int) request.getAttribute("networth");
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

.adminkhoahoc-course.course--detail:hover {
	cursor: pointer;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

.adminkhoahoc-course.course--detail {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0
		rgba(0, 0, 0, 0.05);
}

.card-text {
	display: -webkit-box;
	overflow: hidden;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.adminkhoahoc-course.course--detail {
	margin-bottom: 60px;
	margin-right: 40px;
}

.button-delete-course.course:hover {
	color: red;
}
</style>






	<section class="container-fluid p-4">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-12">
				<!-- Page header -->
				<div class="border-bottom pb-3 mb-3">
					<div class="mb-2 mb-lg-0">
						<h1 class="mb-0 h2 fw-bold">Giỏ hàng</h1>

					</div>
				</div>
			</div>
		</div>
		<!-- row -->
		<div class="row">
			<div class="col-12 mb-2">
				
			</div>
			<div class="col-lg-8">
				<!-- card -->
				<div class="card">
					<!-- card header -->
					<div class="card-header">
						<div class="d-flex">
							<!-- heading -->
							<h4 class="mb-0">
								Giỏ hàng <span>(<%=countAddToCart%> khóa học)
								</span>
							</h4>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive table-card">
							<!-- Table -->
							<table class="table mb-0 text-nowrap">
								<!-- Table Head -->
								<thead class="table-light">
									<tr>
										<th>Khóa học</th>
										<th>Giá</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<!-- Table body -->
									<c:set var="totalCost" value="0" />
									<c:forEach var="i" items="${course }">
										<input class="d-none courseItem" name="courseId"
											value="${i.course.courseId}">
										<tr>
											<td>
												<div class="d-flex align-items-center">
													<div>
														<img
															onerror="setDefaultImage(this)"
															src="<c:url value='/image?fname=${folder}/${i.course.image}'/>"
															alt="sss" class="img-fluid item-img">
													</div>
													<div class="ms-4 mt-2 mt-lg-0">
														<h4 class="mb-1 text-primary-hover">${i.course.courseName }</h4>
														<ul class="list-inline">
															<li class=" list-inline-item align-text-top">
																<div class="d-flex gap-5">
																	<c:forEach var="lesson" items="${i.course.lessons}">
																		<c:forEach var="enrrol_lesson"
																			items="${lesson.enrrolLesson }">

																			<c:set var="totalStars" value="0" />
																			<c:set var="count" value="0" />
																			<c:forEach var="lesson" items="${i.course.lessons}">
																				<c:forEach var="enrrol_lesson"
																					items="${lesson.enrrolLesson}">
																					<c:set var="totalStars"
																						value="${totalStars +enrrol_lesson.numberOfStar}" />
																					<c:set var="count" value="${count + 1}" />
																				</c:forEach>
																			</c:forEach>
																			<c:choose>
																				<c:when test="${count > 0}">
																					<c:set var="averageStars"
																						value="${totalStars / count}" />
																					<c:set var="roundedAverage">
																						<c:out
																							value="${(averageStars - (averageStars mod 1)) + (averageStars mod 1 > 0 ? 1 : 0)}" />
																					</c:set>
																				</c:when>
																			</c:choose>
																		</c:forEach>
																	</c:forEach>
																	<div class="stars rating-star"
																		data-rating="${roundedAverage}"></div>
																</div>
															</li>
														</ul>

													</div>
												</div>
											</td>

											<td style="vertical-align: middle;">
												<h4 class="mb-0">
													<fmt:formatNumber value="${i.course.cost}"
														pattern="###,### VNĐ" />
												</h4>
											</td>
											<td style="vertical-align: middle;">

												<div class="col-auto">
													<c:choose>
														<c:when test="${user ne null}">
															<!-- User is logged in, submit the form -->
															<form action="deleteToCart" method="post">
																<input type="hidden" name="cartId" value="${i.cartId }">
																<button type="submit"
																	style="border: none; background: none;">
																	<i class="fe fe-trash-2 fs-4" style="color: red;"></i>
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

											</td>



										</tr>
										<c:set var="totalCost" value="${totalCost + i.course.cost}" />
									</c:forEach>
									<tr>

										<td class="align-middle border-top-0 border-bottom-0">
											<h4 class="mb-0">Tổng tiền:</h4>
										</td>
										<td
											class="align-middle border-top-0 border-bottom-0 text-center">
											<span class="fs-4">Số lượng: <%=countAddToCart%></span>
										</td>
										<td>
											<h4 class="mb-0">
												<fmt:formatNumber value="${totalCost}" pattern="###,### VNĐ" />
											</h4>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="mt-4 d-flex justify-content-between">
					<a href="course" class="btn btn-outline-primary">Khóa học khác</a>

					<form action="order" method=get>
						<input name="listCourseId" value="" id="listCourseId"
							class="d-none">
						<button class="btn btn-primary">Thanh toán</button>
					</form>
				</div>
			</div>
			<div class="col-lg-4">
				<!-- card -->
				<div class="card mb-4 mt-4 mt-lg-0">
					<div class="card-body">

						<li
							class="list-group-item px-0 d-flex justify-content-between fs-5 text-dark fw-medium">
							<h4>
								Số dư: </span> <span><fmt:formatNumber
										value="<%=networth%>" pattern="###,### VNĐ" />
							</h4>
						</li>
					</div>


				</div>
				<!-- card -->
				<div class="card mb-4">
					<!-- card body -->
					<div class="card-body">
						<!-- text -->
						<h4 class="mb-3">Tổng hóa đơn</h4>
						<!-- list group -->
						<ul class="list-group list-group-flush">
							<!-- list group item -->
							<li
								class="list-group-item px-0 d-flex justify-content-between fs-5 text-dark fw-medium">
								<span>Giá gốc :</span> <span><fmt:formatNumber
										value="${totalCost}" pattern="###,### VNĐ" /></span>
							</li>
							<!-- list group item -->
							<li
								class="list-group-item px-0 d-flex justify-content-between fs-5 text-dark fw-medium">
								<span> Khuyến mãi <span>(GKDIS15%)</span> <c:set
										var="discount" value="0" />
							</span> <span><fmt:formatNumber value="${discount}"
										pattern="###,### VNĐ" /></span>
							</li>
							
						</ul>
					</div>
					<!-- card footer -->
					<c:set var="total" value="${totalCost - discount}" />
					<div class="card-footer">
						<div
							class="px-0 d-flex justify-content-between fs-5 text-dark fw-semibold">
							<span>Tổng cộng (VNĐ)</span> <span><fmt:formatNumber
									value="${total}" pattern="###,### VNĐ" /></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<style>
		.item-img{
			width: 150px;
			height: 100px;
			object-fit: cover;
			object-position: center;
			border-radius: 3px;
		}
	</style>
	<script>
		var courseHtml = document.querySelector("#listCourseId");
		let listId="";
		document.querySelectorAll(".courseItem").forEach(courseId=>{
			listId = listId + courseId.value + "&";
		})
		courseHtml.setAttribute("value", listId);
	
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
</body>
</html>