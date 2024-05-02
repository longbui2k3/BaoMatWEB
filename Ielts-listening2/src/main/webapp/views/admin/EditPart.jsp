<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="editPart?id=${partId}" method="post"
		enctype="multipart/form-data"
		style="margin-bottom: 20px; margin-top: 20px">
		<input style="display: none" name="testId"
			value="${listeningPart.mockTests.testId}"> <input
			style="display: none" name="partId" value="${listeningPart.partId }">
		<input style="display: none" name="partNumber"
			value="${listeningPart.number}">
		<div id="test-l-1" class="bs-stepper-pane"
			aria-labelledby="courseFormtrigger1">
			<!-- Card -->
			<div class="card mb-3">
				<div class="card-header border-bottom px-4 py-3">
					<h4 class="mb-0">Chỉnh sửa Part</h4>
				</div>
				<!-- Card body -->
				<div style="max-height: 450px" class=" overflow-auto">
					<div class="card-body">
						<div class="mb-3">
							<label for="courseTitle" class="form-label">Number of
								Part : ${listeningPart.number}</label>
						</div>

						<div class="mb-3">
							<audio style="width: 100%"
								src="<c:url value='/image?fname=topicAudio/${listeningPart.audio }'/>"
								controls></audio>

							<label class="form-label">Edit Audio File</label> <input
								style="display: none" name="preAudio"
								value="${listeningPart.audio }"> <input
								value="${listeningPart.audio }" type="file" id="audioFile"
								name="audioFile" multiple="multiple"
								style="border: 1px solid black;" accept="audio/*, .mp3"
								onchange="showFile(this)">

							<div id="audio"></div>
						</div>
						<div class="mb-3">
							<label class="form-label">Answer Sheet</label>
							<div id="editor">
								<div>${listeningPart.answerSheet}</div>
							</div>
							<input type="hidden" id="answerSheetInput" name="answerSheet"
								value="${listeningPart.answerSheet }" />
						</div>
					</div>

					<div class="card-body">
						<div class="mb-3">
							<label class="form-label">Answer Test</label>

						</div>
						<div id="answerTest" class="d-flex flex-column gap-3">
							<c:forEach var="answer" items="${listAnswer}">
								<div class="d-flex flex-column gap-3">
									<label>Question ${answer.number}</label> <input
										name="answer${answer.number}" class="form-control"
										placeholder="Enter your answer..."
										value="${answer.answerKey }"> <input
										style="display: none" name="answerId${answer.number}"
										value="${answer.answerId}">
								</div>
							</c:forEach>
						</div>

					</div>

				</div>
				<!-- Button -->
				<button margin: 10px"
						class="btn btn-primary" type="submit">Xác
					nhận</button>
			</div>
		</div>
	</form>


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