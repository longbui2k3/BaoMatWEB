<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/common/taglib.jsp"%>



<body class="bg-white">
	<!-- Page content -->
	<main>
		<!-- Content -->
		<section class="py-7 py-lg-8">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-xl-8 col-lg-8 col-md-12 col-12 mb-2">
						<div class="text-center mb-4">
							<a href="#" class="fs-5 fw-semibold d-block mb-4 text-primary">Blog</a>
							<h1 class="display-3 fw-bold mb-4">${blog.title }</h1>
							<span class="mb-3 d-inline-block">4 min read</span>
						</div>
						<!-- Media -->
						<div
							class="d-flex justify-content-between align-items-center mb-5">
							<div class="d-flex align-items-center">
								<c:if test="${blog.users.image != null}">
									<img
										src='<c:url value='/image?fname=userAvatar/${blog.users.image}'/>'
										class="avatar-xl rounded-circle border border-4 border-white"
										alt="avatar" />
								</c:if>
								<div class="ms-2 lh-1">
									<h5 class="mb-1">${blog.users.name}</h5>
									<span class="text-primary">${blog.users.email}</span>
								</div>
							</div>
							<div>
								<span class="ms-2">Share</span> <a href="#" class="ms-2"> <svg
										xmlns="http://www.w3.org/2000/svg" width="14" height="14"
										fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
                                    <path
											d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z ">
                                </svg>
								</a> <a href="#" class="ms-2"> <svg
										xmlns="http://www.w3.org/2000/svg" width="14" height="14"
										fill="currentColor" class="bi bi-twitter" viewBox="0 0 16 16">
                                    <path
											d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z ">
                                </svg>
								</a> <a href="#" class="ms-2"> <svg
										xmlns="http://www.w3.org/2000/svg" width="14" height="14"
										fill="currentColor" class="bi bi-linkedin" viewBox="0 0 16 16">
                                    <path
											d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z ">
                                </svg>
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					<!-- Image -->
					<div class="col-xl-10 col-lg-10 col-md-12 col-12 mb-6">
						<img src="<c:url value='/image?fname=${folder}/${blog.image }'/>"
							alt="blogpost" class="img-fluid rounded-3 w-100 ">
						<h3 class="mt-4 lead text-dark">${blog.content}</h3>
					</div>
					<hr class="mt-lg-8 mb-lg-6 my-md-6 ">

				</div>
				<div class="row justify-content-center">
					<div class="col-xl-12 col-lg-8 col-md-12 col-12 mb-2">

						<!-- Container -->
						<div class="container">
							<div class="row">
								<div class="col-xl-12 col-lg-12 col-md-12 col-12">
									<div class="my-5">
										<h2>Bài viết nổi bật</h2>
									</div>
								</div>
								<c:forEach var="list" items="${listBlog}">
									<div class="col-xl-4 col-lg-4 col-md-6 col-12">
										<!-- Card -->
										<div class="card mb-4 shadow-lg card-lift">
											<a href="blog-content?id=${list.blogId }"><img
												src="<c:url value='/image?fname=${folder}/${list.image }'/>"
												class="card-img-top" alt="blogpost "></a>
											<!-- Card body -->
											<div class="card-body">
												<a href="blog-content?id=${list.blogId }"
													class="fs-5 fw-semibold d-block mb-3 text-primary">${list.title }</a>
												<div class="blog-content__text">${list.content }</div>
												<p></p>
												<!-- Media content -->
												<div class="row align-items-center g-0 mt-4">
													<div class="col-auto">
														<img src="../assets/images/avatar/avatar-1.jpg"
															alt="avatar" class="rounded-circle avatar-sm me-2 ">
													</div>
													<div class="col lh-1">
														<h5 class="mb-1">${list.users.name }</h5>
														<p class="fs-6 mb-0">${list.createdDate }</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
		</section>
	</main>

	<!-- Scroll top -->
	<div class="btn-scroll-top">
		<svg class="progress-square svg-content" width="100%" height="100%"
			viewBox="0 0 40 40">
		<path
				d="M8 1H32C35.866 1 39 4.13401 39 8V32C39 35.866 35.866 39 32 39H8C4.13401 39 1 35.866 1 32V8C1 4.13401 4.13401 1 8 1Z" />
		</svg>

	</div>
	<style>
.card-img-top {
	width: 100%;
	height: 200px;
	object-fit: cover;
	object-position: center;
}

.blog-content__text {
	display: none;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 2;
	overflow: hidden;
}
</style>
</body>

