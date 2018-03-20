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
<!-- 		<div id="qbo">test</div> -->
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

/* 		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "https://sandbox-quickbooks.api.intuit.com/v3/company/193514610014224/customer/2",
			dataType: 'json',
			headers: {
					'Access-Control-Allow-Origin': 'http://localhost:8080'
				},
			beforeSend: function(xhr) {
					xhr.setRequestHeader("Authorization", "Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..AZ8r98PiFN6e-c2y28npug.9YV6Pw9ctpzq8TaUc25DiF_IE2_wCKSkpfeHREvyRwGaQDNTfnYFqiTWnnb792nCmAJDTXdxu8BCIp1vo2gEW8wJXEy-njZy4hgS21vfbpScnHY4YfGAnythevqUDJLdSxDWjlcJozRcYxzVdmBvXgmb1WUt4Pn8SL6V4WOpmbIq4f2zzgPLscJjbuVfCcHfieZfx0aXtiaP-dhgqGwHUBDkOXMT1QK-VDM8vVN-C9_1hAL7pPzX9MWIBqGRCsS-U3gs8XfLllXlbfKyly8WCbTMxGCJMRj-VYxllUsviHHdQEFmA6GkA5jRhZgkJdGRJ2793N1pQHEZ9mcRQbXFraGMpByC6U4XkqBJmEvnbuIN-j6paLEYJzrb1LC9TCD8R2GsOVvYRUzb0vQGP2cvGMhzbWRz-h_tEqwNV6QzA2-hLPzxhs5jntGtHbXTPuBcypGgCtZNHiymLkEArOf-5Qz5VC9mADTgEIMJyq2E0ZjiUJgSZBkK9ODl1AYKbS0SAAKqpB0N-xLJ_rVOkgb3XU1szLGls-yB6WtXJoNoCj0novabmUg_D_03Z3mHrC9CX2MPW_nd-KaQcpNH2pjLY95nLDKgUZmYdILGka5RpkdlleYrX_-UBebX5v6Cw9fhWC9RdGNzuj80eXmDkbhyzmkdvjbH4g0HSF4hQKPhlL3oy_zDFtknO72-BZAnZKh6dYRWGsG65kUgum4Xl28lVhodHrEePGyGNk_WPzNJsl8Zu_LYYolaZcPZaYkeCtDlHI1sMJcXHiA-eabbmqGS11rNZsRvIuDi4AMIjLDP_PmJEMdUEAef0LcCvZnZFeqH.rvdwceM-dAlf80DTB1lLIQ")
				},
			timeout: 100000,
			success: function(data) {
					$("#qbo").innerHTML = data.FamilyName;
				},
			error: function(e) {
					
				}
		}); */

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

	function editIncident() {
		var incdt = {};
		incdt.id = $("#invoiceNo").val();
		incdt.customer = $("#customerName").val();
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
			
			//information for card header
			var cardHeader = document.createElement("div");
			cardHeader.className = "card-header";
			var invoice = document.createElement("div");
			invoice.innerHTML = data[i].id;
			invoice.id = "txtId";
			var edit = document.createElement("button");
			edit.className = "btn btn-primary";
			edit.id = "btnEdit" + data[i].id;
			edit.innerHTML = "Edit";
			var headerRow = document.createElement("div");
			headerRow.className = "row";
			var headerCol = document.createElement("div");
			headerCol.className = "col-10";
			var headerColBtn = document.createElement("div");
			headerColBtn.className = "col-2";
			headerCol.appendChild(invoice);
			headerColBtn.appendChild(edit);
			headerRow.appendChild(headerCol);
			headerRow.appendChild(headerColBtn);
			cardHeader.appendChild(headerRow);

			//information for card body
			var cardBody = document.createElement("div");
			cardBody.className = "card-body";
			var customer = document.createElement("div");
			customer.id = "txtCustomer";
			customer.innerHTML = data[i].customer;
			var status = document.createElement("div");
			status.innerHTML = data[i].status;
			status.id = "txtStatus";
			var complaint = document.createElement("div");
			complaint.innerHTML = data[i].complaint;
			complaint.id = "txtComplaint";
			var start = document.createElement("div");
			start.innerHTML = new Date(data[i].start).toLocaleDateString('en-US');
			start.id = "txtStart";
			
			cardBody.appendChild(customer);
			cardBody.appendChild(start);
			cardBody.appendChild(status);
			cardBody.appendChild(complaint);

			
			card.appendChild(cardHeader);
			card.appendChild(cardBody);
			col.appendChild(card);
			row.appendChild(col);
			resultList.appendChild(row);

			$("#btnEdit" + data[i].id).click({id: data[i].id}, editIncident);
		}
		
		$('#divError').hide();
		$('#searchResults').show();
	}

	function editIncident(event) {
		window.location.href = "/repairity/incident/edit?id=" + event.data.id;
	}
</script>
</body>
</html>