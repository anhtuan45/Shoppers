<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="site-wrap">
    <header class="site-navbar" role="banner">
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li>
              <a href="${ pageContext.request.contextPath }/admin/users">Users</a>
            </li>
            <li><a href="${ pageContext.request.contextPath }/admin/categories">Categories</a></li>
            <li><a href="${ pageContext.request.contextPath }/admin/products">Product</a></li>
            <li><a href="${ pageContext.request.contextPath }/admin/users/productInvoice">Invoice Management</a></li>
            <%-- <li><a href="${ pageContext.request.contextPath }/admin/report/inventory-by-category">Report</a></li> --%>
            <li class="has-children">
                <a href="#">Account</a>
                <ul class="dropdown">
                  <li><a href="${ pageContext.request.contextPath }/admin/users/changePW">Password</a></li>
                  <li><a href="${ pageContext.request.contextPath }/login">Log out</a></li>
                </ul>
              </li>
          </ul>
        </div>
      </nav>
    </header>
  </div>

