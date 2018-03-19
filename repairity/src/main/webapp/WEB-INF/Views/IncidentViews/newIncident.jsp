<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Incident</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		console.log("setting up functions...");
		$("#msgSuccess").hide();
		$("#msgFail").hide();
		$("#incidentForm").submit(function(event) {
			event.preventDefault();
			submitAJAX();
		});
	});

	function submitAJAX() {
		var incdt = {};
		incdt.id = $("#txtInvoice").val();
		incdt.status = $("#txtStatus").val();
		incdt.start = $("#txtDate").val();
		incdt.customer = $("#txtCustomer").val();

		$.ajax( {
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/incidentREST/save",
			data: JSON.stringify(incdt),
			dataType: 'json',
			timeout: 100000,
			success: function(data) {
				$("#msgSuccess").show();
				$("#msgFail").hide();
			},
			error: function(e) {
				$("#msgSuccess").hide();
				$("#msgFail").append(e);
				$("#msgFail").show();
			}
		});
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h2>Create new incident</h2>
	<form name="incidentForm" id="incidentForm">
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Invoice
					No</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" id="txtInvoice">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Date</span>
			</div>
			<input type="date" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" id="txtDate">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Status</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" id="txtStatus">
		</div>
		<div class="input-group mb-3">
			<div class="input-group-prepend">
				<span class="input-group-text" id="inputGroup-sizing-default">Customer</span>
			</div>
			<input type="text" class="form-control" aria-label="Default"
				aria-describedby="inputGroup-sizing-default" id="txtCustomer">
		</div>
		<div class="row">
			<div class="col-12">
			<button type="submit" id="btnAddIncident" class="btn btn-primary">Add Incident</button>
			</div>
		</div>
		
		<div class="row" id="msgSuccess">
			<div class="col-8">
				<p class="alert">Insert succeeded!!</p>
			</div>
		</div>
		
		<div class="row" id="msgFail">
			<div class="col-8">
				<p class="alert alert-danger">Insert did not succeed for reason: </p>
			</div>
		</div>
		<!-- <div class="row">
			<div class="col-4">
				<bold>Invoice No:</bold>
			</div>
			<div class="col-8">
				<input type="text" id="txtInvoice" />
			</div>
		</div>
		<div class="row">
			<div class="col-4">
				<bold>Status:</bold>
			</div>
			<div class="col-8">
				<input type="text" id="txtStatus" />
			</div>
		</div>
		<tr>
			<td>Invoice #:</td>
			<td><input type="text" name="txtInvoice" /></td>
		</tr>
		<tr>
			<td>Status:</td>
			<td><input type="text" name="txtStatus" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
				value="Create Incident" name="btnSubmit" /></td>
		</tr>
		</table> -->
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>
