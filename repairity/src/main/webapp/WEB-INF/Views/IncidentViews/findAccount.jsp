<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Repairity - Incidents</title>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/Views/header.jsp"%>
		<div class="jumbotron jumbotron-fluid">
				<h1 class="display-4">Incidents</h1>
		</div>
		<br />
		<div class="row">
			<div class="col-8">
				<form:form cssClass="form-horizontal" role="form" id="incidentForm" action="/repairity/incident/new">
					<div class="form-group row">
					<div class="col-2">Status:</div>
					<div class="col-8">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="ckOpen" value="ckOpen">
						<label class="form-check-label" for="ckOpen">Open</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="ckClosed" value="ckClosed">
						<label class="form-check-label" for="ckClosed">Closed</label>
					</div>
					</div>
					</div>
					<div class="form-group row">
						<Label for="invoiceNo" class="col-2 col-form-label">Invoice
							No:</Label>
						<div class="col-8">
							<input type="text" class="form-control"
								placeholder="Enter Invoice No" name="invoiceNo" id="invoiceNo" onkeyup="listViaAjax()" />
						</div>
						<div class="col-2">
							<button type="submit" id="btn-search" class="btn btn-primary">
								New Incident</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		<div class="card" id="searchResults">
			<div class="container">
				<h2 class="lead">Search Results</h2>
			</div>
		</div>
		<br />
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
		
		<div id="resultList">
		</div>

		<div class="row" id="divError">
			<div class="col-8">
				<p class="alert alert-danger">Request Incident Details Not Found</p>
			</div>
		</div>
		<%@ include file="/WEB-INF/Views/footer.jsp"%>
	</div>

	<script>
	$(document).ready(function() {
		$('#divResults').hide();
		$('#divError').hide();
		$('#searchResults').hide();
 
/*  		$("#incidentForm").submit(function(event) {
			event.preventDefault();
			searchViaAjax();
		});  */

		listViaAjax();

	});

	function enableSearchButton(flag) {
		$("#btn-search").prop("disabled", flag);
	}

	function searchViaAjax() {
		console.log("search AJAX method");
		var incdt = {}
		incdt.id = $("#invoiceNo").val();
		console.log("invoiceno: " + incdt.id);
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/incidentREST/search",
			data: incdt,
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

	function listViaAjax() {
		var incdt = {};
		incdt.id = $("#invoiceNo").val();
		console.log("invoiceno: " + incdt.id);
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/incidentREST/list",
			data: incdt,
			dataType: 'json',
			timeout: 100000,
			success: function(data) {
					displayList(data);
				},
			error: function(e) {
				$('#divResults').hide();
				$('#divError').show();
				}
		})
	}

	function display(data) {
		$('#invoiceNoResponse').html("Invoice No: " + data.id);
		$('#status').html("Status: " + data.status);
		$('#customerName').html("Customer: " + data.customer);
		$('#complaint').html("Incident: " + data.complaint);
		$('#divError').hide();
		$('#divResults').show();
	}

	function displayList(data) {
		var resultList = document.getElementById("resultList");
		resultList.innerHTML = "";
		for(var i = 0; i < data.length; i++) {
			var row = document.createElement("div");
			row.className = "row";
			var col = document.createElement("div");
			col.className = "col-8";
			var card = document.createElement("div");
			card.className = "card";
			var cardHeader = document.createElement("div");
			cardHeader.className = "card-header";
			var cardBody = document.createElement("div");
			cardBody.className = "card-body";
			var invoice = document.createElement("div");
			invoice.innerHTML = data[i].id;
			var customer = document.createElement("div");
			customer.innerHTML = data[i].customer;
			var status = document.createElement("div");
			status.innerHTML = data[i].status;
			var complaint = document.createElement("div");
			complaint.innerHTML = data[i].complaint;
			var start = document.createElement("div");
			start.innerHTML = new Date(data[i].start).toLocaleDateString('en-US');
			
			cardBody.appendChild(customer);
			cardBody.appendChild(start);
			cardBody.appendChild(status);
			cardBody.appendChild(complaint);
			cardHeader.appendChild(invoice);
			card.appendChild(cardHeader);
			card.appendChild(cardBody);
			col.appendChild(card);
			row.appendChild(col);
			resultList.appendChild(row);
		}
		
		$('#divError').hide();
		$('#searchResults').show();
	}
</script>
</body>
</html>