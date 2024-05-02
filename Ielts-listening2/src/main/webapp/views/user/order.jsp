<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="container-fluid p-4">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-12">
				<!-- Page header -->
				<div class="border-bottom pb-3 mb-3">
					<div class="mb-2 mb-lg-0">
						<h1 class="mb-0 h2 fw-bold">Order Summary</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- row -->
		<div class="row justify-content-center">
			<div class="col-lg-8 col-12">
				<!-- card -->
				<div class="card">
					<!-- card body -->
					<div class="card-body">
						<div class="mb-6">
							<!-- heading -->
							<h2 class="mb-0">Thank you for your order</h2>
							<p class="mb-0">We appreciate your order, were currently
								processing it. So hard tight and we will send you confirmation
								very soon!</p>
						</div>
						<div>
							<div class="border-bottom mb-3 pb-3">
								<!-- text -->
								<div class="d-flex align-items-center">
									<h4 class="mb-0">Order tracking number</h4>
									<a href="#" class="ms-2 fw-semibold">ABC321C4D567FG</a>
								</div>
							</div>
							<!-- row -->
							<c:forEach var="course" items="${courseList }">
								<div class="row justify-content-between mb-5">
									<!-- col -->
									<div class="col-lg-8 col-12">
										<div class="d-md-flex">
											<!-- img -->
											<div>
												<img onerror="setDefaultImage(this)"
													src="<c:url value='/image?fname=${folder}/${course.image}'/>"
													alt="" class="img-4by3-xl rounded" />
											</div>
											<!-- text -->
											<div class="ms-md-4 mt-2">
												<h5 class="mb-1">${course.courseName}</h5>
												
											</div>
										</div>
									</div>
									<!-- price -->
									<div class="col-lg-4 col-12">
										<div class="d-flex justify-content-end mt-2">
											<fmt:formatNumber value="${course.cost}"
												pattern="###,### VNĐ" />
										</div>
									</div>
								</div>
								<c:set var="totalCost" value="${totalCost +course.cost}" />
							</c:forEach>


							<!-- hr -->
							<hr class="my-3" />
							<div>
								<!-- list -->
								<ul class="list-unstyled mb-0">

									<c:if test="${ networth< totalCost}">
										<li class="d-flex justify-content-between mb-2"><span>Ví
												của bạn</span> <span class="text-danger fw-medium"> <fmt:formatNumber
													value="${networth}" pattern="###,### VNĐ" />
										</span></li>
									</c:if>
									<c:if test="${ networth >= totalCost}">
										<li class="d-flex justify-content-between mb-2"><span>Tạm
												tính</span> <span class="text-success fw-medium"> <fmt:formatNumber
													value="${networth}" pattern="###,### VNĐ" />
										</span></li>
									</c:if>
									<li class="d-flex justify-content-between mb-2"><span>Tạm
											tính</span> <span class="text-secondary fw-medium"> <fmt:formatNumber
												value="${totalCost}" pattern="###,### VNĐ" />
									</span></li>
									<li class="d-flex justify-content-between mb-2"><span>Giảm
											giá</span> <span class="text-dark fw-medium">$0.00</span></li>

									<li class="border-top my-2"></li>
									<li class="d-flex justify-content-between mb-2"><span
										class="fw-medium text-dark">Tổng cộng</span> <span
										class="fw-medium text-dark"><fmt:formatNumber
												value="${totalCost}" pattern="###,### VNĐ" /></span></li>
								</ul>

								<c:if test="${networth < totalCost }">
									<button style="float: right;" class="btn btn-primary"
										onclick="showModel()">Xác nhận</button>
								</c:if>

								<c:if test="${networth >= totalCost }">
									<form action="confirmCheckout" method=post>
										<input name="totalCost" value="${totalCost }" class="d-none">
										<button style="float: right;" class="btn btn-primary">Xác
											nhận</button>
									</form>
								</c:if>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>


		<div id="shadow"
			class="position-fixed top-0 start-0 bottom-0 end-0 bg-dark"
			style="opacity: 0.5; z-index: 2; display: none;"
			onclick="hideShadow()"></div>

		<div
			style="min-width: 500px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); display: none; z-index: 3;"
			class=" modal-dialog modal-dialog-centered" id="model">
			<form action="updateNetworth" method=post>
				<div class="modal-content">
					<div
						class="modal-header bg-color-blue--primary color-white align-items-center">
						<h1 class="modal-title fs-5 text--title ps-2"
							id="exampleModalLabel">Số tiền của bạn không đủ</h1>
						<button type="button" onclick="hideShadow()" class="btn"
							data-bs-dismiss="modal">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
								viewBox="0 0 24 24" fill="none">
  										<path d="M18 6L6 18" stroke="white" stroke-width="2"
									stroke-linecap="square" stroke-linejoin="round" />
  										<path d="M6 6L18 18" stroke="white" stroke-width="2"
									stroke-linecap="square" stroke-linejoin="round" />
									</svg>
						</button>
					</div>
					<div class="modal-body my-3">
						<div class="col-12 mb-3 px-2">
							<lable for="inputName" class="form-lable text--h4">Số
							tiền cần nạp</lable>
							<input type="text" class="form-control shadow-none mt-2"
								id="inputnetworth" name="inputNetworth"
								placeholder="${totalCost-networth }">
						</div>
						<div class="d-flex flex-column align-items-center">
							<div class="px-2">
								<div class="card mb-3" style="height: 250px; width: 250px">
									<img
										src='<c:url value = "https://www.qr-code-generator.com/wp-content/themes/qr/images/banners/frames/websiteQRCode_noFrame.png"></c:url>' />
								</div>
							</div>
							<p class="text--description m-0">Quét mã QR để nạp tiền</p>
						</div>
					</div>
					<div class="modal-footer justify-content-center py-3">
						<button type="submit"
							class="btn text--description color-white bg-color-blue--primary">Hoàn
							tất</button>
					</div>
				</div>

			</form>
		</div>
	</section>


	<script>
		function showModel() {
			// Show the shadow
			document.getElementById("shadow").style.display = "block";
			document.getElementById("model").style.display = "block";
		}

		function hideShadow() {
			// Hide the shadow
			document.getElementById("shadow").style.display = "none";
			document.getElementById("model").style.display = "none";
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