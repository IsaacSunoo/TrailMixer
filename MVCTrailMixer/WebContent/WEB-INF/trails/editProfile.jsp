<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>
	<h2>Profile</h2>
	
	<form action="editProfile.do" method="POST">
		<table>
			<tr>
				<td><input type="hidden" name="id" value="${profile.id}" /></td>
			</tr>
			<tr>
				<td><form:label path="profile.firstName" for="firstName">First Name: </form:label></td>
				<td><form:input path="profile.firstName" type="text" name="firstName" value="${profile.firstName}" /></td>
			</tr>
			<tr>
				<td><form:label path="profile.lastName" for="lastName">Last Name: </form:label></td>
				<td><form:input path="profile.lastName" type="text" name="lastName" value="${profile.lastName}" /></td>
			</tr>
			<tr>
				<td><form:label path="profile.age" for="age">Age: </form:label></td>
				<td><form:input path="profile.age" type="text" name="age" value="${profile.age}" /></td>
			</tr>
			<tr>
				<td><form:label path="profile.image" for="image">Image URL: </form:label></td>
				<td><form:input path="profile.image" type="text" name="image" value="${profile.image}" /></td>
			</tr>
			<tr>
				<td><form:label path="profile.gender" for="gender">Gender: </form:label></td>
				<td><form:input path="profile.gender" type="text" name="gender" value="${profile.gender}" /></td>
			</tr>
			<tr>
				<td><form:label path="profile.bio" for="bio">Bio: </form:label></td>
				<td><form:input path="profile.bio" type="text" name="bio" value="${profile.bio}" /></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-dark">Done</button>
	</form>
	
	
	<h2>Preferences</h2>
  	<form action="editPreferences" method="POST">
		<table>
		<c:forEach var="preference" items="${preferenceList}">		
			<tr>
				<td><input type="hidden" name="id" value="${preference.id}" /></td>
			</tr>
			<tr>
				<td>Diffiuclty: <select name="difficulty">
					<option value="none">${preference.difficulty.name}</option>
					<option value="expert">Expert</option>
					<option value="hard">Hard</option>
					<option value="moderate">Moderate</option>
					<option value="easy">Easy</option>
					<option value="beginner">Beginner</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Distance: <select name="distance">
					<option value="none">${preference.distance}</option>
					<option value="twenty">Greater than 20 mi</option>
					<option value="ten">Between 10 and 20 mi</option>
					<option value="five">Between 5 and 10 mi</option>
					<option value="less">Less than 5 mi</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="area">Area: </label></td>
				<td><input type="text" name="area" value="${preference.area}" /></td>
			</tr>
			<tr>
				<td>Area: <select name="area">
					<option value="none">${preference.area}</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Altitude: <select name="altitude">
					<option value="none">${preference.altitude}</option>
					<option value="fifteen">Greater than 15,000 ft</option>
					<option value="fourteen">Between 14,000 and 15,000 ft</option>
					<option value="ten">Between 10,000 and 14,000 ft</option>
					<option value="five">Between 5,000 and 10,000 ft</option>
					<option value="less">Less than 5,000 ft</option>
					</select>
				</td>
			</tr>
		</c:forEach>
		</table>
		<button type="submit" class="btn btn-dark">Done</button>
	</form>  

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>