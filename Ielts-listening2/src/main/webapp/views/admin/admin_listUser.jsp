<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ page import="javax.servlet.jsp.PageContext"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="../../assets/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css"
	rel="stylesheet" />
<link
	href="../../assets/libs/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css"
	rel="stylesheet" />
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Codescandy" />

<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon"
	href="../../assets/images/favicon/favicon.ico" />

<!-- darkmode js -->
<script src="../../assets/js/vendors/darkMode.js"></script>

<!-- Libs CSS -->
<link href="../../assets/fonts/feather/feather.css" rel="stylesheet" />
<link
	href="../../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css"
	rel="stylesheet" />
<link href="../../assets/libs/simplebar/dist/simplebar.min.css"
	rel="stylesheet" />

<!-- Theme CSS -->
<link rel="stylesheet" href="../../assets/css/theme.min.css">

<link rel="canonical" href="datatables.html" />

<title>Datatables | Geeks - Academy Admin Template</title>
</head>
<body>
	<style>
.info-user:hover {
	cursor: pointer;
}
</style>
	<section class="container-fluid p-4">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-12">
			</div>
		</div>



		<section class="container-fluid p-4">



			<div class="row">
				<!-- basic table -->
				<div class="col-md-12 col-12 mb-5">
					<div class="card">
						<!-- card header  -->
						<div class="card-header">
							<h4 class="mb-1">Danh sách người dùng</h4>
							<p class="mb-0">dưới đây là toàn bộ danh sách người dùng của trang web chúng tôi</p>
						</div>
						<!-- table  -->
						<div class="card-body">
							<div class="table-card">
								<table id="dataTableBasic" class="table table-hover"
									style="width: 100%">
									<thead class="table-light">
										<tr>
											<th>Name</th>
											<th>User Name</th>
											<th>Date Of Birth</th>
											<th>Email</th>
											<th>Phone Number</th>
											<th>Address</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="i" items="${currentUser}">
											<tr
												onclick="location.href='/Ielts-listening2/admin/capnhattaikhoan?userId=${i.userId}'">
												<td>${i.name}</td>
												<td>${i.account.userName}</td>
												<td>${i.dateOfBirth}</td>
												<td>${i.email}</td>
												<td>${i.phoneNumber}</td>
												<td>${i.address}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section>

</body>
</html>