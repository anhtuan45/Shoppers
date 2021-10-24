<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
	
	<div>
		<jsp:include page="/views/users/common/nav.jsp"></jsp:include>
	</div>
	
	<div class="mt-4 col-10 offset-1"  style="min-height: 610px">
	<h2>Shopping Cart</h2>
	<a class="btn btn-outline-secondary" href="${ pageContext.request.contextPath }/users/home" role="button">Sản phẩm khác</a>
	<hr>
	<table class="table table-strip table-dark mt-3">
	<thead>
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Image</td>
			<td>Price</td>
			<td>Quantity</td>
			<td>Amount</td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="item" items="${cart.items }">
		<form action="${ pageContext.request.contextPath }/users/home/cart/update/${item.id}" method="post">
		<form class="col-md-12" method="post" action="${ pageContext.request.contextPath }/users/home/cart/update/${item.id}">
				<input type="hidden" name="id" value="${item.id }"/>
				<tr>
					<td>${item.id}</td>
					<td>${item.name }</td>
					<td><img src="${ pageContext.request.contextPath }/images/${item.image}" alt="${item.image}" height="60px" width="80px"></td>
					<td>${item.price }</td>
					<td>
						
						<input value="${item.quantity }" name="quantity" type="number" min="1"
						onblur="this.form.submit()"/>
					</td>
					<td>${item.price * item.quantity }</td>
					<td>
						<a class="btn btn-danger" href="${ pageContext.request.contextPath }/users/home/cart/remove/${item.id}">Remove</a>
					</td>
				</tr>
		</form>
		</c:forEach>
	</tbody>
	
	</table>
	<h5 align="center">${mess}</h5>
	<hr>
	
	<div class="col-4 mt-3 border border-gray p-4 mb-5" style="display: ${cart.getCount() == 0 ?"none":""} " >
			<form:form modelAttribute="order" method="POST"
				action="${ pageContext.request.contextPath }/users/home/cart/order">
				<h4 align="center">Thanh toán</h4>
				<b>Số lượng sản phẩm: </b>${cart.getCount()}<br>
				<b>Tổng số tiền là: </b>${cart.getAmount()}<br>
				<b>Email: </b>${user.email }<br>
				<div class="form-group mt-3">
					<label for="phone">Phone</label>
					<form:input path="phone" name="phone" id="username"
						class="form-control" />
					<form:errors path="phone" element="span" cssClass="text-danger" />
				</div>
				<div class="form-group mt-3">
					<label for="address">Address</label>
					<form:input path="address" name="address" id="username"
						class="form-control" />
					<form:errors path="address" element="span" cssClass="text-danger" />
				</div>
				<div class="form-group mt-3">
					<button class="btn btn-primary">Thanh toán</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html> --%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
  
  <div class="site-wrap">
    <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="" class="site-block-top-search">
                <span class="icon icon-search2"></span>
                <input type="text" class="form-control border-0" placeholder="Search">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="${ pageContext.request.contextPath }/users/home/index" class="js-logo-clone">Shoppers</a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
                  <li><a href="${ pageContext.request.contextPath }/users/home/changePassword"><span class="icon icon-person"></span></a></li>
                  <li><a href="${ pageContext.request.contextPath }/users/home/productInvoice"><span class="icon icon-file-text"></span></a></li>
                  <li>
                    <a href="${ pageContext.request.contextPath }/users/home/cart/view" class="site-cart">
                      <span class="icon icon-shopping_cart"></span>
                      <span class="count">2</span>
                    </a>
                  </li>
                  <li><a href="${ pageContext.request.contextPath }/login"><span class="icon icon-sign-out"></span></a></li>
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li>
              <a href="${ pageContext.request.contextPath }/users/home/index">Home</a>

            </li>
            <li>
              <a href="${ pageContext.request.contextPath }/users/home/about">About</a>
            </li>
            <li><a href="${ pageContext.request.contextPath }/users/home">Shop</a></li>
            <li><a href="#">Catalogue</a></li>
            <li><a href="#">New Arrivals</a></li>
            <li><a href="${ pageContext.request.contextPath }/users/home/contact">Contact</a></li>
          </ul>
        </div>
      </nav>
    </header>

    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${ pageContext.request.contextPath }/users/home/index">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
        	  <form class="col-md-12" method="post">
	          
	            <div class="site-blocks-table">
	              <table class="table table-bordered">
	                <thead>
	                  <tr>
	                    <th class="product-thumbnail">Image</th>
	                    <th class="product-name">Product</th>
	                    <th class="product-price">Price</th>
	                    <th class="product-quantity">Quantity</th>
	                    <th class="product-total">Total</th>
	                    <th class="product-remove">Remove</th>
	                  </tr>
	                </thead>
	                <tbody>
	                <c:forEach var="item" items="${cart.items }">
	                	<form method="POST" action="${ pageContext.request.contextPath }/users/home/cart/update/${item.id}">
						<input type="hidden" name="id" value="${item.id }"/>
		                  <tr>
		                    <td class="product-thumbnail">
		                      <img src="${ pageContext.request.contextPath }/images/${item.image}" alt="Image" height="100px" width="50%">
		                    </td>
		                    <td class="product-name">
		                      <h2 class="h5 text-black">${item.name}</h2>
		                    </td>
		                    <td>${item.price} $</td>
		                    <td>
		                      <div class="input-group mb-3" style="max-width: 120px;">
		                        <%-- <div class="input-group-prepend">
		                          <button class="btn btn-outline-primary js-btn-minus" onclick="window.location.href='/users/home/cart/down/${item.id}/count/1'" type="button">&minus;</button>
		                        </div> --%>
		                        <input type="number" class="form-control text-center" name="quantity" min="1" value="${item.quantity}" onblur="this.form.submit()" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
		                        <%-- <div class="input-group-append">
		                          <button class="btn btn-outline-primary js-btn-plus" onclick="window.location.href='/users/home/cart/up/${item.id}/count/1'" type="button">&plus;</button>
		                        </div> --%>
		                      </div>
		
		                    </td>
		                    <td>${item.price * item.quantity} $</td>
		                    <td><a href="${ pageContext.request.contextPath }/users/home/cart/remove/${item.id}" class="btn btn-primary btn-sm">X</a></td>
		                  </tr>
	                  </form>
	                  </c:forEach>
	                </tbody>
	              </table>
	            </div>
	          </form>
          
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <button class="btn btn-primary btn-sm btn-block">Update Cart</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-sm btn-block"><a href="${ pageContext.request.contextPath }/users/home">Continue Shopping</a></button>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupon</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-sm">Apply Coupon</button>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Total quantity</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">${cart.getCount()}</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">${cart.getAmount()} $</strong>
                  </div>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-lg py-3 btn-block"><a href="${ pageContext.request.contextPath }/users/home/cart/checkout">Proceed To Checkout</a></button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-md-12">
                <h3 class="footer-heading mb-4">Navigations</h3>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="#">Sell online</a></li>
                  <li><a href="#">Features</a></li>
                  <li><a href="#">Shopping cart</a></li>
                  <li><a href="#">Store builder</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="#">Mobile commerce</a></li>
                  <li><a href="#">Dropshipping</a></li>
                  <li><a href="#">Website development</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="#">Point of sale</a></li>
                  <li><a href="#">Hardware</a></li>
                  <li><a href="#">Software</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
            <h3 class="footer-heading mb-4">Promo</h3>
            <a href="#" class="block-6">
              <img src="${ pageContext.request.contextPath }/images/hero_1.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
              <h3 class="font-weight-light  mb-0">Finding Your Perfect Shoes</h3>
              <p>Promo from  nuary 15 &mdash; 25, 2019</p>
            </a>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">203 Fake St. Mountain View, San Francisco, California, USA</li>
                <li class="phone"><a href="tel://23923929210">+2 392 3929 210</a></li>
                <li class="email">emailaddress@domain.com</li>
              </ul>
            </div>

            <div class="block-7">
              <form action="#" method="post">
                <label for="email_subscribe" class="footer-heading">Subscribe</label>
                <div class="form-group">
                  <input type="text" class="form-control py-4" id="email_subscribe" placeholder="Email">
                  <input type="submit" class="btn btn-sm btn-primary" value="Send">
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" class="text-primary">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
  </div>

  <script src="${ pageContext.request.contextPath }/js2/jquery-3.3.1.min.js"></script>
  <script src="${ pageContext.request.contextPath }/js2/jquery-ui.js"></script>
  <script src="${ pageContext.request.contextPath }/js2/popper.min.js"></script>
  <script src="${ pageContext.request.contextPath }/js2/bootstrap.min.js"></script>
  <script src="${ pageContext.request.contextPath }/js2/owl.carousel.min.js"></script>
  <script src="${ pageContext.request.contextPath }/js2/jquery.magnific-popup.min.js"></script>
  <script src="${ pageContext.request.contextPath }/js2/aos.js"></script>

  <script src="${ pageContext.request.contextPath }/js2/main.js"></script>
    
  </body>
</html>