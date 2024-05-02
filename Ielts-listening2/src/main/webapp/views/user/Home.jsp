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
	<link rel="shortcut icon" type="image/x-icon" href="../../assets/images/favicon/favicon.ico" />

	<!-- darkmode js -->
	<script src="../../assets/js/vendors/darkMode.js"></script>

	<!-- Libs CSS -->
	<link href="../../assets/fonts/feather/feather.css" rel="stylesheet" />
	<link href="../../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet" />
	<link href="../../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet" />

	<!-- Theme CSS -->
	<link rel="stylesheet" href="../assets/css/theme.min.css">

	<link rel="canonical" href="landing-courses.html">
	<link href="../assets/libs/tiny-slider/dist/tiny-slider.css" rel="stylesheet">
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<title>Trang chủ</title>
</head>

<body class="bg-white">
 <!-- Page Content -->
 
 	<!-- Hero Section -->
	<section class="py-lg-16 py-8">
    <!-- container -->
    	<div class="container">
        <!-- row -->
        	<div class="row align-items-center">
            <!-- col -->
            	<div class="col-lg-6 mb-6 mb-lg-0">
                	<div class="">
                    <!-- heading -->
                       	<h5 class="text-dark mb-4">
                       		<i class="fe fe-check icon-xxs icon-shape bg-light-success text-success rounded-circle me-2"></i>
                       			Nền tảng học trực tuyến đáng tin cậy nhất
                        </h5>
                          <!-- heading -->
                       <h1 class="display-3 fw-bold mb-3 text-dark">
                       		<span>Nền Tảng </span>
                       		<span class="text-primary">Học & Luyện Thi Listening</span>
                       		<span> Thông Minh</span>
                       </h1>
                        <!-- para -->
                       <p class="pe-lg-10 mb-5">PREP - sản phẩm công nghệ giúp bạn giải quyết gốc rễ của mọi rào cản học thi tiếng Anh và IELTS.
                       							Chương trình học trên Prep đã giúp 620+ học viên đạt IELTS 7.0 trở lên
												và 90+ học viên đạt 8.0 - 8.5.</p>
                          <!-- btn -> Register -->
                       <c:if test="${user == null}">
                       	<a href="../authentication-signup" class="btn btn-primary">Bắt đầu ngay</a>
                       </c:if>
                       <c:if test="${user != null}">
                       	<a href="course" class="btn btn-primary">Bắt đầu ngay</a>
                       </c:if>
                      
                       <a href="https://youtu.be/Wfo4JGPY7HA?si=YQAcPaBl9-ci84gN" class="glightbox fs-4 text-inherit ms-3"><img src="../assets/images/svg/play-btn.svg" alt="" class="me-2">Xem giới thiệu</a>


                     </div>
                 </div>
                 <!-- col -->
                 <div class="col-lg-6 d-flex justify-content-center">
                 <!-- images -->
                    <div class="position-relative">
                     <img src="../assets/images/background/acedamy-img/bg-thumb.svg" alt="" class=" ">
                     <img src="../assets/images/background/acedamy-img/girl-image.png" alt="" class=" position-absolute end-0 bottom-0">
                     <img src="../assets/images/background/acedamy-img/frame-1.svg" alt="" class=" position-absolute top-0 ms-lg-n10 ms-n19">
                     <img src="../assets/images/background/acedamy-img/frame-2.svg" alt="" class=" position-absolute bottom-0 start-0 ms-lg-n14 ms-n6 mb-n7">
                     <img src="../assets/images/background/acedamy-img/target.svg" alt="" class=" position-absolute bottom-0 mb-8 ms-n10 ms-lg-n1 ">
                     <img src="../assets/images/background/acedamy-img/sound.svg" alt="" class=" position-absolute top-0  start-0 mt-18 ms-lg-n19 ms-n8">
                     <img src="../assets/images/background/acedamy-img/trophy.svg" alt="" class=" position-absolute top-0  start-0 ms-lg-n14 ms-n5">

                    </div>
                 </div>
        	</div>
    	</div>
    </section>
	<!-- Features -->
	<section class="py-8">
		<div class="container mb-lg-8">
			<div class="row mb-8 justify-content-center">
				<div class="col-lg-8 col-md-12 col-12 text-center">
					<!-- caption -->
					<span class="text-primary mb-3 d-block text-uppercase fw-semibold ls-xl">Tại sao nên chọn PREP</span>
					<h2 class="mb-2 display-4 fw-bold text-dark">
						<span>Cải thiệt kỹ năng</span>
						<span class="text-primary"> Listening </span>
						<span>hiệu quả</span>
					</h2>
					<p class="lead mb-0">Bạn sẽ được tiếp cận với những phương pháp học mới, độc đáo. Kết quả bạn nhận được sẽ khiên scho bạn bất ngờ.</p>
				</div>
			</div>
			<!-- row -->
			<div class="row">
				<div class="col-lg-4 col-md-6 col-12">
					<!-- features -->
					<div class="feature mb-4 p-2">
						<span>
						<!-- icon -->
							<div class="display-4 text-primary">
								<i class="fe fe-play"></i>
							</div>
						<!-- para -->
							<div class="mt-2">
								<span>
								    <h3>Video bài giảng chất lượng cao</h3>
								    <p class="fs-4 mb-0">Bởi đội ngũ giáo viên xuất sắc và tận tâm IELTS 8.0 - 8.5,cựu du học sinh, tốt nghiệp tại các trường Đại học danh tiếng.</p>
								</span>
							</div>
							<svg preserveAspectRatio="none" viewBox="0 0 546.714 178.143"><path d="M546.214 89.072c0 48.917-122.162 88.571-272.857 88.571C122.662 177.643.5 137.988.5 89.072.5 40.155 122.662.5 273.357.5c150.695 0 272.857 39.655 272.857 88.572z"/></svg>
						</span>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<!-- features -->
					<div class="feature mb-4 p-2">
						<span>
						<!-- icon -->
							<div class="display-4 text-primary">
								<i class="fe fe-book"></i>
							</div>
						<!-- para -->
							<div class="mt-2">
								<span>
								    <h3>Đầy đủ bài mẫu, bài tập, mini test, progress test như thi thật</h3>
								    <p class="fs-4 mb-0">Bộ tài liệu đã giúp 600 học viên đã đạt IELTS 7.0-8.5 tính tới tháng 5/2021.</p>
								</span>
							</div>
							<svg preserveAspectRatio="none" viewBox="0 0 546.714 178.143"><path d="M546.214 89.072c0 48.917-122.162 88.571-272.857 88.571C122.662 177.643.5 137.988.5 89.072.5 40.155 122.662.5 273.357.5c150.695 0 272.857 39.655 272.857 88.572z"/></svg>
						</span>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<!-- features -->
					<div class="feature mb-4 p-2">
						<span>
						<!-- icon -->
							<div class="display-4 text-primary">
								<i class="fe fe-check-circle"></i>
							</div>
						<!-- para -->
							<div class="mt-2">
								<span>
								    <h3>Bài Listening được chấm nhanh chóng</h3>
								    <p class="fs-4 mb-0">Bài tập cũng như bài thi thử được chấm tự động. Điểm số được trả trực tiếp ngay sau khi học viên nộp bài.</p>
								</span>
							</div>
							<svg preserveAspectRatio="none" viewBox="0 0 546.714 178.143"><path d="M546.214 89.072c0 48.917-122.162 88.571-272.857 88.571C122.662 177.643.5 137.988.5 89.072.5 40.155 122.662.5 273.357.5c150.695 0 272.857 39.655 272.857 88.572z"/></svg>
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Top courses-->
	<section class="pt-8 pb-4 bg-light-gradient-bottom">
		<div class="container mb-lg-5">
			<div class="row">
				<div class="col-md-12">
					<div class="mb-5">
						<span class="text-primary mb-3 d-block text-uppercase fw-semibold ls-lg">Danh sách khóa học</span>
						<h2 class="mb-1 display-4 fw-bold">Các khóa học nổi bật</h2>
						<p class="mb-0 lead">Chọn từ 200 khóa học video trực tuyến với những bổ sung mới được xuất bản hàng tháng.</p>
					</div>
				</div>
			</div>
			<!-- List -->
			<div class="row">
				<div class="col-md-12">
					<div class="position-relative">
						<div class="slider">
							<div class="wrapper">
								<i id="left" class="fe fe-chevron-left"></i>
								<ul class="carousel">
								<c:forEach var="item" items="${course}">								
									<li class="card">
												<c:if test="${item.image != null}">
													<a class="w-100" href="course-detail?courseId=${item.courseId}">
													<img style="height: 200px; object-fit: cover;" onerror="setDefaultImage(this)"
													src="<c:url value='/image?fname=courseIMG/${ item.image}'/>" alt="course"
													class="card-img-top img-fluid"></a>
												</c:if>    
												<c:if test="${item.image == null}">
													<a class="w-100" href="listLesson?courseId=${item.courseId}"><img style="height: 200px; object-fit: cover;"
													src="https://th.bing.com/th/id/OIP.xaADddZHWRoU3TbjEVGssQHaFj?rs=1&pid=ImgDetMain" alt="course"
													class="card-img-top img-fluid"></a>
												</c:if>                                    <!-- Card Body -->
                                        <div class="card-body">
                                        	<h3 class="mb-2 text-truncate-line-2"><a href="course-single.html" class="text-inherit">${item.courseName}</a></h4>
                                            <span class="fs-5">${item.description}</span>       
                                            <!-- List -->
                                            
                                            <ul class="mb-0 list-inline "  >
                                          
                                                <li class="list-inline-item">
                                                     
                                                     <p class="card-text color-blue--primary fw-bold fs-5 mt-1"><fmt:formatNumber value="${item.cost}"
														pattern="###,### VNĐ" />
														
														<p class="card-text fw-bold fs-5"
															style="color: rgb(113, 113, 113)"></p>
														</p>
                                                </li>
                                            </ul>
                                            <div class="lh-1">
                                                <span class="align-text-top"> <span class="fs-6">
																<div class="d-flex gap-5">
																	<c:set var="totalStars" value="0" />
																		<c:set var="count" value="0" />
																		<c:forEach var="lesson" items="${item.lessons}">
																			<c:forEach var="enrrol_lesson"
																				items="${lesson.enrrolLesson}">
																				<c:set var="totalStars"
																					value="${totalStars + enrrol_lesson.numberOfStar}" />

																				<c:choose>
																					<c:when test="${enrrol_lesson.numberOfStar != 0}">
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
																	<span class="fs-6">(${count})</span>
																</div>
														</span>
                                                    </div>
                                                </div>
                                                
									</li>

								</c:forEach>
								</ul>
								<i id="right" class="fe fe-chevron-right"></i>
							</div>
						</div>
						<!-- btn -->
						<div class="col-md-12 text-center">
							<!-- btn -> Courses -->
							<a href="course" class="btn btn-primary">Xem tất cả các khóa học</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Instructor -->
	<section class="bg-light-gradient-top pt-4 pb-8">
		<div class="container my-lg-8">
			<div class="row justify-content-center">
				<!-- caption -->
				<div class="col-lg-8 col-md-12 col-12">
					<div class="mb-8 text-center">
						<span class="text-primary mb-3 d-block text-uppercase fw-semibold ls-xl">Đội ngũ chất lượng</span>
						<h2 class="mb-2 display-4 fw-bold text-dark">
							<span>100% Đội ngũ trên Prep đạt</span><br>
							<span class="text-primary">IELTS 8.0-8.5</span>
						</h2>
						<p class="lead mb-0">Cựu du học sinh hoặc tốt nghiệp từ ĐH danh tiếng.</p>
					</div>
				</div>
			</div>
			<!-- row -->
			<div class="row">
				<div class="col-lg-4 col-md-6 col-12">
					<!-- card -->
					<div class="card mb-4 card-hover">
						<!-- img -->
						<div>
							<img src="../assets/images/instructor/instructor-img-1.jpg" alt="img" class="card-img-top">
						</div>
						<!-- card body -->
						<div class="card-body">
							<h3 class="mb-0 fw-semibold"><a href="#" class="text-inherit">Cô Quỳnh Nguyễn</a></h3>
							<p class="mb-3">9.0 Overall</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<!-- card -->
					<div class="card mb-4 card-hover">
						<!-- img -->
						<div>
							<img src="../assets/images/instructor/instructor-img-2.jpg" alt="img" class="card-img-top">
						</div>
						<!-- card body -->
						<div class="card-body">
							<h3 class="mb-0 fw-semibold"><a href="#" class="text-inherit">Cô Nguyễn Hà Trang</a></h3>
							<p class="mb-3">8.0 Overall</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					<!-- card -->
					<div class="card mb-4 card-hover">
						<!-- img -->
						<div>
							<img src="../assets/images/instructor/instructor-img-3.jpg" alt="img" class="card-img-top">
						</div>
						<!-- card body -->
						<div class="card-body">
							<h3 class="mb-0 fw-semibold"><a href="#" class="text-inherit">Thầy Trung Đức</a></h3>
							<p class="mb-3">8.5 Overall</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Enrollment -->
	<section class="py-8">
		<div class="container mb-lg-8">
			<div class="row mb-4 justify-content-center">
				<div class="col-lg-11 col-md-12">
					<div class="row align-items-center">
						<div class="col-md-12 col-12 mb-4">
							<!-- avatar group -->
							<div class="avatar-group me-5">
								<!-- avatar -->
								<span class="avatar avatar-lg">
									<img alt="avatar" src="../assets/images/avatar/avatar-1.jpg" class="rounded-circle">
								</span>
								<!-- avatar -->
								<span class="avatar avatar-lg">
									<img alt="avatar" src="../assets/images/avatar/avatar-2.jpg" class="rounded-circle">
								</span>
								<!-- avatar -->
								<span class="avatar avatar-lg">
									<img alt="avatar" src="../assets/images/avatar/avatar-3.jpg" class="rounded-circle">
								</span>
								<!-- avatar -->
								<span class="avatar avatar-lg">
									<img alt="avatar" src="../assets/images/avatar/avatar-4.jpg" class="rounded-circle">
								</span>
								<!-- avatar -->
								<span class="avatar avatar-lg avatar-danger">
									<span class="avatar-initials rounded-circle fs-5 fw-bold">1M+</span>
								</span>
							</div>
						</div>
						<!-- heading -->
						<div class="feature col-lg-4 col-md-5 col-12 mb-6">
							<span>
								<h1 class="display-3 fw-bold text-dark">
									<span>Về đội với </span>
									<span class="text-primary"> PREP </span>
									<span>ngay hôm nay</span>
								</h1>
								<svg preserveAspectRatio="none" viewBox="0 0 546.714 178.143"><path d="M546.214 89.072c0 48.917-122.162 88.571-272.857 88.571C122.662 177.643.5 137.988.5 89.072.5 40.155 122.662.5 273.357.5c150.695 0 272.857 39.655 272.857 88.572z"/></svg>
							</span>
						</div>
						<div class="offset-lg-1 col-lg-6 col-md-7 col-12 mb-6">
							<!-- para -->
							<p class="lead mb-0">Prep - nền tảng học luyện thông minh, kết hợp giáo dục và công nghệ với sứ mệnh giúp mọi học sinh dù ở bất cứ đâu đều nhận được chất lượng giáo dục tốt nhất.</p>
						</div>
					</div>
					<!-- row -->
					<div class="row">
						<div class="col-lg-4 col-md-4 col-12 mb-3">
							<!-- text -->
							<h3 class="fw-semibold mb-2">Nền tảng giáo dục hàng đầu</h3>
							<p class="fs-4 mb-0">Cung cấp cho học viên những bài học với nội dung tương tác thú vị.
												Học viên có thể dễ dàng học mọi lúc mọi nơi.</p>
						</div>
						<div class="col-lg-4 col-md-4 col-12 mb-3">
							<!-- text -->
							<h3 class="fw-semibold mb-2">Lấy học viên làm trung tâm</h3>
							<p class="fs-4 mb-0">Được thiết kế để phù hợp với lịch trình, trình độ và mục tiêu của bạn,
											 khóa học của chúng tôi cho phép bạn học tiếng Anh theo cách của riêng bạn.</p>
						</div>
						<div class="col-lg-4 col-md-4 col-12 mb-3">
							<!-- text -->
							<h3 class="fw-semibold mb-2">Cam kết hiệu quả</h3>
							<p class="fs-4 mb-0">Bạn sẽ được trải nghiệm phương pháp học tiếng Anh theo chuẩn quốc tế,
												từ đó đẩy nhanh thời gian chinh phục mục tiêu của bạn.</p>
						</div>
						<!-- btn -->
						<div class="col-md-12 mt-3">
						<c:if test="${user == null}">
                       		<a href="../authentication-signup" class="btn btn-primary">Đăng ký ngay</a>
                       </c:if>
                       <c:if test="${user != null}">
                       		<a href="course" class="btn btn-primary">Đăng ký ngay</a>
                       </c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog -->
	<section class="py-8">
		<div class="container mb-lg-8">
			<div class="row mb-8 justify-content-center">
				<div class="col-lg-8 col-md-12 col-12 text-center mb-4">
					<!-- caption -->
					<span class="text-primary mb-3 d-block text-uppercase fw-semibold ls-xl">Câu chuyện của học viên</span>
					<h2 class="mb-2 display-4 fw-bold text-dark">
						<span class="text-primary">Học viên nói gì </span>
						<span>về PREP</span>
					</h2>
				</div>
				<div class="row align-items-center">
                      <div class="col-lg-7 col-md-12 col-12">
                        <div class="mb-8 mb-lg-0 me-lg-4">
                          <!-- text -->

                          <p class="display-6 mb-4 ">"Theo em, học Prep tiện hơn về mặt thời gian giúp em tự chủ được việc học của em. 
                          							 Em cũng là người thích tự học nên việc học Prep giúp em tự mình khai quật kiến thức, nó rất vui ạ. 
                          							 Ngoài ra Prep chữa bài kĩ bài bản với giá cả hợp lí nên em khá yên tâm."</p>
                          <!-- text -->

                          <p class="mb-0 ">Nguyễn Tú Linh</p>
                        </div>


                      </div>
                      <!-- col -->

                      <div class="col-lg-5 col-md-12 col-12">
                        <div>
                          <!-- Img -->

                          <img src="../assets/images/background/case-study-img-1.jpg" alt="" class="img-fluid rounded-3 w-100">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <!-- button -->

                        <a href="#" class="btn btn-outline-primary mt-lg-2 mt-4">Xem thêm câu chuyện</a>
                      </div>
                    </div>
			</div>
			</div>
	</section>
	<!-- call to action -->
	<section class="py-8 bg-light-gradient-bottom">
		<div class="container my-lg-8">
			<!-- row -->
			<div class="row justify-content-center text-center">
				<div class="col-md-9 col-12">
					<!-- heading -->
					<h2 class="text-dark display-4">
						<span>Bắt đầu </span>
						<span class="text-primary">tìm kiếm khoá học </span>
						<span>dễ dàng</span>
					</h2>
					<p class="lead px-lg-8 mb-6">Các khoá học của Prep được biên soạn và trình bày một cách khoa học nhất.</p>
					<!-- button -->
					<div class="d-grid d-md-block">
						<a href="course" class="btn btn-primary mb-2 mb-md-0">Xem các khóa học</a>
						
						<c:if test="${user == null}">
                       		<a href="../authentication-signup" class="btn btn-info">Đăng ký ngay</a>
                       </c:if>
                       <c:if test="${user != null}">
                       		<a href="course" class="btn btn-info">Đăng ký ngay</a>
                       </c:if>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Slider -->
	 
	<!-- Scroll top -->
	<div class="btn-scroll-top">
		<svg class="progress-square svg-content" width="100%" height="100%" viewBox="0 0 40 40">
		<path d="M8 1H32C35.866 1 39 4.13401 39 8V32C39 35.866 35.866 39 32 39H8C4.13401 39 1 35.866 1 32V8C1 4.13401 4.13401 1 8 1Z" />
		</svg>
	</div>

	<style data-typed-js-cursor-css="true">
	.typed-cursor{
		opacity: 1;
	}
	.typed-cursor.typed-cursor--blink{
		animation: typedjsBlink 0.7s infinite;
		-webkit-animation: typedjsBlink 0.7s infinite;
				animation: typedjsBlink 0.7s infinite;
	}
	@keyframes typedjsBlink{
		50% { opacity: 0.0; }
	}
	@-webkit-keyframes typedjsBlink{
		0% { opacity: 1; }
		50% { opacity: 0.0; }
		100% { opacity: 1; }
	}
	</style>
	
	<style>
	.feature span {
  	position: relative;
	}
	.feature span svg {
	  position: absolute;
	  top: 50%;
	  left: 45%;
	  transform: translate(-50%, -50%);
	  width: 110%;
	  height: 120%;
	  z-index: -1;
	}
	.feature span svg path {
	  fill: transparent;
	  stroke-width: 5px;
	  stroke: currentColor;
	  opacity: 20%
	}
	.feature span svg path {
	  stroke-dasharray: 1210.709716796875;
	  stroke-dashoffset: -1210.709716796875; /*or the positive one*/
	  transition: stroke-dashoffset .5s cubic-bezier(.29,.68,.74,1.02);
	}
	.feature span:hover svg path {
	  stroke-dashoffset: 0;
	}
	.slider{
		display: flex;
		align-items: center;
		justify-content: center;
		min-height: 100vh;
		padding: 0 35px;
		background: linear-gradient(to left top);
	}
	.wrapper{
		max-width: 1100px;
		width: 100%;
		position: relative;
	}
	.wrapper i{
		height: 50px;
		width: 50px;
		background: #fff;
		text-align: center;
		line-height: 50px;
		border-radius: 50%;
		curor: pointer;
		position: absolute;
		top: 50%;
		font-size: 1.25rem;
		transform: translateY(-50%);
		box-shadow: 0 3px 6px rgba(0,0,0,0.23);
		z-index: 9;
	}
	.wrapper i:first-child{
		left: -22px;
	}
	.wrapper i:last-child{
		right: -22px;
	}
	.wrapper .carousel{
		display: grid;
		grid-auto-flow: column;
		grid-auto-columns: calc((100%/3) - 12px);
		gap: 16px;
		overflow-x: auto;
		scroll-snap-type: x mandatory;
		scroll-behavior: smooth;
		scrollbar-width: 0;
	}
	.carousel::-webkit-scrollbar{
		display: none;
	}
	.carousel :where(.card, .img){
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.carousel.no-transition{
		scroll-behavior: auto;
	}
	.carousel.dragging{
		scroll-snap-type: none;
		scroll-behavior: auto;
	}
	.carousel.dragging .card{
		cursor: grab;
		user-select: none;
	}
	.carousel .card{
		scroll-snap-align: start;
		list-style: none;
		background: light;
		border-radius: 8px;
		display: flex;
		cursor: pointer;
		padding-bottom: 15px;
		align-items: center;
		justify-content: center;
		flex-direction: column;
	}
	@media screen and (max-width: 900px){
		.wrapper .carousel {
			grid-auto-columns: calc((100%/2) - 9px);
		}
	}
	@media screen and (max-width: 600px){
		.wrapper .carousel {
			grid-auto-columns: 100%;
		}
	}
	</style>
	<script type="text/javascript">
		const wrapper = document.querySelector(".wrapper");
		const carousel = document.querySelector(".carousel");
		const arrowBtns = document.querySelectorAll(".wrapper i");
		const firstCardWidth = carousel.querySelector(".card").offsetWidth;
		const carouselChildren = [...carousel.children];
		
		let isDragging  = false, startX, startScrollLeft, timeoutId;
		
		let cardPerView = Math.round(carousel.offsetWidth / firstCardWidth);
		
		carouselChildren.slice(-cardPerView).reverse().forEach(card => {
			carousel.insertAdjacentHTML("afterBegin", card.outerHTML);
		});
		
		carouselChildren.slice(0, cardPerView).forEach(card => {
			carousel.insertAdjacentHTML("beforeEnd", card.outerHTML);
		});
		
		arrowBtns.forEach(btn => {
			btn.addEventListener ("click", () => {
				carousel.scrollLeft += btn.id === "left" ? -firstCardWidth : firstCardWidth;
			})
		});
		
		const dragStart = (e) => {
			isDragging  = true;
			carousel.classList.add("dragging");
			startX = e.pageX;
			startScrollLeft = carousel.scrollLeft;
		}
		
		const dragging = (e) => {
			if(!isDragging) return;
			carousel.scrollLeft= startScrollLeft - (e.pageX - startX);
		}
		
		const dragStop = () => {
			isDragging  = false;
			carousel.classList.remove("dragging");
		}
		
		const autoPlay = () => {
			if (window.innerWidth < 800) return;
			timeoutId = setTimeout(() => carousel.scrollLeft += firstCardWidth, 2500);
		}
		autoPlay();
		
		const infinteScroll = () => {
			if (carousel.scrollLeft === 0){
				carousel.classList.add("no-transition");
				carousel.scrollLeft = carousel.scrollWidth - (2 * carousel.offsetWidth);
				carousel.classList.remove("no-transition");
			} else if (Math.ceil(carousel.scrollLeft) === carousel.scrollWidth - carousel.offsetWidth){
				carousel.classList.add("no-transition");
				carousel.scrollLeft = carousel.offsetWidth;
				carousel.classList.remove("no-transition");
			}
			
			clearTimeout(timeoutId);
			if(!wrapper.matches(":hover")) autoPlay();
		}
		
		carousel.addEventListener("mousedown", dragStart);
		carousel.addEventListener("mousemove", dragging);
		document.addEventListener("mouseup", dragStop);
		carousel.addEventListener("scroll", infinteScroll);
		wrapper.addEventListener("mouseenter", () => clearTimeout(timeoutId));
		wrapper.addEventListener("mouseleave", autoPlay);
	</script>
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
	</script>
	
	<!-- Scripts -->
	<script src="../assets/libs/typed.js/dist/typed.umd.js"></script>
	<!-- Libs JS -->
	<script src="../assets/libs/%40popperjs/core/dist/umd/popper.min.js"></script>
	<script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../assets/libs/simplebar/dist/simplebar.min.js"></script>

	<!-- Theme JS -->
	<script	cript src="../assets/js/theme.min.js"></script>

	<script src="../assets/libs/tiny-slider/dist/min/tiny-slider.js"></script>

	<script src="../assets/libs/tippy.js/dist/tippy-bundle.umd.min.js"></script>

	<script src="../assets/js/vendors/tnsSlider.js"></script>
	<script src="../assets/js/vendors/tooltip.js"></script>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</body>
</html>
