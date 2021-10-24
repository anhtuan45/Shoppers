<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page Error</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
	<div
		style="background-image: url('data:image/png;base64,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');">
		<div style="min-height: 720px; padding-top: 70px;">

			<!-- Default form subscription -->
			<div class="col-4 offset-4 mt-5 text-center">
				<h1 class="display-1" style="color: blue">
					<b>404</b>
					<h2 style="color: red">ERROR</h2>
				</h1>
				<div style="color: white;" class="mt-5">
				<h3>Try logging in again!!</h3>
				</div>
				<!-- Sign in button -->
				<a class="btn btn-info btn-block col-2" href="${ pageContext.request.contextPath }/login">Login!</a>	
			<!-- Default form subscription -->
		</div>
		</div>
	</div>
</body>
</html>