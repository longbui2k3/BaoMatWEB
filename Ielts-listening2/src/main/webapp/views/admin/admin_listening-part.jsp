<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Add Bootstrap CSS link if not already included -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
</head>
<body>
	<div style="padding-top: 30px">
		<h3>Parts</h3>
		<div class="row">
			<c:forEach var="part" items="${listPart}">
				<!-- <div
					class="col d-flex flex-column justify-content-center align-items-center border bg">
					<img alt="" src="${part.image}"> <span>${part.partId}</span>
					<span>Number of Part : ${part.number}</span>
					<audio src="${part.audio}" controls></audio>
					<span>AnswerSheet : </span>
					<div>${part.answerSheet}</div>
				</div> -->


				<div class="col-lg-3 col-md-6 col-12 position-relative">
					<form action="deletePart?id=${part.partId}" method="post">
						<input name="idTest" value=${idTest } style="display: none">
						<button type="submit"
							style="z-index: 2; color: red; top: -5px; right: 11px"
							class="position-absolute btn " class="icon-link icon-delete">
							<i style="width: 16px; height: 16px" class="fe fe-trash-2 "></i>
						</button>
					</form>
					<!-- Card -->
					<div class="card mb-4 card-hover">
						<a href="editPart?id=${part.partId}"><img
							src="https://hrchannels.com/uptalent/attachments/images/20230417/112610454_TOEIC-la-gi-1.jpg"
							alt="course" class="card-img-top" /></a>
						<!-- Card body -->
						<div class="card-body">
							<h3 class="h4 mb-2 text-truncate-line-2">

								<a href="editPart?id=${part.partId}" class="text-inherit">Number
									of Part : ${part.number}</a>
							</h3>
							<ul class="mb-3 list-inline">
								<li class="list-inline-item"><span> <svg
											xmlns="http://www.w3.org/2000/svg" width="12" height="12"
											fill="currentColor" class="bi bi-clock align-baseline"
											viewBox="0 0 16 16">
                                  <path
												d="M8 3.5a.5.5 0 0 0-1 0V9a.5.5 0 0 0 .252.434l3.5 2a.5.5 0 0 0 .496-.868L8 8.71V3.5z" />
                                  <path
												d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm7-8A7 7 0 1 1 1 8a7 7 0 0 1 14 0z" />
                                </svg>
										<li class="list-inline-item"><svg class="me-1 mt-n1"
												width="16" height="16" viewBox="0 0 16 16" fill="none"
												xmlns="http://www.w3.org/2000/svg">
                                <rect x="3" y="8" width="2" height="6"
													rx="1" fill="#754FFE"></rect>
                                <rect x="7" y="5" width="2" height="9"
													rx="1" fill="#DBD8E9"></rect>
                                <rect x="11" y="2" width="2" height="12"
													rx="1" fill="#DBD8E9"></rect>
                              </svg> Beginner</li>
							</ul>
							<div class="lh-1">
								<audio style="width: 100%"
									src="<c:url value='/image?fname=topicAudio/${part.audio }'/>"
									controls></audio>
							</div>
						</div>
						<!-- Card Footer -->
						<div class="card-footer">
							<div class="row align-items-center g-0">
								<div class="col-auto">
									<img src="../assets/images/avatar/avatar-3.jpg"
										class="rounded-circle avatar-xs" alt="avatar" />
								</div>
								<div class="col ms-2">
									<span>Morris Mccoy</span>
								</div>
								<div class="col-auto">
									<a href="#" class="text-reset bookmark"> <i
										class="fe fe-bookmark fs-4"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>

		<c:if test="${count < 4}">
			<button class="btn btn-dark" onclick="showModel()">Thêm phần
				mới</button>
		</c:if>
		<div id="model"
			style="min-width: 500px; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 3; display: none;">
			<form action="addPart" method="post" enctype="multipart/form-data">
				<input name="idTest" value=${idTest } style="display: none">
				<div id="test-l-1" class="bs-stepper-pane"
					aria-labelledby="courseFormtrigger1">
					<!-- Card -->
					<div class="card mb-3">
						<div class="card-header border-bottom px-4 py-3">
							<h4 class="mb-0">Tạo phần mới</h4>
						</div>
						<!-- Card body -->
						<div style="max-height: 450px" class=" overflow-auto">
							<div class="card-body">
								<div class="mb-3">
									<label for="courseTitle" class="form-label">Number of
										Part</label><input type="number" id="partNumber" name="partNumber"
										class="form-control" type="text" placeholder="No.Part"
										required> <small>Write a 60 character course
										title.</small>
								</div>

								<div class="mb-3">
									<label class="form-label">Add Audio File</label> <input
										type="file" id="audioFile" name="audioFile" required
										multiple="multiple" style="border: 1px solid black;"
										accept="audio/*, .mp3" onchange="showFile(this)">

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
								<div class="d-flex justify-content-between">
									<div style="margin: 10px"   onclick="addQuestion()" class="btn btn-light">Add
										Answer Test</div>
									<div style="margin: 10px" onclick="deleteQuestion()"
										class="btn btn-danger">
										<i class="fe fe-trash"></i> Delete
									</div>
								</div>

							</div>


						</div>
						<button style="margin: 10px" class="btn btn-primary" type="submit">Xác
							nhận</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div id="shadow"
		class="position-absolute top-0 start-0 bottom-0 end-0 bg-dark"
		style="opacity: 0.5; display: none; z-index: 2" onclick="hideShadow()"></div>

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
			const html = "<h5 style='display:none'>"+files[i].name+"</h5>";
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
		function showModel() {
			// Show the shadow
			document.getElementById("shadow").style.display = "block";
			document.getElementById("model").style.display = "block";
		}

		function hideShadow() {
			// Hide the shadow
			document.getElementById("shadow").style.display = "none";
			document.getElementById("model").style.display = "none";
		}
	</script>

</body>
</html>
