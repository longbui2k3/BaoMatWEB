<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<!-- navbar -->
		<nav class="navbar-default navbar navbar-expand-lg">
			<a id="nav-toggle" href="#"> <i class="fe fe-menu"></i>
			</a> <span style="margin-left: 10px">Hello, Admin !</span>
			<!--Navbar nav -->
			<div class="ms-auto d-flex gap-4 align-items-center">
				<div class="dropdown">
					<button
						class="btn btn-light btn-icon rounded-circle d-flex align-items-center"
						type="button" aria-expanded="false" data-bs-toggle="dropdown"
						aria-label="Toggle theme (auto)">
						<i class="bi theme-icon-active"></i> <span
							class="visually-hidden bs-theme-text">Toggle theme</span>
					</button>
					<ul class="dropdown-menu dropdown-menu-end shadow"
						aria-labelledby="bs-theme-text">
						<li>
							<button type="button"
								class="dropdown-item d-flex align-items-center"
								data-bs-theme-value="light" aria-pressed="false">
								<i class="bi theme-icon bi-sun-fill"></i> <span class="ms-2">Light</span>
							</button>
						</li>
						<li>
							<button type="button"
								class="dropdown-item d-flex align-items-center"
								data-bs-theme-value="dark" aria-pressed="false">
								<i class="bi theme-icon bi-moon-stars-fill"></i> <span
									class="ms-2">Dark</span>
							</button>
						</li>
						<li>
							<button type="button"
								class="dropdown-item d-flex align-items-center active"
								data-bs-theme-value="auto" aria-pressed="true">
								<i class="bi theme-icon bi-circle-half"></i> <span class="ms-2">Auto</span>
							</button>
						</li>
					</ul>
				</div>
				<form action=logout method="post">
					<button class="btn btn-light">Đăng Xuất</button>
				</form>
			</div>
		</nav>
	</div>
</body>
</html>