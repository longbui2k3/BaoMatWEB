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
	<main>
		<!-- Page header -->
		<section class="pt-lg-8 pb-8">
			<div class="container pb-lg-8">
				<div class="row align-items-center">
					<div class="col-xl-7 col-lg-7 col-md-12">
						<a href="khoahoc" class="link-primary fw-semibold">
							<div class="d-flex align-items-center pb-4">
								<i class="fe fe-arrow-left"></i> Trở về
							</div>
						</a>
						<div>
							<h1 class="text-dark display-4 fw-semibold">${course.courseName }</h1>
							<p class="text-dark mb-6 lead">${course.description }</p>
							<div class="d-flex align-items-center">
								<a href="#" class="bookmark text-dark"> <i
									class="fe fe-bookmark fs-4 me-2"></i> Bookmark
								</a> <span class="text-dark ms-3"> <i class="fe fe-user"></i>
									1200 Enrolled
								</span>
								<div>
									<span class="fs-6 ms-4 align-text-top"> <svg
											xmlns="http://www.w3.org/2000/svg" width="12" height="12"
											fill="currentColor" class="bi bi-star-fill text-warning"
											viewBox="0 0 16 16">
                                            <path
												d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                            </path>
                                        </svg> <svg
											xmlns="http://www.w3.org/2000/svg" width="12" height="12"
											fill="currentColor" class="bi bi-star-fill text-warning"
											viewBox="0 0 16 16">
                                            <path
												d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                            </path>
                                        </svg> <svg
											xmlns="http://www.w3.org/2000/svg" width="12" height="12"
											fill="currentColor" class="bi bi-star-fill text-warning"
											viewBox="0 0 16 16">
                                            <path
												d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                            </path>
                                        </svg> <svg
											xmlns="http://www.w3.org/2000/svg" width="12" height="12"
											fill="currentColor" class="bi bi-star-fill text-warning"
											viewBox="0 0 16 16">
                                            <path
												d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                            </path>
                                        </svg> <svg
											xmlns="http://www.w3.org/2000/svg" width="12" height="12"
											fill="currentColor" class="bi bi-star-fill text-warning"
											viewBox="0 0 16 16">
                                            <path
												d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z">
                                        </svg>
									</span> <span class="text-dark">(140)</span>
								</div>
								<span class="text-dark ms-4 d-none d-md-block"> <svg
										width="16" height="16"
										viewBox="0 0 16
                              16" fill="none"
										xmlns="http://www.w3.org/2000/svg">
                                        <rect x="3" y="8" width="2"
											height="6" rx="1" fill="#DBD8E9"></rect>
                                        <rect x="7" y="5" width="2"
											height="9" rx="1" fill="#DBD8E9"></rect>
                                        <rect x="11" y="2" width="2"
											height="12" rx="1" fill="#DBD8E9"></rect>
                                    </svg> <span class="align-middle">Intermediate</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Page content -->
		<section class="pb-8">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-md-12 col-12 mt-n8 mb-4 mb-lg-0">
						<!-- Card -->
						<div class="card rounded-3">
							<!-- Card header -->
							<div class="card-header border-bottom-0 p-0"></div>
							<!-- Card Body -->
							<div class="card-body text-center">
								<!-- Card -->
								<div class="accordion" id="courseAccordion">
									<%-- <!-- Test UI -->
									<div class="row">
										<button class="btn accordion d-flex justify-content-between align-items-center btn btn-light mb-2">
											<span>01</span>
											<a href="updateLesson">
												<input type="hidden" name="lessonId" value="${i.lessonId}">
												<span class="accordion-title ms-4">Introduction to IELTS Listening 01</span>
											</a>
											<a href="#" class="icon-link icon-delete"> 
												<i class="fe fe-trash color-dark"></i>
											</a>
										</button>
									</div> --%>
									<!-- Updated UI -->
									<c:forEach var="i" items="${listLesson}">
										<!-- Lesson list -->
										<div class="row" id="lessonList">
											<button value="${i.lessonId }"
												class="btn accordion d-flex justify-content-between align-items-center btn btn-light mb-2">
												<%-- <span>${i.lessonId }</span> --%>
												<%-- <input type="hidden" name="lessonId" value="${i.lessonId}"> --%>
												<a style="display: block; flex: 1; text-align: left;"
													href="editLesson?lessonId=${i.lessonId }"> <span
													class="accordion-title ms-4">${i.lessonName }</span>
												</a>
												<%-- <form action="deleteLesson" method="post" enctype="multipart/form-data">
													<input type="hidden" name="lessonId" value="${i.lessonId}">
													<button class="icon-link icon-delete"><i class="fe fe-trash color-dark"></i> </button>
												</form> --%>
												<a
													href="<c:url value='/admin/deleteLesson?id=${i.lessonId}'/>"
													class="icon-link icon-delete"> <i
													class="fe fe-trash color-dark"></i>
												</a>
											</button>
										</div>
									</c:forEach>
								</div>
								<!-- Add Lesson -->
								<button class="accordion btn btn-primary mt-2"
									onclick="showModel()">Thêm bài học</button>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-12 mt-lg-n8">
						<!-- Card -->
						<div class="card mb-3 mb-4">
							<div class="p-1">
								<div
									class="d-flex justify-content-center align-items-center rounded border-white border rounded-3 bg-cover"height: 210px">
									<video style="max-width: 100%" width="370" height="220"
										controls class="pt-2">
										<source
											src="<c:url value='/image?fname=${folder }/${course.trailer }'/>"
											type="video/mp4">
									</video>
								</div>
							</div>
							<!-- Card body -->
							<div class="card-body">
								<!-- Price single page -->
								<div class="mb-3">
									<span class="text-dark fw-bold h1">${course.courseName }</span>
									<span class="text-primary fw-bold h3">
										<p>
											<fmt:formatNumber value="${course.cost}"
												pattern="###,### VNĐ" />
										</p>
									</span> <span class="text-dark">
										<p>${course.description }</p>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Model -->
		<div class="model" id="model"
			style="min-width: 800px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 3; display: none;">
			<form action="addLesson" method="post" enctype="multipart/form-data">
				<div id="test-l-1" class="bs-stepper-pane"
					aria-labelledby="courseFormtrigger1">
					<!-- Card -->
					<div class="card mb-3">
						<div class="card-header border-bottom px-4 py-3">
							<h4 class="mb-0">Tạo bài học mới</h4>
						</div>
						<!-- Card body -->
						<div style="max-height: 450px" class=" overflow-auto">
							<div class="card-body">
								<div class="mb-3">
									<label for="courseTitle" class="form-label">Tên bài học</label>
									<input id="lessonName" name="lessonName" value=""
										class="form-control" type="text" placeholder="Tên bài học"
										required> <small>Write a 60 character course
										title.</small>
								</div>

								<div class="mb-3">
									<label class="form-label">Thêm video bài giảng</label> <input
										type="file" class="form-control" value="" name="video" id=""
										accept="video/mp4" require>
									<div id="audio"></div>
								</div>

								<div class="mb-3">
									<label class="form-label">Answer Sheet</label>
									<div id="editor">
										<div>This is some sample content.</div>
									</div>
									<input type="hidden" id="answerSheetInput" name="answerSheet" />
								</div>
							</div>

							<div class="card-body">
								<div class="mb-3">
									<label class="form-label">Answer Test</label>

								</div>
								<div id="answerTest" class="d-flex flex-column gap-3"></div>
								<div style="margin: 10px"  class="d-flex justify-content-between">
									<div onclick="addQuestion()" class="btn btn-light">Add
										Answer Test</div>
									<div style="margin: 10px" onclick="deleteQuestion()"
										class="btn btn-danger">
										<i class="fe fe-trash"></i> Delete
									</div>
								</div>
							</div>

						</div>
						<!-- Button -->
						<button margin: 10px" class="btn btn-primary" type="submit">Xác
							nhận</button>
					</div>
				</div>
			</form>
		</div>

		<div id="shadow"
			class="position-fixed  top-0 start-0 bottom-0 end-0 bg-dark"
			style="opacity: 0.5; display: none; z-index: 2"
			onclick="hideShadow()"></div>
	</main>

	<script>
		var arrLesson = [];
		var arrAnswer = [];
		// Duyệt danh sách Java và thêm dữ liệu vào biến JavaScript
		<c:forEach var="item" items="${listLesson}">
			var item = {
				lessonId : "${item.lessonId}",
				lessonName : "${item.lessonName}",
				video : "${item.video}",
				answerSheet: "${item.answerSheet}"
			};
			arrLesson.push(item);
		</c:forEach>
		
		<c:forEach var="item" items="${listAnsLesson}">
			var itemAns = {
				answerId : "${item.answerId}",
				answerKey : "${item.answerKey}",
				number: "${item.number}",
				lesson : "${item.lessons.lessonId}",
			};
			arrAnswer.push(itemAns);
		</c:forEach>
	</script>

	<script>
    let questionCount = 0;
    let newQuestionContainer;
    let answerTestDiv;
	if (questionCount === 0 ){
		
	}
    
    function addQuestion() {
        // Increment the question count
        questionCount++;

        // Create new components
        const newLabel = document.createElement('label');
        newLabel.textContent = 'Question ' + questionCount;
        newLabel.setAttribute('name', 'question' + questionCount);
        newLabel.setAttribute('value', 'question' + questionCount);

        const newInput = document.createElement('input');
        newInput.setAttribute('type', 'text');
        newInput.setAttribute('placeholder', 'Enter your answer...');
        newInput.classList.add('form-control'); // Add form-control class

        newInput.setAttribute('name', 'answer' + questionCount);

        // Create a container div for the new components
        newQuestionContainer = document.createElement('div');
        newQuestionContainer.classList.add('d-flex', 'flex-column', 'gap-3', 'newQuestionContainer'); // Add gap-3 class
        newQuestionContainer.appendChild(newLabel);
        newQuestionContainer.appendChild(newInput);

        // Get the answerTest div and append the new container
        answerTestDiv = document.getElementById('answerTest');
        answerTestDiv.appendChild(newQuestionContainer);
    }

    function deleteQuestion() {
        if (questionCount === 0) return;

        // Select the last added newQuestionContainer
        let questionContainers = document.querySelectorAll('.newQuestionContainer');
        let lastQuestionContainer = questionContainers[questionContainers.length - 1];

        // Remove the last added newQuestionContainer
        answerTestDiv.removeChild(lastQuestionContainer);
        questionCount--;
    }

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

	<script>
		 ClassicEditor
	     .create(document.querySelector('#editor'))
	     .then(editor => {
	         console.log(editor);
	
	         // Update hidden input with CKEditor content
	         editor.model.document.on('change:data', () => {
	             document.getElementById('answerSheetInput').value = editor.getData();
	         });
	     })
	     .catch(error => {
	         console.error(error);
	     });
	</script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

	<script>
		var model = document.getElementById("model");
		var shadow = document.getElementById("shadow");
		
		/*var btn = document.getElementsByClassName("btn-openmodel");
		for (i = 0; i < btn.length; i++) {
			btn[i].addEventListener("click", function() {
				
		        model.style.display = "block";
				shadow.style.display = "block";
				// document.body.style.overflow = 'hidden';
		        var lessonID = this.getAttribute("value");
		        console.log(this.getAttribute("value"));
		        for(var t of arrLesson) {
	                if(t.lessonId == lessonID) {
	                	document.querySelector(".model .model__name").setAttribute("value",t.lessonName);
	                	for (var a of arrAnswer) {
	                		if (lessonID == a.lesson) {}
	                		//document.querySelector(".model .model-ans__number").setAttribute("value", a.number);
	                		document.querySelector(".model .model-ans__key").setAttribute("value", a.answerKey);
	                	}
	                	/* document.querySelector(".model .model__video").setAttribute("value", t.video);
	                	document.querySelector(".model .model__answer-sheet").setAttribute("value", t.answerSheet);
	                	document.querySelector(".model .model__answer-sheet").setAttribute("value", t.image) ;
	                	document.querySelector(".model .popup-title__input").setAttribute("value",t.topicName) ;
	                	document.querySelector(".model .popup-descript__input").setAttribute("value", t.description) ;
	                	document.querySelector(".model .popup-id_input").setAttribute("value", t.topicId) ;
	                	document.querySelector(".model .form-popup").setAttribute("action", "updateTopic") ;
	                }
	            }
			}, false);
	        
		} */
		
		function showModel() {
			// Show the shadow
			model.style.display = "block";
			shadow.style.display = "block";
			
			
		}

		function hideShadow() {
			// Hide the shadow
			model.style.display = "none";
			shadow.style.display = "none";
		}
	</script>

</body>
</html>