<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Bin</title>
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/bootstrap.min.css"></link>
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/common/nav.jsp"></jsp:include>
	</div>
	<div class="col-10 offset-1 mt-4">
		<h2>Recycle Bin User</h2>
	</div>

	<div class="col-10 offset-1 mt-5 border border-primary p-2">
		<form method="GET" action="${ pageContext.request.contextPath }/admin/users/bin">
			<div class="row col-12 mt-2">
				<div class="col-6">
					<label>Sắp xếp theo</label>
					<select name="sort_by" class="form-control">
						<option value="id">Mặc định</option>
						<option value="username" >
							Họ Tên
						</option>
						<option value="email">Email</option>
						<option value="admin">Tài khoản</option>
						<option value="activated">Trạng thái</option>
					</select>
				</div>
				<div class="col-6">
					<label>Thứ tự</label>
					<select name="sort_direction" class="form-control">
						<option value="asc">Tăng dần</option>
						<option value="desc">Giảm dần</option>
					</select>
				</div>
			</div>
			
			<div>
				<button class="btn btn-primary mt-4">Lọc</button>
				<a href="${ pageContext.request.contextPath }/admin/users/bin"
					class="btn btn-danger mt-4" type="reset">
					Reset
				</a>
			</div>
		</form>
	</div>

	<div class="mt-5 col-10 offset-1 border border-primary p-2">
		  <table class="table table-strip table-dark mt-3">
			<thead>
				<tr>
					<td>Id</td>
					<td>Username</td>
					<td>Email</td>
					<td>Tài khoản</td>
					<td>Trạng thái</td>
					<td colspan="2">Thao tác</td>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${ pageData.content }" var="user">
				<tr>
						<td>${ user.id }</td>
						<td>${ user.username }</td>
						<td>${ user.email }</td>
						<td>${ user.admin == 1 ? "Admin" : "User" }</td>
						<td>${ user.activated == 1 ? "Đang hoạt động" : "Vô hiệu hóa" }</td>
						<td>
							<form action="${ pageContext.request.contextPath }/admin/users/bin/restore/${user.id}" method="POST">
								<button class="btn btn-success">Restore</button>
							</form>
						</td>
						<td>
							<form action="${ pageContext.request.contextPath }/admin/users/bin/delete/${user.id}" method="POST">
								<button class="btn btn-danger" onclick="confirmDelete(event)">Delete</button>
							</form>
						</td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div>
			<ul class="pagination">
				<c:forEach begin="0" end="${ pageData.totalPages>0?pageData.totalPages-1:0 }" varStatus="page">
					<li class="page-item">
						<a class="page-link" href="${ pageContext.request.contextPath }/admin/users/bin?page=${page.index}&limit=3&sort_direction=${sort}">${ page.index + 1 }</a>
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