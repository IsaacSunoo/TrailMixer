<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trail Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	<link rel="stylesheet" href="styles.css">
</head>
<body>

	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
		<div
			class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="index.do">Home</a>
				</li>
				<li class="nav-item">
                	<a class="nav-link" href="profile.do">Profile</a>
            	</li>
				<li class="nav-item active"><a class="nav-link"
					href="ListOfTrails.do">Trails</a></li>
				<li class="nav-item">
        		<a class="nav-link" href="TrailMatches.do?profileId=${profile.id }">Matches</a>
      		</li>
			</ul>
		</div>
		<div class="mx-auto order-0">
			<a class="navbar-brand mx-auto" href="#">Trail Details</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target=".dual-collapse2">
				<span class="navbar-toggler-icon"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
			<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="addHike.do?trailId=${trail.id }">Completed Hike</a></li>
				<li class="nav-item"><a class="nav-link" id="prev" href="navPrevTrail.do?trailId=${trail.id }">Previous</a></li>
				<li class="nav-item"><a class="nav-link" id="next" href="navNextTrail.do?trailId=${trail.id }">Next</a></li>
				<li class="nav-item"><a class="nav-link" href="login.do">Login</a>
				</li>
			</ul>
		</div>
	</nav>
	<br>
	<div class="text-center">
		<h2>${trail.name}</h2>
	</div>
	
<div class="trailImage" >
<img src="${trail.image}" style="width:500px;height500px;"></img>
</div>

<br>

	<table class="trailsTable">
		<tr>
			<th>Difficulty</th>
			<th>Distance</th>
			<th>Altitude</th>
			<th>Rating</th>
		</tr>
		<tr>
			<td>${trail.difficulty.name}</td>
			<td>${trail.distance}mi</td>
			<td>${trail.altitude}ft</td>
			<td>${rating}</td>
		</tr>
	</table>

<br>

	<table>
		<tr>
			<th>Description</th>
		</tr>
		<tr>
			<td>${trail.description}</td>
		</tr>
	</table>

	
<%-- 			<table>
				<tr>
					<th>Location</th>
				</tr>
				<tr>
					<td>${trail.address.street}</td>
				</tr>
				<tr>
					<td>${trail.address.city}</td>
				</tr>
				<tr>
					<td>${trail.address.state}</td>
				</tr>
			
		<c:choose>
			<c:when test="${not empty trail.address.latitude}">
					<tr>
						<td>Latitude: ${trail.address.latitude}</td>
					</tr>
					<tr>
						<td>Longitude: ${trail.address.longitude}</td>
					</tr>
			</c:when>
		</c:choose>
				</table>	 --%>
	



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>
