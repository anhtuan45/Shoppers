<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Users</title>

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
	<h2>Add users</h2>
	</div>
	<div class="mt-5 col-10 offset-1">
	<%-- modelAttribute="user" la cua model.addAttribute("user", userDTO); --%>
		<form:form
			modelAttribute="user" 
			method="POST"
			action="${ pageContext.request.contextPath }/admin/users/store">
			
			<div class="form-group mt-3">
				<label for="username">Name</label>
			    <form:input  path="username" class="form-control" id="username" name="username" autocomplete="off" />
			    <form:errors path="username" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="email">Email</label>
			    <form:input  path="email" class="form-control" id="email" name="email" autocomplete="off" />
			   	<form:errors path="email" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="password">Password</label>
			    <form:password  path="password"  class="form-control" id="password" name="password" autocomplete="off"  />
			    <form:errors path="password" element="span" cssClass="text-danger" />
			</div>
			
			
			<div class="form-group mt-3">
				<label for="admin">Role</label>
				<form:select path="admin" id="admin" class="form-control" >
					<form:option value="0" >User</form:option>
					<form:option value="1" >Admin</form:option>
				</form:select>
				<form:errors path="admin" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<!-- <label for="photo">Image</label> -->
			    <!-- <input type="file" class="form-control" id="avatar" name="photo"> -->
<%-- 			    <form:errors path="photo" element="span" cssClass="text-danger" /> --%>
			</div>
			
			<div class="form-group mt-3">
				<label for="activated">Activated</label>
				<form:select path="activated" id="activated" class="form-control" >
					<form:option value="1" >Active</form:option>
					<form:option value="0" >Inactive</form:option>
				</form:select>
				<form:errors path="activated" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
			
		</form:form>
	</div>
	
</body>
</html>