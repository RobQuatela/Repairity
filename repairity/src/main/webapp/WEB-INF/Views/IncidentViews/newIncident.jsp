<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Incident</title>
</head>
<body>
	<h2>Create new incident</h2>
	<form name="incidentForm" action="addIncident" method="post">
		<table>
			<tr>
				<td>Invoice #: </td>
				<td><input type="text" name="txtInvoice" /></td>
			</tr>
			<tr>
				<td>Status: </td>
				<td><input type="text" name="txtStatus" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="Create Incident" name="btnSubmit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>