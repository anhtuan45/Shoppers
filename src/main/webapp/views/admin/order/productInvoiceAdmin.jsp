<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Management</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/bootstrap.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/magnific-popup.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/jquery-ui.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/owl.carousel.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/owl.theme.default.min.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/aos.css">
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/style.css">
    
</head>
<body>
	
	<div>
		<jsp:include page="/views/admin/common/nav.jsp"></jsp:include>
	</div>

	<div style="min-height: 610px" class="mb-5">
	<div class="col-10 offset-1 mt-4"  >
	<h2>Invoice Management</h2>
	</div>
	<div class="col-10 offset-1 mt-5 border border-gray p-2">
		<form method="GET" action="${ pageContext.request.contextPath }/admin/users/productInvoice">
			<div class="row col-12 mt-2">
				<div class="col-6">
					<label>Sort By</label>
					<select name="sort_by" class="form-control">
						<option value="id">Default</option>
						<option value="address" >Address</option>
					</select>
				</div>
				<div class="col-6">
					<label>Thứ tự</label>
					<select name="sort_direction" class="form-control">
						<option value="asc">Ascending</option>
						<option value="desc">Decrease</option>
					</select>
				</div>
			</div>
			
			<div>
				<button class="btn btn-primary mt-4">Lọc</button>
				<a href="${ pageContext.request.contextPath }/admin/users/productInvoice"
					class="btn btn-danger mt-4" type="reset">
					Reset
				</a>
			</div>
		</form>
	</div>

	<div class="mt-5 col-10 offset-1 border border-gray p-2">
		  <table class="table table-strip table-dark mt-3">
			<thead>
				<tr>
					<td>Id</td>
					<td>User name</td>
					<td>Create Date</td>
					<td>Address</td>
					<td>Phone</td>
					<td>Status</td>
					<td colspan="2">Actions</td>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${ pageData.content }" var="order">
				<tr>
						<td>${ order.id }</td>
						<td>${ order.user.username }</td>
						<td>${ order.createDate }</td>
						<td>${ order.address}</td>
						<td>${ order.phone}</td>
						<form action="${ pageContext.request.contextPath }/admin/users/productInvoice/${order.id}" method="POST">
							<td>
								<select name="activate"  class="form-control">
									<option value="1" ${order.activate == 1 ? "selected" : "" }>Đang xử lý</option>
									<option value="2" ${order.activate == 2 ? "selected" : "" }>Đang giao</option>
									<option value="3" ${order.activate == 3 ? "selected" : "" }>Hoàn thành</option>
									<option value="4" ${order.activate == 4 ? "selected" : "" }>Đã hủy</option>
								</select>
							</td>
							<td>
								<button class="btn btn-primary">Update</button>
							</td>
						</form>
					</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div class="mx-auto text-white text-center" style="width: 200px;">
			<ul class="pagination pull-right">
				<c:forEach begin="0" end="${ pageData.totalPages > 0 ? pageData.totalPages - 1 : 0 }" varStatus="page">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/admin/users/productInvoice?page=${page.index}&limit=3&sort_direction=${sort}">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</div>

</body>
</html>