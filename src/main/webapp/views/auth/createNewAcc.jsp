<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Account</title>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/css2/bootstrap.min.css"></link>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style2.css" /> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style1.css" />
</head>
<body>
	<div style="min-height: 610px; padding-top: 50px;">
		<div class="col-7 offset-4">
			<div class="col-6 mt-2 border border-gray p-4">
				<h3 align="center">Create account</h3>
				<form:form modelAttribute="user" method="POST"
					action="${ pageContext.request.contextPath }/createNewAcc">

					<div class="form-group mt-3">
						<label for="username">Name</label>
						<form:input path="username" class="form-control" id="username"
							name="username" autocomplete="off" />
						<form:errors path="username" element="span" cssClass="text-danger" />
					</div>

					<div class="form-group mt-3">
						<label for="email">Email</label>
						<form:input path="email" class="form-control" id="email"
							name="email" autocomplete="off" />
						<form:errors path="email" element="span" cssClass="text-danger" />
					</div>

					<div class="form-group mt-3">
						<label for="password">Password</label>
						<form:password path="password" class="form-control" id="password"
							name="password" autocomplete="off" />
						<form:errors path="password" element="span" cssClass="text-danger" />
					</div>
					
					<%-- <div class="form-group mt-3">
						<label for="password">Confirm Password</label>
						<form:password path="CPpassword" class="form-control" id="password"
							name="CPpassword" autocomplete="off" />
						<form:errors path="CPpassword" element="span" cssClass="text-danger" />
					</div> --%>

					<div class="form-group mt-3" style="display: none">
						<label for="admin">Role</label>
						<form:select path="admin" id="admin" class="form-control">
							<form:option value="0">Member</form:option>
						</form:select>
						<form:errors path="admin" element="span" cssClass="text-danger" />
					</div>

					<div class="form-group mt-3" style="display: none">
						<label for="photo">Image</label> 
						<input type="file" class="form-control" id="avatar" name="photo" />
						<form:errors path="photo" element="span" cssClass="text-danger" />
					</div>

					<div class="form-group mt-3" style="display: none">
						<label for="activated">Activated</label>
						<form:select path="activated" id="activated" class="form-control">
							<form:option value="1">Active</form:option>
						</form:select>
						<form:errors path="activated" element="span"
							cssClass="text-danger" />
					</div>

					<div class="form-group mt-3">
						<button class="btn btn-primary">Submit</button>
						<button type="reset" class="btn btn-danger">Clear</button>
						<a class="btn btn-primary"
							href="${ pageContext.request.contextPath }/login"
							style="align-content: flex-end;">Login</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
	<%-- <div class="registration-form">
        <form action="/signUp" method="post">
            <div class="form-icon">
                <span><i class="icon icon-user"></i></span>
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="username" placeholder="Name" name="username">
            </div>
            <div class="form-group">
                <input type="password" class="form-control item" id="password" placeholder="Password" name="password">
            </div>
            <div class="form-group">
                <input type="text" class="form-control item" id="email" placeholder="Email" name="email">
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-block create-account">Tạo tài khoản</button>
            </div>
            <a href="login" class="btn btn-light">Đăng nhập</a>
        </form> 
        <div class="social-media">
            <h5>Đăng nhập với</h5>
            <div class="social-icons">
                <a href="#"><i class="icon-social-facebook" title="Facebook"></i></a>
                <a href="#"><i class="icon-social-google" title="Google"></i></a>
                <a href="#"><i class="icon-social-twitter" title="Twitter"></i></a>
            </div>
        </div>
    </div> --%>
</body>
</html>