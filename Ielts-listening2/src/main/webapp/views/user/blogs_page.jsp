<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="vi">

<!-- Mirrored from geeksui.codescandy.com/geeks/pages/landings/landing-courses.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Nov 2023 06:34:48 GMT -->
<head>
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

<link rel="canonical" href="admin-cms-post.html">
<title>Blogs</title>



</head>

<body class="bg-white">

    <!-- Page content -->
    <main>
        <!-- Page header -->
        <section class="py-8">
          <div class="container">
            <div class="row">
              <div class="offset-xl-2 col-xl-8 offset-lg-1 col-lg-10 col-md-12 col-12">
                <div class="text-center mb-5">
                  <h1 class="display-2 fw-bold">Blogs</h1>
                </div>
                
              </div>
            </div>
          </div>
        </section>
        <!-- Content -->
        <section class="pb-8">
        	<div style=" display: flex;justify-content: flex-end;">
	          <div class="input-group" style="width: 400px; margin-bottom: 50px; margin-right: 60px;">
				<span class="input-group-text px-3 boDescription for topic 1rder-0"
					id="basic-addon1"
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
          <div class="container">
            <div class="row">
              <div class="col-xl-12 col-lg-12 col-md-12 col-12">
                
              </div>
              <div class="col-xl-12 col-lg-12 col-md-12 col-12">
                <!-- Card -->
                <div class="card mb-4 shadow-lg card-lift">
                  <div class="row g-0">
                    <!-- Image -->
                    <a href="blog-single.html" class="col-lg-8 col-md-12 col-12 bg-cover img-left-rounded" style="background-image: url(https://images.unsplash.com/photo-1589224906659-03c8b0af4f7c?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D)">
                      <img src="../assets/images/blog/blogpost-2.jpg" class="img-fluid d-lg-none invisible" alt="blogpost " />
                    </a>
                    <div class="col-lg-4 col-md-12 col-12">
                      <!-- Card body -->
                      <div class="card-body">
                        <p class="fs-5 mb-3 fw-semibold d-block">Blogs</p>
                        <h1 class="mb-2 mb-lg-4"><a href="blog-single.html" class="text-inherit">Luyện nghe cùng ELIS</a></h1>
                        <p>Our features, journey, tips and us being us. Lorem ipsum dolor sit amet, accumsan in, tempor dictum neque.</p>
                        <!-- Media content -->
                        <div class="row align-items-center g-0 mt-lg-7 mt-4">
                          <div class="col-auto">
                            <!-- Img  -->
                            <img src="../assets/images/avatar/avatar-6.jpg" alt="avatar" class="rounded-circle avatar-sm me-2" />
                          </div>
                          <div class="col lh-1">
                            <h5 class="mb-1">ELIS</h5>
                            <p class="fs-6 mb-0">September 13, 2020</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
			
            <c:forEach var="blog" items="${listBlog}">
                <div class="col-xl-4 col-lg-4 col-md-6 col-12">
                    <div class="card mb-4 shadow-lg card-lift">
                        <a href="<c:url value='/user/blog-content?id=${blog.blogId}'/>">
                        <img onerror="setDefaultImage(this)" src="<c:url value='/image?fname=${topicIMG}/${blog.image}'/>" class="card-img-top" alt="blogpost " />
                        </a>
                        <div class="card-body">
                        <p class="fs-5 mb-2 fw-semibold d-block text-success">Blogs</p>
                        <h3><a href="<c:url value='/user/blog-content?id=${blog.blogId}'/>" class="blog-content__text blog-title__text text-primary text-inherit">${blog.title}</a></h3>
                        <div class="blog-content__text">${blog.content}</div>
                        <div class="row align-items-center g-0 mt-4">
                            <div class="col-auto">
                            <img onerror="setDefaultImage(this)" src="<c:url value='/image?fname=${avatarIMG}/${blog.users.image}'/>" alt="avatar" 
                              class="rounded-circle avatar-sm me-2" onerror="this.onerror=null; this.src=''"/>
                            </div>
                            <div class="col lh-1">
                            <h5 class="mb-1">${blog.users.name}</h5>
                            <p class="fs-6 mb-0">${blog.createdDate}</p>
                            </div>
                            <div class="col-auto">
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
              <!-- Buttom -->
              
            </div>
          </div>
          <c:if test="${listBlog.size() > 0}">
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
					<div class="position-absolute top-0 end-0 mt-4 fs-5">
						<input type="number"
							class="input__pageNum bg-white py-2 px-2 me-2 rounded-3 text-center border-0"
							max="10" min="1" value='${param.page == null ? 1 : param.page}'
							style="width: 50px; height: 50px;" /> của ${pageNum}
						<button class="btn__page--min btn--2 px-2 ms-4 rounded-3 border-0"
							style="width: 50px; height: 50px;">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="24"
									height="24" fill="currentColor"
									class="bi bi-arrow-bar-left mb-1" viewBox="0 0 16 16">
		  							<path fill-rule="evenodd"
										d="M12.5 15a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5ZM10 8a.5.5 0 0 1-.5.5H3.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L3.707 7.5H9.5a.5.5 0 0 1 .5.5Z" />
								</svg>
							</span>
						</button>
						<button class="btn__page--max btn--2 px-2 ms-2 rounded-3 border-0"
							style="width: 50px; height: 50px;">
							<span> <svg xmlns="http://www.w3.org/2000/svg" width="24"
									height="24" fill="currentColor"
									class="bi bi-arrow-bar-right mb-1" viewBox="0 0 16 16">
		 							 <path fill-rule="evenodd"
										d="M6 8a.5.5 0 0 0 .5.5h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L12.293 7.5H6.5A.5.5 0 0 0 6 8Zm-2.5 7a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5Z" />
								</svg>
							</span>
						</button>
					</div>
				</div>
			</c:if>
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
    .card-img-top{
      width: 100%;
      aspect-ratio: 3/2;
      object-fit: cover;
      object-position: center;
    }
    .blog-content__text{
      display: none;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 2;
      overflow: hidden;
    }
  </style>
  <script>
  const params = new URLSearchParams(document.location.search);
  let page = params.get("page") ? params.get("page"):'1';
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

	<!-- Libs JS -->
	<script src="../assets/libs/%40popperjs/core/dist/umd/popper.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script src="../../assets/js/theme.min.js"></script>
	<script src="../assets/js/vendors/validation.js"></script>


</body>
</html>
