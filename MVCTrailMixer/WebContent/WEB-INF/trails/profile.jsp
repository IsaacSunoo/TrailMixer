<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Hikes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.do">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="ListOfTrails.do">Trails</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Matches</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.do">Log Out</a>
      </li>
    </ul>
  </div>
</nav>

	<!--  model object = profile -->
	<!--  view object = Profile-->

	<ul>
		<li><input name="name" value="${name}"></li>
		<li><input name="age" value="${age}"></li>
		<li><input name="location" value="${address}"></li>
		<li><input name="gender" value="${gender}"></li>
		<li><input name="preferences" value="${preferences}"></li>
		<li><input name="bio" value="${bio}"></li>
	</ul>
	
	<!--  profile pictures would be to the right of this in our html -->

	<form action="TrailMatches.do" method="GET">
		<input type="hidden" name="id" value="${profile.id}"> 
		<input type="submit" value="Trail Matches">
	</form>
	
	<form action="EditProfile.do" method="GET">
		<input type="hidden" name="id" value="${profile.id}"> 
		<input type="submit" value="Edit Profile">
	</form>

	<form action="DeleteProfile.do" method="GET">
		<input type="hidden" name="id" value="${profile.id}"> 
		<input type="submit" value="Delete Profile">
	</form>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html> 	