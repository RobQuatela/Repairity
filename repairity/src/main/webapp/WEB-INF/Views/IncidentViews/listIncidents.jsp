<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="100%">
		<thead>
			<tr>
				<th>Invoice No</th>
				<th>Status</th>
				<th> &nbsp; </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="incident" items="${incidents }">
				<c:url var="updateLink" value="/edit">
					<c:param name="invoiceNo" value="${incident.id }" />
				</c:url>
				<tr>
					<td>${incident.id }</td>
					<td>${incident.status }</td>
					<td><a href="${updateLink }">Edit</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>