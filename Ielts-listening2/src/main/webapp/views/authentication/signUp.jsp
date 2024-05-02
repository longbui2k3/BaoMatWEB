<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Add Bootstrap CSS Link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-xl-6 col-xxl-6">
				<img class="img-fluid" src="https://prep.vn/imgs/desk.png"
					style="height: 100%;">
			</div>
			<div class="col-md-6 col-xl-6 col-xxl-6">
				<div class="text-center">
					<p class="fw-bold fs-5">Đăng Ký</p>
				</div>
				<form class="p-4" action="authentication-signup" method="post">
					<div class="mb-4">
						<label for="email" class="form-label mb-2 text-secondary">
							Email <span class="text-danger">*</span>
						</label>
						<div class="input-group">
							<input id="email" name="email" class="form-control" type="text"
								placeholder="Nhập email">
						</div>
					</div>
					<div class="mb-4">
						<label for="username" class="form-label mb-2 text-secondary">
							Username <span class="text-danger">*</span>
						</label>
						<div class="input-group">
							<input id="username" name="userName" class="form-control"
								type="text" placeholder="Nhập username">
						</div>
					</div>
					<div class="mb-4">
						<label for="pwd" class="form-label mb-2 text-secondary">
							Mật khẩu <span class="text-danger">*</span>
						</label>
						<div class="input-group">
							<input id="pwd" name="passWord" class="form-control"
								type="password" placeholder="Nhập mật khẩu">
							<button onclick="handleToggleShowPassword()"
								class="bg-white border" type="button">
								<div style="width: 35px">
									<i id="icon__show" class="far fa-eye"></i> <i
										style="display: none" id="icon__hide" class="far fa-eye-slash"></i>
								</div>
							</button>
						</div>
					</div>
					<div class="mb-4">
						<label for="pwd-confirm" class="form-label mb-2 text-secondary">
							Xác nhận mật khẩu <span class="text-danger">*</span>
						</label>
						<div class="input-group">
							<input id="pwd-confirm" class="form-control" type="password"
								placeholder="Xác nhận mật khẩu">
							<button onclick="handleToggleShowConfirmPassword()"
								class="bg-white border" type="button">
								<div style="width: 35px">
									<i id="icon__show-confirm" class="far fa-eye"></i> <i
										style="display: none" id="icon__hide-confirm"
										class="far fa-eye-slash"></i>
								</div>
							</button>
						</div>
					</div>
					<div class="my-4">
						<form method="post">
							<button class="btn btn-primary fw-bold w-100 " type="submit">
								Đăng ký</button>
						</form>
					</div>
					<span class="text-primary"> Đã có tài khoản? <a
						class="text-decoration-underline" href="authentication-login"><strong>Đăng
								nhập</strong></a></span>
				</form>
			</div>
		</div>
	</div>

	<!-- Add Bootstrap JS and Popper.js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
	<script>
		const message = "${message}";
		if (message && message.trim() !== "") {
			// If the message is not empty, show it as a toast
			showToast(message);
		}
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// Lấy các trường input
							const userName = document
									.getElementById("username");
							const passwordInput = document
									.getElementById("pwd");
							const confirmPasswordInput = document
									.getElementById("pwd-confirm");
							// Lấy form và thêm sự kiện submit
							const form = document.querySelector("form");
							form
									.addEventListener(
											"submit",
											function(event) {
												if (userName.value.trim() === "") {
													console
															.log(
																	userName,
																	passwordInput.value,
																	confirmPasswordInput.value);
													event.preventDefault(); // Ngăn chặn form submit
													showToast("Chưa nhập Username kìa");
												} else if (!validatePassword(passwordInput.value)) {
													event.preventDefault(); // Ngăn chặn form submit
													showToast("Mật khẩu dài tối thiểu 8 ký tự và ít nhất 1 chữ thường");
												} else if (passwordInput.value !== confirmPasswordInput.value) {
													event.preventDefault(); // Ngăn chặn form submit
													showToast("Mật khẩu và xác nhận mật khẩu không khớp!");
												}
											});
						});
		function validatePassword(password) {
			const lowercaseRegex = /[a-z]/;
			const numberRegex = /\d/;

			if (password.length >= 8 && lowercaseRegex.test(password)
					&& numberRegex.test(password)) {
				return true; // Password is valid
			} else {
				return false; // Password is invalid
			}
		}
		function showToast(message) {
			// Tạo một toast message
			const toast = document.createElement("div");
			toast.classList.add("show", "toast", "position-fixed", "top-0",
					"end-0", "end-0");
			toast.setAttribute("role", "alert");
			toast.setAttribute("aria-live", "assertive");
			toast.setAttribute("aria-atomic", "true");
			toast.setAttribute("style", "border-left:4px solid red")

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
		}

		function handleToggleShowPassword() {
			const passwordInput = document.getElementById("pwd");
			const showBtn = document.getElementById("icon__show");
			const hideBtn = document.getElementById("icon__hide");
			if (passwordInput.type === "password") {
				passwordInput.type = "text"; // Change the input type to text to reveal the password
				showBtn.style.display = "none"; // Hide the show button
				hideBtn.style.display = "block"; // Show the hide button

			} else {
				passwordInput.type = "password"; // Change it back to password to hide the password
				showBtn.style.display = "block"; // Show the show button
				hideBtn.style.display = "none"; // Hide the hide button
			}
		}

		function handleToggleShowConfirmPassword() {
			const passwordInput = document.getElementById("pwd-confirm");
			const showBtn = document.getElementById("icon__show-confirm");
			const hideBtn = document.getElementById("icon__hide-confirm");
			if (passwordInput.type === "password") {
				passwordInput.type = "text"; // Change the input type to text to reveal the password
				showBtn.style.display = "none"; // Hide the show button
				hideBtn.style.display = "block"; // Show the hide button

			} else {
				passwordInput.type = "password"; // Change it back to password to hide the password
				showBtn.style.display = "block"; // Show the show button
				hideBtn.style.display = "none"; // Hide the hide button
			}
		}
	</script>

</body>
</html>
