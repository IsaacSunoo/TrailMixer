<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <a class="nav-link" href="#">Login</a>
      </li>
    </ul>
  </div>
</nav>

<h2>Hike</h2>

<p>Need someone to go hiking with? With our Find A Hike feature, you can search through groups 
to find the people you'd like to go hiking with. You can also see which trail they are going on 
so that you pick the perfect hike for you!</p>

<form action="FindHike.do" method="GET">
	<input type="submit" value="Find a Hike">
</form>

<p>Can't find a hike you like? Create A Hike allows you to make your own hike, including everything 
from the people you go with to the trail you select. </p>

<form action="CreateHike.do" method="GET">
	<input type="submit" value="Create a Hike">
</form>

<p>Can't remember that one trail you went on a few weeks ago? Select Your Hikes to see the trails
you've previously conquered as well as the people you went with.</p>

<form action="ViewHikes.do" method="GET">
	<input type="submit" value="Your Hikes">
</form>

</body>
</html>