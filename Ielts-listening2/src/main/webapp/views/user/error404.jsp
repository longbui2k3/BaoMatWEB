<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" href="../assets/libs/glightbox/dist/css/glightbox.min.css">
        <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Codescandy" />

    <!-- Favicon icon-->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico" />

    <!-- darkmode js -->
    <script src="../assets/js/vendors/darkMode.js"></script>

    <!-- Libs CSS -->
    <link href="../assets/fonts/feather/feather.css" rel="stylesheet" />
    <link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet" />
    <link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet" />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="../assets/css/theme.min.css">

        <link rel="canonical" href="course-single.html">
    <title>Bài học</title>
    

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
	    <!-- Page Content -->
        <main>
            <section class="container d-flex flex-column vh-100">
              <div class="row align-items-center justify-content-center g-0 h-lg-100 py-10">
                <!-- Docs -->
                <div class="offset-xl-1 col-xl-4 col-lg-6 col-md-12 col-12 text-center text-lg-start">
                  <h1 class="display-1 mb-3">404</h1>
                  <p class="mb-5 lead px-4 px-md-0">${e}
                  </p>
                  <a href="<c:url value='/authentication-login' />" class="btn btn-primary me-2">Đăng nhập</a>
                </div>
                <!-- img -->
                <div class="offset-xl-1 col-xl-6 col-lg-6 col-md-12 col-12 mt-8 mt-lg-0">
                  <img src="../assets/images/error/404-error-img.svg" alt="error" class="w-100" />
                </div>
              </div>
            </section>
        </main>
</body>


</html>