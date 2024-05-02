<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<script
	src="https://cdn.ckeditor.com/ckeditor5/39.0.2/classic/ckeditor.js"></script>
<script src="https://cdn.ckbox.io/ckbox/2.3.1/ckbox.js"></script>
<link rel="stylesheet"
	href="https://cdn.ckbox.io/ckbox/2.3.1/styles/themes/lark.css">
</head>
<body>
	<div id="editor"></div>
	<script>
            ClassicEditor
                .create( document.querySelector( '#editor' ), {
                    ckbox: {
                        tokenUrl: 'https://your.token.url',
                        theme: 'lark'
                    },
                    toolbar: [
                        'ckbox', 'imageUpload', '|', 'heading', '|', 'undo', 'redo', '|', 'bold', 'italic', '|',
                        'blockQuote', 'indent', 'link', '|', 'bulletedList', 'numberedList'
                    ],
                } )
                .catch( error => {
                    console.error( error );
                } );
        </script>
</body>
</html>
