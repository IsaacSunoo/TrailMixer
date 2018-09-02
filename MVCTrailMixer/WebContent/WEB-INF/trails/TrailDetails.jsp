<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trail Details</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
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
	
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
