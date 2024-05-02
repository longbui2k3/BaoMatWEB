<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
		<section class="pt-lg-8 pb-8">
			<div class="container pb-lg-8">
				<div class="row align-items-center">
					<div class="col-xl-7 col-lg-7 col-md-12">
						<a href="listLesson?courseId=${lesson.courses.courseId}"
							class="link-primary fw-semibold">
							<div class="d-flex align-items-center pb-4">
								<i class="fe fe-arrow-left"></i> Trở về
							</div>
						</a>
					</div>
					<div>
						<form action="editLesson" method="post"
							enctype="multipart/form-data">
							<div id="test-l-1" class="bs-stepper-pane"
								aria-labelledby="courseFormtrigger1">
								<!-- Card -->
								<div class="card mb-3">
									<div class="card-header border-bottom px-4 py-3">
										<h4 class="mb-0">Tạo bài học mới</h4>
									</div>
									<!-- Card body -->
									<div class=" overflow-auto">
										<div class="card-body">
											<div class="mb-3">
												<label for="courseTitle" class="form-label">Tên bài
													học</label> <input id="lessonName" name="lessonName"
													value="${lesson.lessonName }"
													class="model__name form-control" type="text"
													placeholder="Tên bài học" required> <small>Write
													a 60 character course title.</small>
											</div>

											<div class="mb-3">
												<label class="form-label">Edit Video File</label>
												<video style="max-width: 100%; max-height: 500px"
													width="1080" height="607.5" controls class="pt-2">
													<source
														src="<c:url value='/image?fname=${folder }/${lesson.video }'/>"
														type="video/mp4">
												</video>
												<br> <input style="display: none" name="preAudio"
													value="${lesson.video }"> <input
													value="${lesson.video }" type="file" class="form-control"
													name="video" id="" accept="video/mp4" require>
												<div id="audio"></div>
											</div>

											<div class="mb-3">
												<label class="form-label">Answer Sheet</label>
												<div id="editor">
													<div>${lesson.answerSheet }</div>
												</div>
												<input type="hidden" id="answerSheetInput"
													name="answerSheet" value="${lesson.answerSheet }" />

											</div>
										</div>

										<div class="card-body">
											<div class="mb-3">
												<label class="form-label">Answer Test</label>

											</div>
											<div id="answerLesson" class="d-flex flex-column gap-3">
												<c:forEach var="ans" items="${listAns}">
													<div class="d-flex flex-column gap-3">
														<label name="question${ans.number}"
															value="question${ans.number}">Question
															${ans.number}</label> <input type="text"
															placeholder="Enter your answer..." class="form-control"
															name="answer${ans.number}" value="${ans.answerKey}">
														<input type="Hidden" name="answerId${ans.number}"
															value="${ans.answerId}">
													</div>

												</c:forEach>
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
				</div>
			</div>
		</section>
	</main>
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
</body>
</html>