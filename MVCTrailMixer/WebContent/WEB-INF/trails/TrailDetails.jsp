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
			<th>Difficulty</th>
			<th>Distance</th>
			<th>Altitude</th>
		</tr>
		<tr>
			<td>${trail.name}</td>
			<td>${trail.difficulty.name}</td>
			<td>${trail.distance} mi</td>
			<td>${trail.altitude} ft</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<th>Description</th>
		</tr>
		<tr>
			<td>${trail.description}</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<th>Location</th>
		</tr>
		<tr>
			<td>${trail.address.street}</td>
			<td>${trail.address.city}</td>
			<td>${trail.address.state}</td>
		</tr>
	</table>
	
	
</body>
</html>
