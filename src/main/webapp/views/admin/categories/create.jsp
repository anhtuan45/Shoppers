<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Category</title>

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
	
	<div class="mt-5 col-10 offset-1">
	<h2>Add category</h2>
	<!-- modelAttribute="categories" là cái model ở /create GET -->
		<form:form method="POST" modelAttribute="category" action="${ pageContext.request.contextPath }/admin/categories/store">
			<div class="form-group mt-3">
				<label for="name">Name</label>
			    <form:input  path="name" class="form-control" id="name" name="name" autocomplete="off" />
			    <form:errors path="name" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="activate">Activated</label>
			    <form:select  path="activate" class="form-control" id="activate" name="activate" autocomplete="off">
			    	<form:option value="1">Activate</form:option>
			    	<form:option value="0">Inactive</form:option>
			    </form:select>
			    <form:errors path="activate" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		
		</form:form>
	</div>
</body>
</html>