<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trail Details</title>
</head>
<h2>Trail Details</h2>
<body>

	<!--  list will need to be called trails -->
	<!--  mv object = trails -->
	<!--  mv view = TrailDetails -->
	<!--  make sure Java names in Trails.java correlate to names here -->

	<table>
		<tr>
			<th>Trail</th>
			<th>Description</th>
			<th>Location</th>

		</tr>
	</table>

	<c:forEach var="t" items="${trails}">
		<table>
			<tr>
				<input type=hidden name="id" value="${t.id}">
				<td>${t.name}</td>
				<td>${t.description}</td>
				<td>${t.address}</td>
			</tr>
		</table>
	</c:forEach>

</body>
</html>