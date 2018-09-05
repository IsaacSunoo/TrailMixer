<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create A Hike</title>
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
        <a class="nav-link" href="TrailMatches.do?profileId=${profile.id }">Matches</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="login.do">Login</a>
      </li>
    </ul>
  </div>
</nav>

<h2>Create A Hike</h2>

	<form action="" method="POST">
		<h4>Trail</h4>
		<table>
			<tr>
				<td><label for="trail">Trail:</label></td>
				<td><input type="text" name="trail" /></td>
			</tr>
			<tr>
				<td><label for="description">Description:</label></td>
				<td><input type="text" name="description" /></td>
			</tr>
			<tr>
				<td><label for="distance">Distance (mi):</label></td>
				<td><input type="text" name="distance" /></td>
			</tr>
			<tr>
				<td><label for="altitude">Altitude (ft):</label></td>
				<td><input type="text" name="altitude" /></td>
			</tr>
			<tr>
				<td><label for="difficulty">Difficulty (1 - 5):</label></td>
				<td><input type="text" name="difficulty" /></td>
			</tr>
		</table>
		
		<h4>Location</h4>	
		<table>
			<tr>
				<td><label for="street">Street:</label></td>
				<td><input type="text" name="street" /></td>
			</tr>
			<tr>
				<td><label for="street2">Street 2:</label></td>
				<td><input type="text" name="street2" /></td>
			</tr>
			<tr>
				<td><label for="city">City:</label></td>
				<td><input type="text" name="city" /></td>
			</tr>
			<tr>
				<td><label for="state">State:</label></td>
				<td><input type="text" name="state" /></td>
			</tr>
		</table>
		<input type="submit" value="Submit">
	</form>

</body>
</html>