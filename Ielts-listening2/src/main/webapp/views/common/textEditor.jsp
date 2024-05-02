<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CKEditor</title>

</head>
<body>
	<div id="editor">
		<div>This is some sample content.</div>
	</div>
	<script>
                        ClassicEditor
                                .create( document.querySelector( '#editor' ) )
                                .then( editor => {
                                        console.log( editor );
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                </script>
	<script
		src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>
</body>
</html>