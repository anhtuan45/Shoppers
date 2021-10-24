<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	<div style="min-height: 610px;">
		<div class="col-7 offset-4 mt-5 ">
		    <div class="col-6 mt-5 border border-gray p-4">
		    <h3 align="center">Change password</h3>
		        <form method="POST" action="${ pageContext.request.contextPath }/admin/users/changePW">
		        	<div class="mt-3" ">
		                <label for="email">Email</label>
		                <input type="email" value="${userCpw.email}" name="email" id="email" class="form-control" />
		            </div>
		        
		            <div class="mt-3">
		                <label for="password">Password</label>
		                <input type="password" name="password" id="password" class="form-control" />
		            </div>
		
		            <div class="mt-3">
		                <label for="newpassword">New password</label>
		                <input type="password" name="newpassword" id="newpassword" class="form-control" />
		            </div>
		            
		            <div  class="mt-3">
		            	<label for="CPpassword">Confirm password</label>
		                <input type="password" name="CPpassword" id="CPpassword" class="form-control" />
		            </div>
		            
		            <div class="mt-4" align="center">
		                <button class="btn btn-primary col-6">Ok</button>
		            </div>
		        </form>
		    </div>
		</div>
	</div>
</body>
</html>