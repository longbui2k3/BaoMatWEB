<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<script>
		
	</script>
	<!-- Page content (new) -->

	<main>
		<!-- Page header -->
		<div class="col-lg-8 col-md-12 col-12 pt-lg-8 pb-8 pe-3">
			<div
				class="border-bottom pb-3 mb-3 d-md-flex align-items-center justify-content-between">
				<div class="mb-3 mb-md-0">
					<h1 class="mb-1 h2 fw-bold">Courses Category</h1>
					<!-- Breadcrumb -->
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="admin-dashboard.html">Trang
									chủ</a></li>
							<li class="breadcrumb-item"><a href="#">Khóa học</a></li>
							<li class="breadcrumb-item active" aria-current="page">Đề
								thi</li>
						</ol>
					</nav>
				</div>
				<div>
					<a href="#" class="btn btn-primary" id="btn-open-popup"
						onclick="showModel()">Thêm bộ đề</a>
				</div>

			</div>
		</div>
		<!-- Page content -->
		<section class="pb-8">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12 col-12 mt-n8 mb-4 mb-lg-0">
						<!-- Card -->
						<div class="card rounded-3">
							<!-- Card Body -->
							<div class="card-body">
								<!-- Table -->
								<div class="table-responsive border-0 overflow-y-hidden">
									<table
										class="table mb-0 text-nowrap table-centered table-hover table-with-checkbox">
										<thead class="table-light">
											<tr>
												<th>STT</th>
												<th>Name</th>
												<th>ID</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:set var="i" value="${((param.page == null ? '1' : param.page) - 1) * 8 + 1}"></c:set>
											<c:forEach var="t" items="${topicList }">
												<tr class="accordion-toggle collapsed"
													id="accordion${t.topicId}" data-toggle="collapse"
													data-bs-parent="#accordion"
													data-target="collapse${t.topicId}" value="${t.topicId}">
													<td><i
														class="topic-down-icon fe fe-chevron-down fs-4 me-2 position-absolute ms-n4 mt-1"></i>
														<h5 class="mb-0 fit-content">${i < 10 ? '0' : ""}${i}</h5>
														<c:set var="i" value="${i + 1 }"></c:set></td>
													<td>

														<h5 class="mb-0 text-primary-hover fit-content">
															${t.topicName}</h5>

													</td>
													<td><h5 class="mb-0 fit-content">${t.topicId}</h5></td>
													<!-- <td>${t.createTime}</td> -->
													<td><span class="dropdown dropstart"> <a
															class="btn-icon btn btn-ghost btn-sm rounded-circle"
															href="#" role="button" id="courseDropdown1"
															data-bs-toggle="dropdown" data-bs-offset="-20,20"
															aria-expanded="false"> <i class="fe fe-more-vertical"></i>
														</a> <span class="dropdown-menu"
															aria-labelledby="courseDropdown1"> <a href="#"
																class="dropdown-item btn-open-popupTest"
																value="${t.topicId }"> <i
																	class="fe fe-plus dropdown-item-icon btn-open-popupTest"></i>
																	Thêm đề thi
															</a> <a href="#" class="dropdown-item btn-openpopup"
																value="${t.topicId }"> <i
																	class="fe fe-edit dropdown-item-icon"></i> Sửa bộ đề
															</a> <a class="dropdown-item"
																href="<c:url value='/admin/deleteTopic?id=${t.topicId}'/>">
																	<i class="fe fe-trash dropdown-item-icon"></i> Xóa bộ
																	đề
															</a>
														</span>
													</span></td>
												</tr>

												<c:forEach var="m" items="${listMocktest }">
													<c:choose>
														<c:when test="${t.topicId == m.topicTests.topicId}">
															<tr class="collapse${t.topicId} mocktest-item">
																<td></td>
																<td><a
																	href="<c:url value='/admin/listPart?idTest=${m.testId}'/>"
																	class="text-inherit"> <span
																		class=" text-primary-hover ms-3 fit-content">${m.testName }</span>
																</a></td>
																<td class="fit-content">${m.testId}</td>
																<!-- <td class="fit-content">${t.createTime}</td> -->
																<td><span class="dropdown dropstart"> <a
																		class="btn-icon btn btn-ghost btn-sm rounded-circle"
																		href="#" role="button" id="courseDropdown2"
																		data-bs-toggle="dropdown" data-bs-offset="-20,20"
																		aria-expanded="false"> <i
																			class="fe fe-more-vertical"></i>
																	</a> <span class="dropdown-menu"
																		aria-labelledby="courseDropdown2"> <a
																			class="btn-popup-updateTest icon-link icon-update dropdown-item"
																			href="#" value="${m.testId}"> <i
																				class="fe fe-edit dropdown-item-icon"></i> Sửa đề
																				thi
																		</a> <a class="dropdown-item"
																			href="<c:url value='/admin/deleteTest?idTest=${m.testId}'/>"
																			value="${m.testId}"> <i
																				class="fe fe-trash dropdown-item-icon"></i> Xóa đề
																				thi
																		</a>
																	</span>
																</span></td>
															</tr>


														</c:when>
													</c:choose>
												</c:forEach>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- Pagination -->
								<div class="mt-3">
									<!-- working with icons -->
									<nav aria-label="Page navigation">
										<ul class="pagination justify-content-end">
											<li class="page-item"><a class="page-link" ${ param.page == null || param.page == "1" ? "":"href=http://localhost:8080/Ielts-listening2/admin/listTopic?page="}${param.page == null || param.page == "1" ? "": (param.page - 1)}
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
											<c:choose>
												<c:when test="${pageNum <= 5 }">
													<c:forEach var="i" begin="1" end="${pageNum }" step="1">
														<li class="page-item"><a class="page-link ${param.page==i || (i == 1 && param.page == null) ?'bg-primary color-white':''}"
															href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${i}">${i}</a></li>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link ${param.page==1 || param.page==null?'bg-primary color-white':''}"
															href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=1">1</a></li>
													<c:choose>
															<c:when test="${(param.page - 3) - 1 >= 2 }">
																<li class="page-item"><a class="page-link"
																	href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${param.page  - 5}">...</a></li>
															</c:when>
															<c:when test="${(param.page - 3) - 1  > 0 }">
																<li class="page-item"><a class="page-link"
																	href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${(param.page - 3)}">${(param.page - 3)}</a></li>
															</c:when>
													</c:choose>
													<c:forEach var="i" begin="0" end="4" step="1">
														<c:if
															test="${param.page + i - 2 > 1 && param.page + i - 2 < pageNum }">
															<li class="page-item"><a class="page-link ${param.page==(param.page + i - 2)?'bg-primary color-white':''}"
																href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${param.page + i - 2}">${param.page + i - 2 }</a></li>
														</c:if>
													</c:forEach>
													<c:choose>
														<c:when test="${pageNum - (param.page + 3) >= 2 }">
															<li class="page-item"><a class="page-link"
																href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${param.page + 5}">...</a></li>
														</c:when>
														<c:when test="${pageNum - (param.page + 3) > 0 }">
															<li class="page-item"><a class="page-link"
																href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${pageNum - (pageNum - (param.page + 3))}">${pageNum - (pageNum - (param.page + 3))}</a></li>
														</c:when>
													</c:choose>
													<li class="page-item"><a class="page-link"
															href="http://localhost:8080/Ielts-listening2/admin/listTopic?page=${pageNum}">${pageNum}</a></li>
												</c:otherwise>	
											</c:choose>
											<li class="page-item"><a class="page-link" ${param.page == pageNum || (param.page == null && pageNum == "1") ? "":"href=http://localhost:8080/Ielts-listening2/admin/listTopic?page="}${param.page == pageNum || (param.page == null && pageNum == "1") ? "": (param.page + 1)}
												aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-12 mt-lg-n8">
						<!-- Card -->
						<div class="card mb-3 mb-4">
							<div class="p-1 card-cover">
								<span class="card__text text--description">Chi tiết</span> <img
									class="card__img shadow-black" src="" alt="hinh anh bo de">
							</div>
							<!-- Card body -->
							<div class="card-body">
								<!-- Price single page -->
								<div class="mb-3">
									<span class="card-body__title text-dark fw-bold h2">Bộ
										đề Listening</span>
									<p class="card-body__text text--description lh-sm">Lorem
										ipsum dolor sit amet consectetur adipisicing elit. Vero,
										necessitatibus quisquam! Quasi ipsa repellat necessitatibus
										consectetur dolores. Dolores, perferendis. Architecto esse, ut
										minima iusto cumque commodi? Expedita tempora numquam omnis!</p>
									<div class="card-list text--description">
										<div class="card-list__group mb-2">
											<i class="group__icon fe fe-book-open color-blue--primary"></i>
											<span class="group__content">4 đề</span>
										</div>
										<div class="card-list__group mb-2">
											<i class="group__icon fe fe-clock color-blue--primary"></i> <span
												class="group__content">180p</span>
										</div>
										<div class="card-list__group mb-2">
											<i class="group__icon fe fe-eye color-blue--primary"></i> <span
												class="group__content">100 lượt truy cập</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>



	<c:if test="${not empty messSuccess }">${messSuccess}</c:if>
	<c:if test="${not empty messError }">${messError}</c:if>
	<h2>${messSuccess}</h2>
	<h2>${messError}</h2>



	<!-- popup Tao bo de-->
	<div id="">

		<div class="modal" id="popup-add-bo-de" tabindex="-1" role="dialog"
			aria-labelledby="newCatgoryLabel" aria-hidden="true">
			<div class="modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title mb-0" id="newCatgoryLabel">Create New
							Category</h4>
						<!-- <button type="button"  class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
					</div>
					<div class="modal-body">
						<form action="" method="POST" class="needs-validation form-popup"
							novalidate enctype="multipart/form-data">
							<div class="mb-3 mb-2 popup-title">
								<label class="form-label popup-title__text" for="title">
									Tiêu đề <span class="text-danger">*</span>
								</label> <input type="text" class="popup-title__input form-control"
									name="name" placeholder="Nhập tên" id="title" required>
								<div class="invalid-feedback">Không hợp lệ !</div>
							</div>

							<div class="mb-3 mb-2 popup-descript">
								<label class="form-label popup-descript__text" for="description">
									Mô tả <!-- <span class="text-danger">*</span> -->
								</label> <input type="text" class="popup-descript__input form-control"
									name="description" value="" placeholder="Nhập mô tả"
									id="description" required>

								<div class="invalid-feedback">Không hợp lệ !</div>
							</div>

							<div class="mb-3 mb-2 popup-upload">
								<label class="form-label popup-upload__text">Hình mô tả</label>
								<div class="input-group mb-3">
									<input type="file" name="image"
										class="popup-upload__input form-control"
										accept="image/jpeg, image/png" id="img"
										aria-describedby="basic-addon3">
								</div>
							</div>

							<input style="display: none !important" type="text" name="id"
								id="" class="popup-id_input">

							<div>
								<button type="submit" class="btn btn-primary">Hoàn
									thành</button>
								<button type="button" id="btn-close" class="btn btn-secondary"
									data-bs-dismiss="modal" onclick="hidePopup();">Thoát</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
	</div>
	<div id="shadow" class="bg-dark" onclick="hidePopup()"></div>


	<!-- Demonstration Script -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	var arrTopic = [];
	var arrMock = [];
	// Duyệt danh sách Java và thêm dữ liệu vào biến JavaScript
	<c:forEach var="item" items="${topicList}">
		var item = {
			topicId : "${item.topicId}",
			topicName : "${item.topicName}",
			image : "${item.image}",
			description: "${item.description}"
		};
		arrTopic.push(item);
	</c:forEach>
	
	<c:forEach var="item" items="${listMocktest}">
		var itemMock = {
			testId : "${item.testId}",
			testName : "${item.testName}",
			topic : "${item.topicTests.topicId}",
			cost: "${item.cost}",
			description: "${item.description}"
		};
		arrMock.push(itemMock);
	</c:forEach>
	
		//accordion:
		var acc = document.getElementsByClassName("accordion");
		var i;
		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				//lấy thông tin Topic
				var idTopicCurrent = this.getAttribute("value");
				getInfoTopic(idTopicCurrent);
				//
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
		
		
		
		//hien thi thong tin topic:
		var getInfoTopic = function (id) {
			for(var i of arrTopic){
				if(id === i.topicId)
	            {
	                document.querySelector(".card-body__title").innerHTML = i.topicId;
					console.log(document.querySelector(".card-body__title"));
	                document.querySelector(".card-body__text").innerHTML = i.topicName;
	                //console.log(i.image);
	                var fileImg = "<c:url value='/image?fname="+ "${folder}" + "/" + String(i.image) +"'/>";
	                document.querySelector(".card__img").setAttribute("src", fileImg);	   
	                document.querySelector(".group__content").innerHTML = countMockByTopic(id) + " đề" ;	
	                return;
	            }
			}
			}
		
		//dem so luong de trong topic:
		function countMockByTopic(id){
            var count = 0;
            for(var i of arrMock) {
                if(id === i.topic) {
                    ++count;
                }
            }
            return count;
        }
		
		//popup
		//update Topic
		var modal = document.getElementById("popup-add-bo-de");
		var shadow = document.getElementById("shadow");
        var close = document.getElementById("btn-close");
		var btn = document.getElementsByClassName("btn-openpopup");
		for (i = 0; i < btn.length; i++) {
			btn[i].addEventListener("click", function() {
				
		        modal.style.display = "block";
				shadow.style.display = "block";
				// document.body.style.overflow = 'hidden';
		        var topicID = this.getAttribute("value");
		        console.log(this.getAttribute("value"));
		        for(var t of arrTopic) {
	                if(t.topicId === topicID) {
	                	document.querySelector(".modal .modal-title").innerHTML = t.topicName ;
	                	document.querySelector(".modal .popup-upload__input").setAttribute("value", t.image) ;
	                	document.querySelector(".modal .popup-title__input").setAttribute("value",t.topicName) ;
	                	document.querySelector(".modal .popup-descript__input").setAttribute("value", t.description) ;
	                	document.querySelector(".modal .popup-id_input").setAttribute("value", t.topicId) ;
	                	document.querySelector(".modal .form-popup").setAttribute("action", "updateTopic") ;
	                }
	            }
			}, false);
	        
		}
		//add Topic
		var btn = document.getElementById("btn-open-popup");
		btn.onclick = function(){
            modal.style.display = "block";
			shadow.style.display = "block";
			document.querySelector(".modal .form-popup").setAttribute("action", "addTopic") ;
			document.querySelector(".modal .modal-title").innerHTML = "Thêm bộ đề mới" ;
        }
        
        
        //add MockTest
        var btn = document.getElementsByClassName("btn-open-popupTest");
        for (i = 0; i < btn.length; i++) {
			btn[i].addEventListener("click", function(){
				modal.style.display = "block";
				shadow.style.display = "block";
				document.querySelector(".modal .modal-title").innerHTML = "Thêm đề thi mới" ;
				document.querySelector(".modal .popup-upload").style.display="none" ;
	            document.querySelector(".modal .popup-id_input").setAttribute("value", this.getAttribute("value")) ;
				document.querySelector(".modal .form-popup").setAttribute("action", "addMockTest") ;
			}
			)
        }
        
      //update MockTest
		var btn = document.getElementsByClassName("btn-popup-updateTest");
		for (i = 0; i < btn.length; i++) {
			btn[i].addEventListener("click", function() {
				
		        modal.style.display = "block";
				shadow.style.display = "block";
				// document.body.style.overflow = 'hidden';
		        var testID = this.getAttribute("value");
		        console.log(this.getAttribute("value"));
		        for(var t of arrMock) {
	                if(t.testId === testID) {
	                	console.log(t);
	                	//document.querySelector(".modal .popup-upload__input").setAttribute("value", t.image) ;
	                	document.querySelector(".modal .modal-title").innerHTML = t.testName ;
	                	document.querySelector(".modal .popup-title__input").setAttribute("value",t.testName) ;
						document.querySelector(".modal .popup-upload").style.display="none" ;
	                	document.querySelector(".modal .popup-descript__input").setAttribute("value", t.description) ;
	                	document.querySelector(".modal .popup-id_input").setAttribute("value", t.testId) ;
	                	document.querySelector(".modal .form-popup").setAttribute("action", "updateMockTest") ;
		                
	                }
	            }
			}, false);
	        
		}
		
		//hideShadow
		function hidePopup() {
			modal.style.display = "none"; 
			shadow.style.display = "none";
		}

		// hide/show form repcomment

		var element = document.querySelectorAll('.topic-down-icon');
		document.addEventListener(
		"click",
		function(event) {
			var t = event.target;
			var child;
			var topicId;
			if (t.parentNode.matches("[data-toggle='collapse']")) {
				topicId = t.parentNode.getAttribute("value");
				getInfoTopic(topicId);
				child = document.getElementsByClassName(t.parentNode.getAttribute("data-target"));
				for(var i = 0; i < child.length; i++){
					child[i].classList.toggle("d-table-row");

					// if (element[i].classList.contains('fe-chevron-down')){
					// 	element[i].classList.replace('fe-chevron-down', 'fe-chevron-up');
					// } else if (element[i].classList.contains('fe-chevron-up')){
					// 	element[i].classList.replace('fe-chevron-up', 'fe-chevron-down');
					// }
				}
			}
		},
		false
		);
		

	</script>

	<script>
	function showFile(fileInputs){
		document.querySelectorAll("h5").forEach(h5 => h5.remove());
		const files = fileInputs.files;
		for (let i = 0; i < files.length; i++){
			const path = (window.URL || window.webkitURL).createObjectURL(files[i]);
			console.log(files[i]);
			const html = "<h5>"+files[i].name+"</h5>";
			document.querySelector("form").insertAdjacentHTML("afterend", html);
		}
	}
	</script>

	
	</body>
</html>