<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/fonts/icomoon/style.css">

    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/magnific-popup.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/jquery-ui.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/owl.carousel.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/owl.theme.default.min.css">


    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/aos.css">

    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/style.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/common/nav.jsp"></jsp:include>
	</div>

	<div class="container my-2">
		
		<h2 class="text-center" style="color: red;">Statistics by category</h2>
		
		<table border="1" class="table table-bordered table-dark mt-3">
			<thead>
				<tr>
					<th>No</th>
					<th>Category Name</th>
					<th>Quantity</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="r" items="${ pageData.content }" varStatus="loop">
					<tr>
						<th scope="row">${loop.index + 1}</th>
						<td>${ r.loai.name }</td>
						<td>${ r.soLuong }</td>
						<td>${ r.doanhthu} $</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		
		<h5 style="text-align: right;color:black">Total : ${ totalOrder } $</h5>
		
		<div class="mx-auto text-white text-center" style="width: 200px;">
			<ul class="pagination">
				<c:forEach begin="0" end="${ pageData.totalPages > 0 ? pageData.totalPages - 1 : 0}" varStatus="page">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/admin/report?page=${page.index}&limit=5">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	<hr/>
	
	<div class="container my-2">
		<h2 class="text-center" style="color: red;">Statistics by product</h2>
		<table border="1" class="table table-bordered table-dark mt-3">
			<thead>
				<tr>
					<th>No</th>
					<th>Product Name</th>
					<th>Category</th>
					<th>Quantity</th>
					<th>Total</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageData2.content}" var="report" varStatus="loop">
					<tr>
						<th scope="row">${loop.index + 1}</th>
						<td>${ report.product.name}</td>
						<td>${ report.category.name}</td>
						<td>${ report.count }</td>
						<td>${report.total} $</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		
		<h5 style="text-align: right;color:black">Total : ${ totalOrder } $</h5>
		
		<div class="mx-auto text-white text-center" style="width: 200px;">
			<ul class="pagination">
				<c:forEach begin="0" end="${ pageData2.totalPages > 0 ? pageData2.totalPages - 1 : 0}" varStatus="page">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/admin/report?page=${page.index}&limit=5">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>

</body>
</html>