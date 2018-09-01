<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trail Details</title>
</head>
<h2>Trail Details</h2>
<body>

	<table>
		<tr>
			<th>Trail</th>
			<th>Description</th>
			<th>Location</th>
		</tr>
		<tr>
			<td>${trail.name}</td>
			<td>${trail.description}</td>
			<td>${trail.address}</td>
		</tr>
	</table>
</body>
</html>
