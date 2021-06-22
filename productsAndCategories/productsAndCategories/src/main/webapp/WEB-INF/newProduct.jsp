<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    .container {
		margin: 200px;
        
	}
	.box {
		display: flex;
		justify-content: space-between;
		width: 500px;
	}
	a {
		margin-left: 200px;
	}
</style>
</head>
<body>
    <div class="container">
	    <h1>${product.name}</h1><br>
        <div class="box">
            <div class="left">
                <h3>Categories:</h3>
                <ul>
                	<c:forEach items="${product.categories}" var="category">
                		<li>${category.name}</li>
                	</c:forEach>
                </ul>
            </div>
            <div class="right">
                <p>Add Category:</p>
                <form action="/addCategory/${product.id}" method="post">
                    <select name="selected_category">
                        <c:forEach items="${ allCategories }" var="category">
                            <option value="${category.id}">${category.name}</option>
                        </c:forEach>
                    </select>
                    <input type="submit" value="add">
                </form>
            </div>
        </div>
    </div>
    <hr>
        <a href="/products/new">Create Product</a>
        <a href="/categories/new">Create Categories</a>
</body>
</html>