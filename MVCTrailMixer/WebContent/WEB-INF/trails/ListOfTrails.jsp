<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Of Trails</title>
</head>
<h2>Trails</h2>
<body>

	<select>
		<option value="sort">sort by: </option> 
		<form action="ListOfTrailsDifficulty.do" method="GET">
			<option value="difficulty">difficulty</option>
		</form>
		<form action="ListOfTrailsDistance.do" method="GET">
			<option value="distance">distance</option>
		</form>
		<form action="ListOfTrailsAltitude.do" method="GET">
			<option value="altitude">altitude</option>
		</form>
		<form action="ListOfTrailsRating.do" method="GET">
			<option value="rating">rating</option>
		</form>
	</select>

	<table>
		<tr>
			<th>Trail</th>
			<th>Difficulty</th>
			<th>Distance</th>
			<th>Altitude</th>
		</tr>

		<c:forEach var="t" items="${trails}">
			<tr>
				<td>${t.name}</td>
				<td>${t.difficulty}</td>
				<td>${t.distance}</td>
				<td>${t.altitude}</td>
				<td>
					<form action="TrailDetails.do" method="GET">
						<input type="hidden" name="id" value="${t.id}"> <input
							type="submit" value="Trail Details">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>