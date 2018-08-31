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
	
	<!--  list will need to be called trails -->
	<!--  mv object = trails -->
	<!--  mv view = ListOfTrails -->

	<table>
		<tr>
			<th>Trail</th>
			<th>Difficulty</th>
			<th>Distance</th>
			<th>Altitude</th>
		</tr>
	</table>

	<c:forEach var="t" items="${trails}">
		<table>
			<tr>
				<input type=hidden name="id" value="${t.id}">
				<td>${t.name}</td>
				<td>${t.altitude}</td>
				<td>${t.difficulty}</td>
				<td>${t.distance}</td>
				<td>
					<form action="Details.do" method="GET">
						<input type="hidden" name="id" value="${t.id}"> 
						<input type="submit" value="Trail Details">
					</form>
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>