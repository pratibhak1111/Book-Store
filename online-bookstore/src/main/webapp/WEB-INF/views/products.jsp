<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<jsp:include page="header.jsp"></jsp:include>
<button type="button" class="btn btn-primary float-right btn-sm"
	data-toggle="modal" data-target="#addproduct">Add Book</button>
<h5 class="p-2" style="border-bottom: 2px solid purple;">Books</h5>
<jsp:include page="msg.jsp"></jsp:include>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-end">
    <c:forEach var="i" begin="1" end="${totalpages }">
    	<li class="page-item ${i == current ? 'active' : ''}"><a class="page-link" href="/products/${i }">${i }</a></li>
    </c:forEach>
  </ul>
</nav>

<table class="table table-bordered table-sm">
	<thead>
		<tr>
			<th>Book Name</th>
			<th>Author</th>
			<th>Price</th>
			<th>Category</th>
			<th>Action</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${prods }" var="p">
			<tr>
				<td><img src="${p.pic}" class="mr-2"
					style="width: 80px; height: 60px;">${p.pname}</td>
				<td>${p.author}</td>
				<td>&#8377; ${p.saleprice}</td>	
				<td>${p.category.catname}</td>
				<td><a onclick="return confirm('Are you sure to delete this product ?')" href="/delprod/${p.prodid}"
					class="btn btn-danger btn-sm">Delete</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="modal fade" id="addproduct" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">		
			<form method="POST" enctype="multipart/form-data" action="${sessionScope.role eq 'Admin' ? '/products' : '/vproducts' }">
				<input type="hidden" name="vendorid" value="${sessionScope.userid }">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Product Name</label> <input type="text" required name="pname"
									class="form-control form-control-sm">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label>Author</label> <input type="text" required name="author"
									class="form-control form-control-sm">
							</div>
						</div>
					</div>
					<div class="form-row">
						
						<div class="col-sm-6">
							<div class="form-group">
								<label>Category</label> <select name="catid" required
									class="form-control form-control-sm">
									<option value="">Select Category</option>
									<c:forEach items="${cats }" var="cat">
										<option value="${cat.catid}">${cat.catname}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
						<div class="form-group">
						<label>Product Photo</label> 
						<input type="file" required name="photo"
							accept=".jpg,.png" class="form-control-file">
						</div>
						</div>
					</div>
					<div class="form-row">
						<div class="col-sm-6">
							<div class="form-group">
								<label>Price</label> <input type="text" required name="saleprice"
									class="form-control form-control-sm">
							</div>
						</div>						
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary btn-sm">Save Product</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>