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

	<form action="ListOfTrailsSorted.do" method="GET">
		Sort By: <select name="sortBy">
			<option value="none">---</option>
			<option value="difficultyHard">Difficulty (Hardest to
				Easiest)</option>
			<option value="difficultyEasy">Difficulty (Easiest to
				Hardest)</option>
			<option value="distanceFar">Distance (Farthest to Shortest)</option>
			<option value="distanceShort">Distance (Shortest to
				Farthest)</option>
			<option value="altitudeHigh">Altitude (Highest to Lowest)</option>
			<option value="altitudeLow">Altitude (Lowest to Highest)</option>
			<option value="rating">Rating</option>
		</select> <input type="submit" value="submit" />
	</form>

	<form action="ListOfTrailsSearched.do" method="GET">
		Search By: <select name="searchBy">
			<option value="none">---</option>
			<option value="difficulty">Difficulty (1-5)</option>
			<option value="distance">Distance</option>
			<option value="altitude">Altitude</option>
			<option value="rating">Rating</option>
		</select> <input type="text" name="search"> <input type="submit"
			value="submit" />
	</form>

	<form action="KeywordSearch.do" method="GET">
		Search By Keyword: <input type="text" name="keyword"> <input
			type="submit" value="submit" />
	</form>

	<fieldset style="box-shadow: 5px 5px 10px gray; display: inline-block">
		<legend> Trails </legend>
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
					<td>${t.difficulty.name}</td>
					<td>${t.distance} mi</td>
					<td>${t.altitude} ft</td>
					<td>
						<form action="TrailDetails.do" method="GET">
							<input type="hidden" name="id" value="${t.id}"> <input
								type="submit" value="Trail Details">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</fieldset>
</body>
</html>