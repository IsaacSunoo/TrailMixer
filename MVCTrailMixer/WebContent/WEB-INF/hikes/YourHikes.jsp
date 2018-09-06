<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Hikes</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Hikes</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="index.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="ListOfTrails.do">Trails</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="TrailMatches.do">Matches</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="login.do">Login</a>
				</li>
			</ul>
		</div>
	</nav>

	<h2>Your Hikes</h2>
	
	<c:if test="${trails == null}">
		No hikes available
	</c:if>
	
	<c:if test="${trails != null}">
		<p>Trail added!</p><br> 
		<h4>Your trails:</h4>
		
	<table>
	<c:forEach var="t" items="${trails}">
		<tr>
  			<td>${t.name}</td>
  		</tr>
	</c:forEach>
	</table>
	
	</c:if>
	
	
	<!--  List all trails -->
	
	<%-- <table>
	<c:forEach var="t" items="${trails}">
		<tr>
  			<td>${t.name}</td>
  		</tr>
  		<tr>
  			<td>Difficulty: </td>
  			<td>${t.difficulty.name}</td>
		</tr>
  		<tr>
  			<td>Distance: </td>
  			<td>${t.distance}</td>
		</tr>
  		<tr>
  			<td>Area: </td>
  			<td>${t.address.city}</td>
		</tr>
  		<tr>
  			<td>Altitude: </td>
  			<td>${t.altitude}</td>
		</tr>
  		<tr>
  			<td>Description: </td>
  			<td>${t.description}</td>
		</tr>
	</c:forEach>
	</table> --%>




</body>
</html>