<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<h5 class="p-2" style="border-bottom: 2px solid green;">Categories</h5>
<div class="row">
    <div class="col-sm-7">
    
        <table class="table table-bordered table-sm">
            <thead>
                <tr>
                    <th>Category Id</th>
                    <th>Category Name</th>
                    <th>Total Products</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cats }" var="cat">
                    <tr>
                        <td>${cat.catid}</td>
                        <td>${cat.catname}</td>
                        <td>${cat.totalProducts}</td>
                        <td><a href="/categories/${cat.catid}" class="btn btn-primary btn-sm">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-sm-5">
        <form method="POST">
        	<input type="hidden" name="vendorid" value="${sessionScope.userid }">
            <div class="form-group">
                <label>Category Id</label>
                <input type="text" readonly name="catid" value="${catid }" class="form-control">
            </div>
            <div class="form-group">
                <label>Category Name</label>
                <input type="text" name="catname" required value="${catname }" class="form-control">
            </div>
            <input type="submit" value="Save Category" class="btn btn-primary">
        </form>
        <jsp:include page="msg.jsp"></jsp:include>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>