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

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.do">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.do">Profile</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="ListOfTrails.do">Trails</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="matches.do">Matches</a>
            </li>
        </ul>
    </div>
    <div class="mx-auto order-0">
        <a class="navbar-brand mx-auto" href="#">Trail Mixer</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="login.do">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="logout.do">Logout</a>
            </li>
        </ul>
    </div>
</nav>

<h2>Hike</h2>

Need someone to go hiking with? With our Find A Hike feature, you can search through groups 
to find the people you'd like to go hiking with. You can also see which trail they are going on 
so that you pick the perfect hike for you!	

<form action="FindHike.do" method="GET">
	<button type="submit" class="btn btn-dark">Find a Hike</button>
</form>

<br>
Can't find a hike you like? Create A Hike allows you to make your own hike, including everything 
from the people you go with to the trail you select.

<form action="CreateHike.do" method="GET">
	<button type="submit" class="btn btn-dark">Create a Hike</button>
</form>

<br>
Can't remember that one trail you went on a few weeks ago? Select Your Hikes to see the trails
you've previously conquered as well as the people you went with.

<form action="ViewHikes.do" method="GET">
	<button type="submit" class="btn btn-dark">Your Hikes</button>
</form>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>