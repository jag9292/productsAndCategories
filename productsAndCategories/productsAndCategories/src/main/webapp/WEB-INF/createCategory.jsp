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
		width: 500px;
        
	}
	.enter {
		margin-top: 20px;
	}
	a {
		margin-left: 200px;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>New Category</h1>
		<form:form action="/createCategory" method="post" modelAttribute="category">
			<div class="form-group">
				<form:label path="name" for="exampleFormControlInput1">Name:</form:label>
				<form:input path="name" type="text" class="form-control"/>
			</div>
			<input class="enter" type="submit" value="Create">
		</form:form>
	</div>
	<hr>
	<a href="/products/new">Create Product</a>
</body>
</html>