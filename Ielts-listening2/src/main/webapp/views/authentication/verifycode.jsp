<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<!-- Add Bootstrap CSS Link -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/font-awesome.css" />

<style>
</style>
</head>
<body>
	<div class="container-fluid  bg-light">
		<div class="row justify-content-start pt-5 pt-lg-0">
			<div class="col-lg-5 col-xl-6 col-xxl-5 text-left py-5 p-4">
				<div class="col-xl-7 col-xxl-6">
					<img class="img-fluid" src="https://prep.vn/imgs/login/decor.png">
				</div>
				<h3 class="fw-bold text-primary fs-4">Miễn Phí Kiểm Tra Trình
					Độ</h3>
				<p class="col-xxl-9 col-xxl-9 mt-3 text-secondary fs-5">
					Kiểm tra trình độ hoàn toàn miễn phí.<br>Chỉ cần 1 tài khoản
					duy nhất, bạn có thể thực hiện các bài<br>Kiểm Tra Đầu Vào để
					xác định trình độ nhanh chóng.
				</p>
			</div>
			<div class="col-lg-2 col-xl-1 col-xxl-1"></div>
			<div class="col-lg-5 col-xl-5 px-4 py-5">
				<div class="bg-white p-4 rounded-3">
					<div class="text-center">
						<p class="fw-bold fs-5 mb-2">Xác thực OTP</p>
						<p class="fs-6 mb-1">Mã OTP đã được gửi đến Email ${cookie['email'].value}</p>
						<p class="fs-6 mb-1">Vui lòng nhập mã xác nhận bên dưới</p>
					</div>
					<form action="authentication-verifycode" method="post">
						<div
							class="w-100 mt-4 mb-3 d-flex flex-row justify-content-between">
							<c:forEach var="i" begin="1" end="6" step="1">
								<input
									class="otp border border-success text-center fs-2 fw-bold mb-2" 
									style="height: 60px; width: 60px; border-radius: 10px;"
									name="otp${i}" type="text" autocomplete="none">
							</c:forEach>
						</div>
						<div class="mb-4">
							<button class="btn btn-primary fw-bold w-100" type="submit">Xác
								Nhận</button>
						</div>
						<div id="countdown" class="text-center mt-5"></div>
						<div id="turn" class="text-center text-danger" > số lần còn lại bạn được nhập  </div>
						<div class="text-center">
							Bạn chưa nhận được mã? <a style="text-decoration:none"
								href="http://localhost:8080/Ielts-listening2/authentication-resent">Gửi
								mã</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Bootstrap JS and Popper.js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
	<script>
		function getCookie(name) {
		    function escape(s) { return s.replace(/([.*+?\^$(){}|\[\]\/\\])/g, '\\$1'); }
		    var match = document.cookie.match(RegExp('(?:^|;\\s*)' + escape(name) + '=([^;]*)'));
		    return match ? match[1] : null;
		}
		console.log(getCookie("turn"));
		const turn = document.querySelector("#turn");
		if (getCookie("turn") === "0")
			turn.innerHTML="Bạn đã hết lượt nhập vui lòng quay về trang đăng ký!";
		else 
		turn.innerHTML="số lần còn lại bạn được nhập:"+getCookie("turn");
		
		const countdown = document.querySelector("#countdown");

		let startSeconds = 15*60 - parseInt((Date.now() - getCookie("createCodeAt")) / 1000);
		startSeconds = startSeconds > 0 ? startSeconds : 0;
		let startMinutes = parseInt(startSeconds / 60);
		startMinutes = startMinutes > 0 ? startMinutes : 0;
		startMinutes = startMinutes < 10 ? '0' + startMinutes : startMinutes;
		countdown.innerHTML = "Mã xác minh chỉ có hiệu lực trong " + startMinutes + ':' + (startSeconds % 60 < 10 ? '0' + startSeconds % 60 : startSeconds % 60);
		setInterval(countdownFunc, 1000);
		let minutes;
		let seconds;
		if (getCookie("code") === null) 
			window.location.replace('http://localhost:8080/Ielts-listening2/authentication-signup');
		function countdownFunc() {
			if (startSeconds > 0)	
				startSeconds -= 1;
			else {
				window.location.replace('http://localhost:8080/Ielts-listening2/authentication-signup');
				
			}
			minutes = Math.floor(startSeconds / 60);
			seconds = startSeconds % 60;
			minutes = minutes < 10 ? '0' + minutes : minutes;
			seconds = seconds < 10 ? '0' + seconds : seconds;
			countdown.innerHTML = "Mã xác minh chỉ có hiệu lực trong " + minutes + ':' + seconds;	
		}
	</script>
	<script>
		const otpList = document.querySelectorAll(".otp");
		if (otpList) {
			otpList.forEach((otp, index) => {
				otp.addEventListener("input", (e) => {
					if (otp.value.length > 1){
						otp.value = otp.value[0];
					}
					if (otp.value.length === 1 && index < 5)
						otpList[index + 1].focus();
					if (otp.value.length === 0 && index > 0) {
						otpList[index - 1].focus();
					}
				})
			})
		}
	</script>
	<script>
		
		const message = "${message}";
		if (message && message.trim() !== "") {
			// If the message is not empty, show it as a toast
			showToast(message);
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
		
		
	</script>
</body>
</html>
