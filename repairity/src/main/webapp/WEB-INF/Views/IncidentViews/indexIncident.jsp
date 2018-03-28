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
		<div class="container">
			<h1 class="display-2">Incidents</h1>
		</div>
		<br />
		<div class="row">
			<div class="col-8">
				<form:form cssClass="form-horizontal" role="form" id="incidentForm"
					action="/repairity/incident/new">
					<div class="form-group row">
						<div class="col-2">Status:</div>
						<div class="col-8">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="ckOpen"
									value="ckOpen"> <label class="form-check-label"
									for="ckOpen">Open</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" id="ckClosed"
									value="ckClosed"> <label class="form-check-label"
									for="ckClosed">Closed</label>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<Label for="invoiceNo" class="col-2 col-form-label">Invoice
							No:</Label>
						<div class="col-8">
							<input type="text" class="form-control"
								placeholder="Enter Invoice No" name="invoiceNo" id="invoiceNo"
								onkeyup="listViaAjax()" />
						</div>
						<div class="col-2">
							<button type="submit" id="btn-search" class="btn btn-primary">
								New Incident</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
		<div class="card row" id="searchResults">
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
		<div class="row alert alert-success" id="successUpdate" role="alert">Incident
			Saved!</div>
		<div class="row" id="rowDisplayIncident">
			<div class="col-4" style="overflow-y: auto; height: 600px;">
				<div id="resultList"></div>
			</div>
			<div class="col-8">
				<div class="container">
					<div class="row" id="rowDisplayIncident1">
						<div class="col-6">
							<h1 class="display-4" id="editId"></h1>
						</div>
						<div class="col-3">
							<button class="btn btn-primary" type="submit"
								id="btnAssignEmployees">Assign Employees</button>
						</div>
						<div class="col-3">
							<form id="updateIncident">
								<button class="btn btn-primary">Update Incident</button>
							</form>
						</div>
					</div>
				</div>
				<br />
				<div class="row" id="rowDisplayIncident2">
					<div class="col-6">
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Customer:</span> <input
									type="text" id="editCustomer" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Start:</span> <input type="date"
									id="editStart" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">End:</span> <input type="date"
									id="editStop" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Complaint:</span>
								<textarea id="editComplaint" class="form-control"></textarea>
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Status:</span> <input type="text"
									id="editStatus" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Address:</span> <input
									type="text" id="editAddress" class="form-control" />
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">City:</span> <input type="text"
									id="editCity" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">State:</span> <input type="text"
									id="editState" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Zip Code:</span> <input
									type="text" id="editZip" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">Phone Number:</span> <input
									type="text" id="editPhone" class="form-control" />
							</div>
						</div>
						<div class="mb-2">
							<div class="input-group-prepend">
								<span class="input-group-text">$:</span> <input type="text"
									id="editAmount" class="form-control" />
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="rowDisplayIncidentEmp1">
					<div class="col-12">
						<div class="lead">Employees Assigned</div>
					</div>
				</div>
				<div class="row" id="rowDisplayIncidentEmp2">
					<div class="col-12">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Employee No.</th>
									<th scope="col">Name</th>
								</tr>
							</thead>
							<tbody id="empAssigned">
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="row" id="rowAssignEmployees">
			<div class="col-12">
				<div class="row">
					<div class="col-10">
						<h1 class="display-4" id="rowAssignEmployeesHeading"></h1>
					</div>
					<div class="col-2">
						<button class="btn btn-primary" id="btnCancelAssignment">Return to Incidents</button>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-12">
						<table class="table">
							<thead>
								<tr>
									<th>Employee No.</th>
									<th>Name</th>
								</tr>
							</thead>
							<tbody id="assignEmpTable">
							</tbody>
						</table>
					</div>
				</div>
				<br />
				<div class="row">
					<div class="col-12">
						<table class="table">
							<thead>
								<tr>
									<th>Employee No.</th>
									<th>Name</th>
								</tr>
							</thead>
							<tbody id="assignEmpAllTable">
							</tbody>
						</table>
					</div>
				</div>
			</div>
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
			$("#successUpdate").hide();
			$("#updateIncident").submit(function(event) {
				event.preventDefault();
				updateIncident();
			});
			$("#rowAssignEmployees").hide();
			$("#btnAssignEmployees").click(function(event) {
				$("#rowDisplayIncident").hide();
				$("#rowAssignEmployeesHeading").append("Assign Employees to " + document.getElementById("editId").innerHTML);
				var incident = {};
				incident.id = document.getElementById("editId").innerHTML;
				loadEmployeesForAssignment(incident);
				$("#rowAssignEmployees").show();
			});

			$("#btnCancelAssignment").click(function(event) {
				document.getElementById("rowAssignEmployeesHeading").innerHTML = "";
				document.getElementById("assignEmpTable").innerHTML = "";
				$("#rowAssignEmployees").hide();
				$("#rowDisplayIncident").show();
			});

			listViaAjax();

			loadAllEmployees();

		});

		function loadAllEmployees() {
			$
					.ajax({
						type: "GET",
						contentType: "application/json",
						url: "http://localhost:8080/repairity/employeeREST/list",
						dataType: "json",
						success: function(data) {
								listAllEmployees(data);
							},
						error: function(error, xhr) {
								console.log("Problem on loadAllEmployees: " + error);
							}
					});
		}

		function listAllEmployees(data) {
			var tableBody = document.getElementById("assignEmpAllTable");
			tableBody.innerHTML = "";

			for(var i = 0; i < data.length; i++) {
				var tableRow = document.createElement("tr");
				tableRow.id = "assignEmpAllRow" + data[i].id;
				var tableRowId = document.createElement("th");
				tableRowId.innerHTML = data[i].id;
				var tableRowName = document.createElement("td");
				tableRowName.innerHTML = data[i].name;

				tableRow.appendChild(tableRowId);
				tableRow.appendChild(tableRowName);
				tableBody.appendChild(tableRow);
			}
		}

		function loadEmployees(incident) {
			$
					.ajax({
						type : "GET",
						contentType : "application/json",
						url : "http://localhost:8080/repairity/employeeREST/listByIncident",
						data : incident,
						dataType : "json",
						success : function(data) {
							listEmployeesAssigned(data);
						},
						error : function(error, xhr) {
							console
									.log("there is an error on loadEmployees(): "
											+ error);
							document.getElementById("empAssigned").innerHTML = "";
						}
					});
		}

		function loadEmployeesForAssignment(incident) {
			$
					.ajax({
						type : "GET",
						contentType : "application/json",
						url : "http://localhost:8080/repairity/employeeREST/listByIncident",
						data : incident,
						dataType : "json",
						success : function(data) {
							listEmployeesAssignedForAssignment(data);
						},
						error : function(error, xhr) {
							console
									.log("there is an error on loadEmployees(): "
											+ error);
							document.getElementById("assignEmpTable").innerHTML = "";
						}
					});
		}

		function listEmployeesAssigned(data) {
			console
					.log("in listEmployeesAssigned...data length "
							+ data.length);
			var bodyEmpAssigned = document.getElementById("empAssigned");
			bodyEmpAssigned.innerHTML = "";

			for (var i = 0; i < data.length; i++) {
				var tableRow = document.createElement("tr");
				tableRow.id = "tableRow" + data[i].id;

				var tableRowHeader = document.createElement("th");
				tableRowHeader.scope = "row";
				tableRowHeader.innerHTML = data[i].id;

				var tableRowName = document.createElement("td");
				tableRowName.innerHTML = data[i].name;

				tableRow.appendChild(tableRowHeader);
				tableRow.appendChild(tableRowName);
				bodyEmpAssigned.appendChild(tableRow);

				$("#tableRow" + data[i].id).hover(function() {
					$(this).css("background-color", "yellow");
				}, function() {
					$(this).css("background-color", "white");
				});
			}
		}

		function listEmployeesAssignedForAssignment(data) {
			console
					.log("in listEmployeesAssigned...data length "
							+ data.length);
			var bodyEmpAssigned = document.getElementById("assignEmpTable");
			bodyEmpAssigned.innerHTML = "";

			for (var i = 0; i < data.length; i++) {
				var tableRow = document.createElement("tr");
				tableRow.id = "tableRowAssigned" + data[i].id;

				var tableRowHeader = document.createElement("th");
				tableRowHeader.scope = "row";
				tableRowHeader.innerHTML = data[i].id;

				var tableRowName = document.createElement("td");
				tableRowName.innerHTML = data[i].name;

				tableRow.appendChild(tableRowHeader);
				tableRow.appendChild(tableRowName);
				bodyEmpAssigned.appendChild(tableRow);

				$("#tableRowAssigned" + data[i].id).hover(function() {
					$(this).css("background-color", "yellow");
				}, function() {
					$(this).css("background-color", "white");
				});
			}
		}

		function searchViaAjax() {
			console.log("search AJAX method");
			var incdt = {}
			incdt.id = $("#invoiceNo").val();
			console.log("invoiceno: " + incdt.id);
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "http://localhost:8080/repairity/incidentREST/search",
				data : incdt,
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					display(data);
				},
				error : function(e) {
					$('#divResults').hide();
					$('#divError').show();
				},
				done : function(e) {
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
				type : "GET",
				contentType : "application/json",
				url : "http://localhost:8080/repairity/incidentREST/list",
				data : incdt,
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					displayList(data);
				},
				error : function(e) {
					$('#divResults').hide();
					$('#divError').show();
				}
			})
		}

		function updateIncident() {
			var incdt = {};
			incdt.id = document.getElementById("editId").innerHTML;
			incdt.customer = $("#editCustomer").val();
			incdt.start = $("#editStart").val();
			incdt.stop = $("#editStop").val();
			incdt.complaint = $("#editComplaint").val();
			incdt.status = $("#editStatus").val();
			incdt.address = $("#editAddress").val();
			incdt.city = $("#editCity").val();
			incdt.state = $("#editState").val();
			incdt.zip = $("#editZip").val();
			incdt.phone = $("#editPhone").val();
			incdt.amount = $("#editAmount").val();
			console.log(incdt.start);
			$.ajax({
				type : "PUT",
				contentType : "application/json",
				url : "http://localhost:8080/repairity/incidentREST/update",
				data : JSON.stringify(incdt),
				dataType : 'json',
				timeout : 100000,
				success : function() {
					console.log("incident saved...");
					$("#successUpdate").innerHTML = "Incident Saved";
					$("#successUpdate").show();
					$("#successUpdate").fadeOut(2000);
				},
				error : function(e) {
					console.log("incident not saved...");
				}
			});

			listViaAjax();
		}

		function editIncident() {
			var incdt = {};
			incdt.id = $("#invoiceNo").val();
			incdt.customer = $("#customerName").val();
		}

		function display(data) {
			$('#invoiceNoResponse').html("Invoice Detail For: " + data.id);
			$('#status').html("Status: " + data.status);
			$('#customerName').html("Customer: " + data.customer);
			$('#complaint').html("Incident: " + data.complaint);
			$('#divError').hide();
			$('#divResults').show();
		}

		function displayList(data) {
			var resultList = document.getElementById("resultList");
			resultList.innerHTML = "";
			resultList.height = $(document).height();
			for (var i = 0; i < data.length; i++) {
				var row = document.createElement("div");
				row.className = "row";
				var col = document.createElement("div");
				col.className = "col-12";
				var card = document.createElement("div");
				card.className = "card";

				//information for card header
				var cardHeader = document.createElement("div");
				cardHeader.className = "card-header";
				cardHeader.id = "incidentHeader" + data[i].id;
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
				//headerColBtn.appendChild(edit);
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
				start.innerHTML = new Date(data[i].start)
						.toLocaleDateString('en-US');
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

				//function to pass value through controller to edit page
				$("#btnEdit" + data[i].id).click({
					id : data[i].id
				}, editIncident);
				//function to change color of card header when mouse hovers
				$("#incidentHeader" + data[i].id).hover(function() {
					$(this).css("background-color", "yellow");
				}, function() {
					$(this).css("background-color", "white");
				});
				//function to populate data to right side when card header is clicked
				$("#incidentHeader" + data[i].id).click({
					id : data[i].id
				}, showIncident);
			}

			$('#divError').hide();
			$('#searchResults').show();
		}

		function editIncident(event) {
			window.location.href = "/repairity/incident/edit?id="
					+ event.data.id;
		}

		function showIncident(event) {
			var incident = {};
			incident.id = event.data.id;

			$
					.ajax({
						type : "GET",
						contentType : "application/json",
						url : "http://localhost:8080/repairity/incidentREST/search",
						data : incident,
						dataType : 'json',
						success : function(data) {
							console.log("success on showIncident function "
									+ data.id);
							document.getElementById("editId").innerHTML = data.id;
							document.getElementById("editCustomer").value = data.customer;
							document.getElementById("editStart").valueAsDate = new Date(
									data.start);
							document.getElementById("editStop").valueAsDate = new Date(
									data.stop);
							document.getElementById("editComplaint").value = data.complaint;
							document.getElementById("editStatus").value = data.status;
							document.getElementById("editAddress").value = data.address;
							document.getElementById("editCity").value = data.city;
							document.getElementById("editState").value = data.state;
							document.getElementById("editZip").value = data.zip;
							document.getElementById("editPhone").value = data.phone;
							document.getElementById("editAmount").value = data.amount;
						},
						error : function(e) {
							console.log("error on showIncident function");
							$("#editId").innerHTML = "Didn't work...";
						}
					});

			loadEmployees(incident);
		}
	</script>
</body>
</html>