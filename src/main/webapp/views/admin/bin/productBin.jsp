<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Bin</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript">
	function oncClickDelete(event) {
		var check=confirm('Bạn muốn xóa?');
		if(check===false){
			event.preventDefault()
		}else if(check===true){
			alert("Xóa thành công!")
		}
	}

</script>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/common/nav.jsp"></jsp:include>
	</div>
	<div class="col-10 offset-1 mt-4">
	<h2>Sản phẩm đã bị xóa</h2>
	</div>
	
	<div class="mt-5 col-10 offset-1 border border-gray p-2">
		  <table class="table table-strip table-dark mt-3">
			<thead>
				<tr>
					<td>Id</td>
					<td>Name</td>
					<td>Image</td>
					<td>Price</td>
					<td>Create_date</td>
					<td>Số lượng</td>
					<td>Trạng thái</td>
					<td colspan="2">Thao tác</td>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${ tesst }" var="product">
				<tr>
						<td>${ product.id }</td>
						<td>${ product.name }</td>
						<td>${ product.image }</td>
						<td>${ product.price }</td>
						<td>${ product.createDate }</td>
						<td>${ product.available}</td>
						<td>${ product.activate == 1 ? "Đang hoạt động" : "Vô hiệu hóa" }</td>
						<td>
							<form action="${ pageContext.request.contextPath }/admin/products/bin/restore/${product.id}" method="POST">
								<button class="btn btn-success">Restore</button>
							</form>
						</td>
						<td>
							<form action="${ pageContext.request.contextPath }/admin/products/bin/delete/${product.id}" method="POST">
								<button class="btn btn-danger" onclick="oncClickDelete(event)">Delete</button>
							</form>
						</td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>