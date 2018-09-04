<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trail Mixer</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="styles.css">
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.do">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="ListOfTrails.do">Trails</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.do">Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="HikeHomepage.do">Go Hike</a>
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

<br>
<div class="text-center">
<h2> Welcome To Trail Mixer!</h2>
<br>

<div id="HikingImages" class="carousel slide carousel-fade" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" width="100%" src="http://coloradoadventureswithkids.com/wp-content/uploads/2017/08/vaca-29-of-37.jpg" alt="Hanging Lakes" height="525px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" width="100%" src="https://www.visitmontrose.com/ImageRepository/Document?documentID=898" alt="Second Slide" height="525px">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" width="100%" src="https://c1.staticflickr.com/4/3691/33177152415_94e7588b2c_b.jpg" alt="Third slide" height="525px">
    </div>
  </div>
  <a class="carousel-control-prev" href="#HikingImages" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#HikingImages" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<br>
<form action="HikeHomepage.do" method="GET">
	<button type="submit" class="btn btn-dark">Take A Hike!</button>
</form>
</div>


<!-- <button type="button" class="btn btn-dark">Dark</button> -->
<!-- 	<input type="submit" value="Take a Hike!"> -->


  
	
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>