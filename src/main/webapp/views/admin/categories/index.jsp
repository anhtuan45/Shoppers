<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Category</title>

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
	
	<div class="col-10 offset-1 mt-5 border border-gray p-2">
		<form method="GET" action="${ pageContext.request.contextPath }/admin/categories">
			<div class="row col-12 mt-2">
				<div class="col-6">
					<label>Sort By</label>
					<select name="sort_by" class="form-control">
						<option value="id">Default</option>
						<option value="name" >Category name</option>
						<option value="activate" >Status</option>
					</select>
				</div>
				<div class="col-6">
					<label>Sort Order</label>
					<select name="sort_direction" class="form-control">
						<option value="asc">Ascending</option>
						<option value="desc">Decrease</option>
					</select>
				</div>
			</div>
			
			<div>
				<button class="btn btn-primary mt-4">Filter</button>
				<a href="${ pageContext.request.contextPath }/admin/categories"
					class="btn btn-danger mt-4" type="reset">
					Reset
				</a>
			</div>
		</form>
	</div>
	
	<!-- Table -->
	<div class="mt-5 col-10 offset-1 border border-gray p-2">
		<div class="">
			<a
				class="btn btn-success col-1"
				href="${ pageContext.request.contextPath }/admin/categories/create">Create</a>
		</div>
		  <table class="table table-bordered table-dark mt-3">
			<thead>
				<tr>
					<td>Id</td>
					<td>Username</td>
					<td>Status</td>
					<td colspan="2">Actions</td>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${ pageData.content }" var="category">
				<tr>
						<td>${ category.id }</td>
						<td>${ category.name }</td>
						<td>${ category.activate == 1 ? "Activate" : "Inactive" }</td>
						<td>
							<a
								class="btn btn-primary"
								href="${ pageContext.request.contextPath }/admin/categories/edit/${category.id}">Update</a>
						</td>
						<td>
							<form action="${ pageContext.request.contextPath }/admin/categories/delete/${category.id}" method="POST">
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
						<a class="page-link" href="${ pageContext.request.contextPath }/admin/categories?page=${page.index}&limit=5&sort_direction=${sort}">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!-- End table  -->
	
	
	
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