<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<%@ include file="header.jsp" %>
	<div class="row">
		<div class="col-12">
			<p class="h1">Search Form</p>
		</div>
	</div>
	
	<div class="row">
		<form id="testForm">
			<p class="greeting-id">The ID is </p>
			<p class="greeting-content">The content is </p>
			<input type="submit" value="submit" />
		</form>
	</div>
	
	<div class="row">
		<div class="col-8">
			<form:form cssClass="form-horizontal" role="form" id="incidentForm">
				<div class="form-group row">
					<Label for="invoiceNo" class="col-2 col-form-label">Invoice No:</Label>
					<div class="col-8">
						<input type="text" class="form-control"
							placeholder="Enter Invoice No" name="invoiceNo"
							id="invoiceNo" />
					</div>
					<div class="col-2">
						<button type="submit" id="btn-search" class="btn btn-primary">
						Search</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
	
	<div class="row" id="divResults">
		<div class="col-8">
			<div class="card">
				<div class="card-header bg-success text-white">
					<h3>Search Results</h3>	
				</div>
				<div class="card-body">
					<div id="invoiceNoResponse"></div>
					<div id="status"></div>
					<div id="customerName"></div>
					<div id="complaint"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row" id="divError">
		<div class="col-8">
			<p class="alert alert-danger">Request Incident Details Not Found</p>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</div>

<script>
	$(document).ready(function() {
		console.log("its working at document.ready 1");
		$('#divResults').hide();
		$('#divError').hide();
 
 		$("#incidentForm").submit(function(event) {
			console.log("its working in submitting form");
			enableSearchButton(false);
			event.preventDefault();
			searchViaAjax();
		}); 

		$.ajax({
			type: "GET",
			url: "http://rest-service.guides.spring.io/greeting",
			success: function(data) {
				$('.greeting-id').append(data.id);
				$('.greeting-content').append(data.content);
			},
			error: function(e) {
				console.log(e);
			}
		});
	});

	function enableSearchButton(flag) {
		$("#btn-search").prop("disabled", flag);
	}

	function searchViaAjax() {
		console.log("search AJAX method");
		var incdt = {}
		incdt.id = $("#invoiceNo").val();
		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/incidentREST/search",
			data: JSON.stringify(incdt),
			dataType: 'json',
			timeout: 100000,
			success: function(data) {
						display(data);
					},
			error: function(e) {
						$('#divResults').hide();
						$('#divError').show();
					},
			done: function(e) {
						//enableSearchButton(true);
						console.log("done with ajax function");
					}
		});
	}

	function display(data) {
		$('#invoiceNoResponse').html("Invoice No: " + data.id);
		$('#status').html("Status: " + data.status);
		$('#customerName').html("Customer: " + data.customer);
		$('#complaint').html("Incident: " + data.complaint);
		$('#divError').hide();
		$('#divResults').show();
	}
</script>
</body>
</html>