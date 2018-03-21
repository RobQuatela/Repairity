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
		$("#msgSuccess").hide();
		$("#msgFail").hide();
		$("#incidentForm").submit(function(event) {
			event.preventDefault();
			submitAJAX();
		});

		$("#btnExit").click(function(event) {
			event.preventDefault();
			$("body").fadeOut(300, newPage);
		});
	});

	function newPage() {
		window.location.href = "/repairity/incident/find";
	}

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
				$("body").fadeOut(600, newPage);
			},
 			error: function(xhr, status, error) {
				$("#msgSuccess").hide();
				console.log(xhr.responseText);
				$("#msgFail").append(error);
				$("#msgFail").show();
			} 
		});
	}
</script>
</head>
<body id="body">
	<%@ include file="/WEB-INF/Views/header.jsp"%>
	<div class="row">
	<div class="col-10">
	<div class="jumbotron jumbotron-fluid">
		<h2 class="display-1">Create new incident</h2>
	</div>
	</div>
	<div class="col-2">
		<button class="btn btn-primary" id="btnExit">Cancel</button>
	</div>
	</div>
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
				<span class="input-group-text" id="inputGroup-sizing-default">Start &nbsp;</span>
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
	</form>
	<%@ include file="/WEB-INF/Views/footer.jsp"%>
</body>
</html>
