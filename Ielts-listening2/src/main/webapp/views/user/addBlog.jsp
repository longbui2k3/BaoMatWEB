<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="model"
		style="min-width: 500px; margin-top: 10px; margin-bottom: 10px">
		<form action="add-blog" method="post" enctype="multipart/form-data">
			<input name="idTest" value="${idTest}" style="display: none">
			<div id="test-l-1" class="bs-stepper-pane"
				aria-labelledby="courseFormtrigger1">
				<!-- Card -->
				<div class="card mb-3">
					<div class="card-header border-bottom px-4 py-3">
						<h4 class="mb-0">Tạo blog mới</h4>
					</div>
					<!-- Card body -->
					<div style="max-height: 450px" class=" overflow-auto">
						<div class="card-body">
							<div class="mb-3">
								<label for="courseTitle" class="form-label">Title</label><input
									id="partNumber" name="title" class="form-control" type="text"
									placeholder="Title" required> <small>Write a 60
									character blog title.</small>
							</div>

							<div class="mb-3">
								<label class="form-label">Thumbnail</label>
								<div class="input-group mb-3">
									<input type="file" name="image"
										class="popup-upload__input form-control"
										accept="image/jpeg, image/png" id="img"
										aria-describedby="basic-addon3">
								</div>
							</div>
							<div class="mb-3">
								<label class="form-label">Content</label>
								<div id="editor">
									<div>This is some sample content.</div>
								</div>
								<input type="hidden" id="content" name="content" />
							</div>
						</div>

					</div>
					<!-- Button -->

				</div>
				<button style="margin: 10px; width: fit;" class="btn btn-primary"
					type="submit">Xác nhận</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

	<script>
	 ClassicEditor
     .create(document.querySelector('#editor'))
     .then(editor => {
         console.log(editor);

         // Update hidden input with CKEditor content
         editor.model.document.on('change:data', () => {
             document.getElementById('content').value = editor.getData();
         });
     })
     .catch(error => {
         console.error(error);
     });
     </script>

</body>
</html>