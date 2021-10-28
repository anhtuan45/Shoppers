<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Product</title>

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
	
	<div class="col-10 offset-1 mt-4">
	<h2>Product</h2>
	</div>
	
	
	<div class="col-10 offset-1 mt-4 border border-gray p-2">
		<form method="get" action="${ pageContext.request.contextPath }/admin/products">
			<label for="">Category</label>
			<select id="categories" name="categories" class="form-control"> <!-- get theo name = categories -->
				<option value="">All</option>
				<c:forEach items="${categoryData }" var="category">
					<option value="${category.id }">${category.name }</option>
				</c:forEach>
			</select>
			
			<div>
				<button class="btn btn-primary mt-4">Search</button>
			</div>
		</form>
	</div>
	
	 <form class="mx-auto" style="width: 200px;margin-top:35px;" action="${ pageContext.request.contextPath }/admin/products">
	 	
      	<input class="form-control" style="width: 250px;height:50px;" name="keyword" id="keyword" value="${keyword}" type="search" placeholder="Search ..." aria-label="Search">
      <!-- <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
    </form>
	
	
	<div class="mt-5 col-10 offset-1 border border-gray p-2 mb5">
		<div class="">
			<a
				class="btn btn-success col-1"
				href="${ pageContext.request.contextPath }/admin/products/create">Create</a>
		</div>
		  <table class="table table-bordered table-dark mt-3">
			<thead>
				<tr>
					<td>Id</td>
					<td>Name</td>
					<td>Image</td>
					<td>Price</td>
					<td>Create_date</td>
					<td>Quantity</td>
					<td>Status</td>
					<td colspan="2">Actions</td>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${ pageData.content }" var="product">
				<tr>
						<td>${ product.id }</td>
						<td>${ product.name }</td>
						<td>${ product.image }</td>
						<td>${ product.price }</td>
						<td>${ product.createDate }</td>
						<td>${ product.available}</td>
						<td>${ product.activate == 1 ? "Activate" : "Inactive" }</td>
						<td>
							<a
								class="btn btn-primary"
								href="${ pageContext.request.contextPath }/admin/products/edit/${product.id}">Update</a>
						</td>
						<td>
							<form action="${ pageContext.request.contextPath }/admin/products/delete/${product.id}" method="POST">
								<button class="btn btn-danger" onclick="confirmDelete(event)">Delete</button>
							</form>
						</td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="mx-auto text-white text-center" style="width: 200px;">
			<ul class="pagination">
				<c:forEach begin="0" end="${ pageData.totalPages > 0 ? pageData.totalPages-1 : 0}" varStatus="page">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/admin/products?page=${page.index}&limit=5">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	
	
	<script type="text/javascript">
		 function confirmDelete(event) {
			var x = confirm("Are you sure you want to delete ?");
			if(x){
				alert("Delete sucessfully !")
			}else{
				event.preventDefault()
			}

		} 
		
	</script>
</body>
</html>