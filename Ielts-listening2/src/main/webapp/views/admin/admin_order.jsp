<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body>
	<div class="header">
		<!-- navbar -->
	</div>
	<!-- Container fluid -->
	<section class="container-fluid p-4">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-12">
				<!-- Page header -->
				<div class="border-bottom pb-3 mb-3">
					<div>
						<h1 class="mb-1 h2 fw-bold">Hóa đơn</h1>
						<!-- Breadcrumb -->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="admin-dashboard.html">Dashboard</a></li>

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
						<h4 class="mb-1">Danh sách hóa đơn</h4>	
						<p class="mb-0">Khám phá sự tiện lợi - đặt hàng dễ dàng và nhanh chóng ngay hôm nay!</p>
					</div>
					<!-- table  -->
					<div class="card-body">
						<div class="table-card">
							<table id="dataTableBasic" class="table table-hover"
								style="width: 100%">
								<thead class="table-light">
									<tr>
										<th>Order</th>
										<th>Customer</th>
										<th>Items</th>
										<th>Payment</th>
										<th>Date</th>
										<th>Total</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach var="i" items="${list}">
										<tr>
											<c:set var="count" value="0"></c:set>
											<c:forEach var="detail" items="${i.payDetail}">
												<c:set var="count" value="${count + 1 }"></c:set>
											</c:forEach>
											<td><a href="od-detail?id=${i.paymentId}">${i.paymentId}</a></td>
											<td>${i.users.account.userName }</td>
											<td>${count} khóa</td>
											<td><span class="badge text-success bg-light-success">Paid</span></td>
											<td>${i.dateBuy}</td>
											<td>${i.cost}</td>
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
</body>

