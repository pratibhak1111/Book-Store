<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<%@page import="org.springframework.web.util.UrlPathHelper" errorPage="error.jsp"%>
<html>
    <head>
        <title>Admin Dashboard</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
        <!-- Custom fonts for this template-->
        <link href="/css/all.css" rel="stylesheet" type="text/css">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="icon" href="/images/logo.png"/>
        <script src="/js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="/js/bootstrap.js" type="text/javascript"></script>
        <script src="/js/datatables.js" type="text/javascript"></script>       
        <style>
            .list-group-item{
                padding:8px;
            }            
        </style>
    </head>
    <body>
    <% String url= new UrlPathHelper().getOriginatingRequestUri(request); %>
    <c:set var="url" value="<%= url %>" scope="page"></c:set>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-2 p-0" style="min-height: 100vh;">
                <img src="/images/logo.jpg" class="img-fluid img-thumbnail">
               	<h5 class="pt-2 text-center">Hi! ${sessionScope.uname }</h5>
               	<h6 class="pb-1 text-center">(${sessionScope.role })</h6>
                <div class="list-group">
                	<c:if test="${sessionScope.role =='Admin' }">
                    <a href="/dashboard" class="list-group-item list-group-item-action <%= url.equals("/dashboard") ? "active" : "" %>">Dashboard</a> 
                    <a href="/categories" class="list-group-item list-group-item-action <%= url.equals("/categories") ? "active" : "" %>">Categories</a>
                    <a href="/products" class="list-group-item list-group-item-action <%= url.equals("/products") ? "active" : "" %>">Books</a>
                    <a href="/orders" class="list-group-item list-group-item-action <%= url.equals("/orders") ? "active" : "" %>">Orders</a> 
                    <a href="/customers" class="list-group-item list-group-item-action <%= url.equals("/customers") ? "active" : "" %>">Customers</a>
                   </c:if>
                    <a href="/changepwd" class="list-group-item list-group-item-action <%= url.equals("/achangepwd") ? "active" : "" %>">Change Password</a> 
                    <a href="/logout" class="list-group-item list-group-item-action">Logout</a> 
                </div>
            </div>
            <div class="col-sm-10 p-0">
                <div class="container-fluid" style="min-height: 99vh;">
                    <div class="card shadow" style="min-height: 99vh;">
                        <div class="card-body">
                        