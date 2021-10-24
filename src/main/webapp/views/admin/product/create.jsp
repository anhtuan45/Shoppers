<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create product</title>

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

	<div style="min-height: 700px">
	<div class="col-10 offset-1 mt-4">
	<h2>Thêm sản phẩm</h2>
	</div>
	<div class="mt-5 col-10 offset-1">
		
		<form:form
			modelAttribute="product"
			method="POST" enctype="multipart/form-data"
			action="${ pageContext.request.contextPath }/admin/products/store">
			
			<div class="form-group mt-3">
				<label for="category">Category :</label>
				<form:select path="categoryId" id="category" class="form-control">
					<c:forEach items="${ categoryData }" var="category">
						<form:option value="${category.id}" >${category.name}</form:option>
					</c:forEach>
				</form:select>
				<form:errors path="available" element="span" cssClass="text-danger" />	
			</div>
			
			<div class="form-group mt-3">
				<label for="name">Name</label>
			    <form:input  path="name" class="form-control" id="name" name="name" autocomplete="off" />
			    <form:errors path="name" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="image">Image</label>
			    <input type="file" class="form-control" id="image" name="image">
			    <form:errors path="image" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="price">Price</label>
			    <form:input  path="price" class="form-control" id="price" name="price" autocomplete="off" />
			   	<form:errors path="price" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="createDate">Date</label>
			    <form:input  path="createDate" class="form-control" id="createDate" name="createDate" value="${date}" autocomplete="off"  readonly="true"/>
			</div>
			
			<div class="form-group mt-3">
				<label for="available">Available</label>
			    <form:input  path="available" class="form-control" id="available" name="available" autocomplete="off" />
			   	<form:errors path="available" element="span" cssClass="text-danger" />
			</div>
			
			
			
			<div class="form-group mt-3">
				<label for="activate">Activated</label>
				<form:select path="activate" id="activate" class="form-control" >
					<form:option value="1" >Activate</form:option>
					<form:option value="0" >Inactive</form:option>
				</form:select>
				<form:errors path="activate" element="span" cssClass="text-danger" />
			</div>
			
			
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
			
		</form:form>
	</div>
	</div>
</body>
</html>