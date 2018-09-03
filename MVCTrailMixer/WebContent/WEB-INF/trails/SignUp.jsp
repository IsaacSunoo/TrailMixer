<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
<form:form action="addUser.do" method="POST" modelAttribute="user">
	<form:label path="email">Email:</form:label>
	<form:input path="email" />
	<br />
	<form:label path="password">Password:</form:label>
	<form:input path="password" />
	<br />
	<form:label path="firstName">First Name:</form:label>
	<form:input path="firstName" />
	<br />
	<form:label path="lastName">Last Name:</form:label>
	<form:input path="password" />
	<br />
	<form:label path="age">Age:</form:label>
	<form:input path="age" />
	<br />
	<form:label path="gender">Gender:</form:label>
	<form:input path="gender" />
	<br />
	<form:label path="street">Street:</form:label>
	<form:input path="street" />
	<br />
	<form:label path="city">City:</form:label>
	<form:input path="city" />
	<br />
	<form:label path="state">State:</form:label>
	<form:input path="state" />
	<br />
	<input type="submit" value="Add New User" />
	</form:form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>