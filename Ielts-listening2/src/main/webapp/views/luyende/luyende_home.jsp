<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<style>
.ul__test li div {
	transition: 0.6s ease-in-out;
}

.ul__test .active, .ul__test li div:hover {
	background-color: white;
	color: #0071F9 !important;
	border-radius: 0.5rem;
}

}
.div__tab {
	cursor: pointer;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
</style>
	<div class="m-0 p-0">
		<section class="py-lg-16 pt-8 m-4">
			<div class="container">
				<div class="row d-flex align-items-center justify-content-between">
					<div class="col-xl-6 col-lg-6 col-12 p-2">
						<div>
							<h1 class="display-2 fw-bold mb-3">
								Luyện đề <u class="text-warning"><span class="text-primary">Listening</span></u>
								ngay hôm nay
							</h1>
							<p class="lead mb-4">
								Luyện Listening <span class="fw-bold">MIỄN PHÍ VĨNH VIỄN</span>
								cùng giải thích đáp án siêu chi tiết với kho đề HOT nhất liên
								tục cập nhật.
							</p>
							<ul class="list-unstyled mb-5">
								<li class="mb-2"><svg xmlns="http://www.w3.org/2000/svg"
										width="12" height="12" fill="var(--gk-success)"
										class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                              <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"></path>
                            </svg> <span class="ms-2">Không tốn phí</span></li>
								<li class="mb-2"><svg xmlns="http://www.w3.org/2000/svg"
										width="12" height="12" fill="var(--gk-success)"
										class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                              <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"></path>
                            </svg> <span class="ms-2">Dịch vụ hỗ trợ
										24/7</span></li>
								<li class="mb-2"><svg xmlns="http://www.w3.org/2000/svg"
										width="12" height="12" fill="var(--gk-success)"
										class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                              <path
											d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"></path>
                            </svg> <span class="ms-2">Làm bài mọi lúc,
										mọi nơi</span></li>
							</ul>
							<a href="#testList" class="btn btn-primary btn-md">Làm bài
								ngay</a>
						</div>
					</div>
					<div class="col-xl-5 col-lg-6 col-12 d-lg-flex justify-content-end">
						<div class="mt-12 mt-lg-0 position-relative">
							<img src="../assets/images/education/skils.jpg"
								alt="online course"
								class="img-fluid rounded-4 w-100 z-1 position-relative">
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="px-7 py-7  ">

			<c:if test="${not empty currentUser and not empty enTestProcess}">
				<div class="bg-white px-4 py-4 rounded-4 card-body">
					<p class="fs-5 fw-bold mb-0 color-blue--primary">Tiếp tục làm
						bài</p>
					<h3 class="fw-bold mb-0">${enTestProcess.mockTests.topicTests.topicName}</h3>
					<p class="fs-5 fw-bold mb-0" style="color: rgb(113, 113, 113)">${enTestProcess.mockTests.testName}</p>
					<p class="fs-5 fw-bold mb-0" style="color: rgb(113, 113, 113)">${enTestProcess.enrrollmentDate}</p>
					<a
						href="http://localhost:8080/Ielts-listening2/test/luyende_test?enrollTestId=${enTestProcess.enrrolId}">
						<button
							class="btn btn-primary d-flex flex-row justify-content-center w-100 h-25 mt-4 py-2 fs-5 fw-bold text-light align-items-center">
							Tiếp tục làm bài
							<svg xmlns="http://www.w3.org/2000/svg" height="24"
								style="margin-top: 3px;" fill="currentColor"
								class="bi bi-arrow-right ms-3" viewBox="0 0 16 16">
  						<path fill-rule="evenodd"
									d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
					</svg>
						</button>
					</a>
				</div>
			</c:if>
			<p class="fs-3 fw-bold my-5">Hôm nay bạn muốn luyện</p>
			<div class="d-flex flex-row justify-content-between">
				<ul class="ul__test nav fs-5 fw-bold justify-content-between"
					style="width: 500px">
					<li class="nav-item  ">
						<div
							class="div`__tab div__tab--1 nav-link rounded-3 text-black ${param.tab == null || param.tab == '1' ? 'active' : ''}">Tất
							cả bộ đề</div>
					</li>
					<li class="nav-item ">
						<div
							class="div__tab div__tab--2 nav-link rounded-3 text-black ${param.tab == '2' ? 'active' : ''}"
							href="#">Bộ đề Mới nhất</div>
					</li>
					<li class="nav-item ">
						<div
							class="div__tab div__tab--3 nav-link rounded-3 text-black ${param.tab == '3' ? 'active' : ''}"
							href="#">Bộ đề HOT</div>
					</li>
				</ul>
				<div class="input-group" style="width: 400px;">
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
			<c:if test="${topicTests.size() == 0}">
				<div class="w-100 d-flex flex-row justify-content-center my-5">
					<div>
						<img class="mx-auto d-block my-3"
							src='<c:url value="/assets/images/bee-find.svg"/>' width="150px" />
						<p class="fs-4 fw-bold mb-0 text-center">Không tìm thấy kết
							quả phù hợp</p>
						<p class="text-center"
							style="color: rgb(123, 137, 155); font-size: 18px; width: 680px;">Hiện
							tại, kho đề của Prep chưa có bộ đề nào phù hợp với yêu cầu của
							bạn rồi ! Hãy thử lại bằng cách bỏ bớt bộ lọc nhé.</p>
					</div>
				</div>
			</c:if>
			<c:forEach var="topicTest" items='${topicTests}'>
				<div class="w-100 bg-white px-4 py-4 my-5 rounded-4 shadow-lg">
					<div class="position-relative intro d-flex flex-row">

						<img style="cursor: pointer;height: 80px;width: 100px;object-fit: cover;object-position: center;"
							onerror="setDefaultImage(this)"
							src='<c:url value="/image?fname=topicIMG/${topicTest.image}"/>'
							width="150px" />
						<div class="w-75 ms-5">
							<p class="fs-4 fw-bold mb-0" style="cursor: pointer">${topicTest.topicName}</p>
							<p
								style="color: rgb(123, 137, 155); font-size: 16px; cursor: pointer">${topicTest.description}</p>
						</div>
						<c:set var="count" value="0"></c:set>
						<c:forEach var="mockTest" items='${topicTest.mockTests}'>
							<c:set var="countEnrrol" value="0"></c:set>
							<c:forEach var="enrrolTest" items="${mockTest.enrrolTests }">
								<c:if
									test="${enrrolTest.users.userId == currentUser.userId && enrrolTest.score >=0}">
									<c:set var="countEnrrol" value="${countEnrrol + 1 }"></c:set>
								</c:if>
							</c:forEach>
							<c:if test="${countEnrrol > 0 }">
								<c:set var="count" value="${count + 1 }"></c:set>
							</c:if>
						</c:forEach>
						<c:set var="style" value=""></c:set>
						<c:choose>
							<c:when
								test="${count == topicTest.mockTests.size() && topicTest.mockTests.size() > 0}">
								<c:set var="style"
									value="background-color: #00B135; color: white;"></c:set>
							</c:when>
							<c:when
								test="${count < topicTest.mockTests.size() && count > 0 }">
								<c:set var="style"
									value="background-color: #fffbeb; color: rgb(245,158,11);"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="style" value="background-color: rgb(243,244,246);"></c:set>
							</c:otherwise>
						</c:choose>
						<div
							class="position-absolute end-0 px-4 rounded-3 d-flex flex-column justify-content-center"
							style="${style} height: 40px;">
							<p class="fw-semibold h-25" style="font-size: 18px;">${count}/${topicTest.mockTests.size()}
								đề</p>
						</div>
					</div>
					<c:set var="i" value="0"></c:set>
					<div class="overflow-hidden my-3">
						<div class="row gy-4">
							<c:forEach var="mockTest" items='${topicTest.mockTests}'>
								<c:if test="${i < 6}">
									<%-- <div class="col-6" style="cursor:pointer">
							  		<form action="luyen-de-home" method="post">
							  			<input type="hidden" name="userId" value="${currentUser.userId }" />
										<input type="hidden" name="testId" value="${mockTest.testId }" />
							  			<a href="#"  onclick="event.preventDefault();this.parentNode.submit()" style="color:#64748b;">
								      <div class="p-3 border bg-white d-flex flex-row rounded-3">
								      	<c:choose>
								      		<c:when test="${currentUser.userId == null}">
									      		<div class="rounded-3 d-flex justify-content-center align-items-center fw-bold" style="background-color: rgb(240, 247, 255); color:rgb(0, 74, 185); width: 50px; height: 50px;">
										      		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-headphones fw-bold" viewBox="0 0 16 16">
						  								<path d="M8 3a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V8a6 6 0 1 1 12 0v5a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h1V8a5 5 0 0 0-5-5z"/>
													</svg>
									      		</div>
								      		</c:when>
								      		<c:otherwise>
								      			<c:set var="maxScore" value="-10"></c:set>
								      			<c:set var="count" value="0"></c:set>
									      		<c:forEach var="enrrolTest" items="${mockTest.enrrolTests }">
									      			<c:if test="${maxScore < enrrolTest.score && enrrolTest.users.userId == currentUser.userId}">
									      				<c:set var="maxScore" value="${enrrolTest.score}"></c:set>
									      				<c:set var="count" value="${count + 1 }"></c:set>
									      			</c:if>
									      		</c:forEach>
									      		<c:choose>
									      			<c:when test="${count == 0 }">
									      				<div class="rounded-3 d-flex justify-content-center align-items-center fw-bold" style="background-color: rgb(240, 247, 255); color:rgb(0, 74, 185); width: 50px; height: 50px;">
												      		<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-headphones fw-bold" viewBox="0 0 16 16">
								  								<path d="M8 3a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V8a6 6 0 1 1 12 0v5a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h1V8a5 5 0 0 0-5-5z"/>
															</svg>
									      				</div>
									      			</c:when>
									      			<c:when test="${maxScore == -1 }">
									      				<div class="rounded-3 d-flex justify-content-center align-items-center fw-bold" style="background-color: #fffbeb; color: rgb(245,158,11); width: 50px; height: 50px;">3%</div>
									      			</c:when>
									      			<c:otherwise>
									      				<div class="rounded-3 d-flex justify-content-center align-items-center fw-bold" style="background-color: #00B135; color: white; width: 50px; height: 50px;">${maxScore}</div>
									      			</c:otherwise>
									      		</c:choose>
								      		</c:otherwise>
								      	</c:choose>
								      	<p class="fs-5 fw-bold d-flex flex-column justify-content-center ms-3 mb-0" value="${mockTest.testId}">${mockTest.testName}</p>					      		
								      </div>
								      </a>
							    	</form>
							    	</div> --%>




									<!-- Chỉnh sửa 12/11/2023 -->

									<div class="col-6">
										<div style="color: #64748b;">
											<div class="p-3 border bg-white rounded-3">
												<div class="d-flex justify-content-between">
													<div class="d-flex flex-row">
														<c:choose>
															<c:when test="${currentUser.userId == null}">
																<div
																	class="rounded-3 d-flex justify-content-center align-items-center fw-bold"
																	style="background-color: rgb(240, 247, 255); color: rgb(0, 74, 185); width: 50px; height: 50px;">
																	<svg xmlns="http://www.w3.org/2000/svg" width="32"
																		height="32" fill="currentColor"
																		class="bi bi-headphones fw-bold" viewBox="0 0 16 16">
										  								<path
																			d="M8 3a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V8a6 6 0 1 1 12 0v5a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h1V8a5 5 0 0 0-5-5z" />
																	</svg>
																</div>
															</c:when>
															<c:otherwise>
																<c:set var="maxScore" value="-10"></c:set>
																<c:set var="count" value="0"></c:set>
																<c:set var="isDoing" value="${false }"></c:set>
																<c:forEach var="enrrolTest"
																	items="${mockTest.enrrolTests }">
																	<c:if
																		test="${enrrolTest.users.userId.equals(currentUser.userId)}">
																		<c:set var="count" value="${count + 1 }"></c:set>
																		<c:if test="${enrrolTest.score == -1}">
																			<c:set var="isDoing" value="${true}"></c:set>
																			<c:set var="enrTestId" value="${enrrolTest.enrrolId}"></c:set>
																		</c:if>
																		<c:if
																			test="${enrrolTest.score >= 0 and enrrolTest.score > maxScore }">
																			<c:set var="maxScore" value="${enrrolTest.score}"></c:set>
																			<c:set var="doneEnrollTestId"
																				value="${enrrolTest.enrrolId}"></c:set>
																		</c:if>
																	</c:if>
																</c:forEach>

																<c:choose>

																	<c:when test="${count == 0 }">
																		<div
																			class="rounded-3 d-flex justify-content-center align-items-center fw-bold"
																			style="background-color: rgb(240, 247, 255); color: rgb(0, 74, 185); width: 50px; height: 50px;">
																			<svg xmlns="http://www.w3.org/2000/svg" width="32"
																				height="32" fill="currentColor"
																				class="bi bi-headphones fw-bold" viewBox="0 0 16 16">
												  								<path
																					d="M8 3a5 5 0 0 0-5 5v1h1a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V8a6 6 0 1 1 12 0v5a1 1 0 0 1-1 1h-1a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h1V8a5 5 0 0 0-5-5z" />
																			</svg>
																		</div>
																	</c:when>
																	<c:when test="${isDoing }">
																		<div
																			class="rounded-3 d-flex justify-content-center align-items-center fw-bold"
																			style="background-color: #fffbeb; color: rgb(245, 158, 11); width: 50px; height: 50px;">3%</div>
																	</c:when>
																	<c:otherwise>
																		<div
																			class="rounded-3 d-flex justify-content-center align-items-center fw-bold"
																			style="background-color: #00B135; color: white; width: 50px; height: 50px;">${maxScore}</div>
																	</c:otherwise>
																</c:choose>


															</c:otherwise>
														</c:choose>
														<p
															class="fs-5 fw-bold d-flex flex-column justify-content-center ms-3 mb-0"
															value="${mockTest.testId}">${mockTest.testName}</p>
													</div>

													<div class="d-flex flex-row align-items-center">
														<c:choose>
															<c:when test="${count == 0 }">
																<form action="luyen-de-home" method="post">
																	<input type="hidden" name="userId"
																		value="${currentUser.userId }" /> <input
																		type="hidden" name="testId"
																		value="${mockTest.testId }" /> <input type="submit"
																		class="btn btn-primary" value="Làm ngay" />
																</form>
															</c:when>
															<c:when test="${isDoing}">
																<a
																	href='<c:url value="/test/luyende_test?enrollTestId=${enrTestId}"></c:url>'
																	class="btn"
																	style="background-color: rgb(245, 158, 11); color: #fff;">Làm
																	tiếp</a>
															</c:when>
															<c:otherwise>
																<a
																	href='<c:url value="/test/luyende_test?enrollTestId=${doneEnrollTestId}"></c:url>'
																	class="btn me-1"
																	style="background-color: #00B135; color: white;">Xem
																	lại</a>
																<form action="luyen-de-home" method="post">
																	<input type="hidden" name="userId"
																		value="${currentUser.userId }" /> <input
																		type="hidden" name="testId"
																		value="${mockTest.testId }" /> <input type="submit"
																		class="btn btn-primary" value="Làm lại" />
																</form>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- Chỉnh sửa -->

									<c:set var="i" value="${i+1 }"></c:set>
								</c:if>
							</c:forEach>
						</div>
					</div>

					<a href="luyende-testset?topicId=${topicTest.topicId }"
						class="col-2 btn btn-primary d-flex flex-row justify-content-center h-25 mt-4 mx-auto py-2 px-3 fs-5 fw-bold  align-items-center">
						Xem thêm ${topicTest.mockTests.size() - i} đề <svg
							xmlns="http://www.w3.org/2000/svg" height="24"
							style="margin-top: 3px;" fill="currentColor"
							class="bi bi-arrow-right ms-3" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd"
								d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
						</svg>
					</a>

				</div>
			</c:forEach>

			<c:if test="${topicTests.size() > 0}">
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
		</div>
	</div>
	<script>
		const params = new URLSearchParams(document.location.search);
		let page = params.get("page") ? params.get("page"):'1';
		
		const li_List = document.querySelectorAll(".div__tab");
		let currLi = document.querySelectorAll(".div__tab")[0];
		if (li_List) {
			li_List.forEach((li, i) => {
				li.addEventListener("click", (e) => {
					currLi.classList.remove("active");
					currLi = li;
					currLi.classList.add("active");
					params.delete("page"); 
					if (i === 0) {
						params.delete("tab");
					}
					else params.set("tab", i + 1);
					const isQuestionMark = params.toString() === "" ? "" : "?";
					window.location.replace(location.protocol + '//' + location.host + location.pathname + isQuestionMark + params.toString());
				})
			})
		}
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
</body>
</html>