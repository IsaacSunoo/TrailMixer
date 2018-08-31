<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>

	<!--  need to add gender to DB and Profile entity-->
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
	
	<!--  profile pictures would be to the right of this in out html -->

	<form action="EditProfile.do" method="GET">
		<input type="hidden" name="id" value="${profile.id}"> 
		<input type="submit" value="Edit Profile">
	</form>

	<form action="DeleteProfile.do" method="GET">
		<input type="hidden" name="id" value="${profile.id}"> 
		<input type="submit" value="Delete Profile">
	</form>

</body>
</html> 	