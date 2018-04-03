<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="/WEB-INF/css/style.css">
<title>Repairity</title>
</head>
<body style="background: #CEEAFF; overflow-x: hidden;">
	<div class="row mb-3">
		<div class="col-12 container-fluid">
			<nav class="navbar navbar-expand-lg navbar-dark"
				style="background: #6CBEFD;">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="navbar-brand">Repairity</li>
					<li class="nav-item"><a class="nav-link" id="navIncident">Incidents</a>
					</li>
					<li class="nav-item"><a class="nav-link" id="navEmployee">Employees</a>
					</li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<div class="container" id="pageIncident"
				style="background: #FFFFFF; border-radius: 15px;">
				<h1 class="display-3">Incidents</h1>
				<br />
				<div id="displayIncident">
					<div class="row" id="searchIncidents">
						<div class="col-8">
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
								<div class="col-10">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="Enter Invoice No" name="invoiceNo"
											id="invoiceNo" onkeyup="listViaAjax()">
												<button class="btn" id="btnNewIncident" style="background-color: transparent; border-color: #6CBEFD">
													<i class="material-icons"
														style="font-size: 30px; color: #6CBEFD;">add</i>
												</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br />
					<div class="row alert alert-success" id="successUpdate"
						role="alert"></div>
					<div class="row" id="rowDisplayIncident">
						<div class="col-4" style="overflow-y: auto; max-height: 600px;">
							<div id="resultList"></div>
						</div>
						<div class="col-8" style="overflow-y: auto; max-height: 600px;">
							<div class="row mb-2" id="rowDisplayIncidentHeader">
								<div class="col-12 text-white">
									<div class="container-fluid" style="background-color: #6CBEFD">
										<h1 class="display-4" id="editId"></h1>
									</div>
								</div>
							</div>
							<div class="row" id="rowDisplayIncident1">
								<div class="col-8">
									<h1 class="lead d-flex p-2">Incident Information</h1>
								</div>
								<div class="col-4">
									<button class="btn pull-right" id="btnUpdateIncident"
										style="background-color: transparent;">
										<i class="material-icons" style="font-size: 35px;">save</i>
									</button>
								</div>
							</div>
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
											<span class="input-group-text">Start:</span> <input
												type="date" id="editStart" class="form-control" />
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
											<span class="input-group-text">Status:</span> <input
												type="text" id="editStatus" class="form-control" />
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="mb-2">
										<div class="input-group-prepend">
											<span class="input-group-text">Address:</span> <input
												type="text" id="editAddress" class="form-control" />
										</div>
									</div>
									<div class="mb-2">
										<div class="input-group-prepend">
											<span class="input-group-text">City:</span> <input
												type="text" id="editCity" class="form-control" />
										</div>
									</div>
									<div class="mb-2">
										<div class="input-group-prepend">
											<span class="input-group-text">State:</span> <input
												type="text" id="editState" class="form-control" />
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
											<span class="input-group-text">Phone:</span> <input
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
								<div class="col-8">
									<div class="lead d-flex p-2">Employees Assigned</div>
								</div>
								<div class="col-4">
									<button class="btn pull-right" id="btnAssignEmployees"
										style="background-color: transparent;">
										<i class="material-icons" style="font-size: 35px;">person_add</i>
									</button>
								</div>
							</div>
							<div class="row" id="rowDisplayIncidentEmp2">
								<div class="col-12">
									<table class="table">
										<thead style="background-color: #6CBEFD;">
											<tr>
												<th scope="col" style="color: #FFFFFF">Employee No.</th>
												<th scope="col" style="color: #FFFFFF">Name</th>
											</tr>
										</thead>
										<tbody id="empAssigned">
										</tbody>
									</table>
								</div>
							</div>
							<div class="row" id="rowDisplayLogTitle">
								<div class="col-8">
									<div class="lead d-flex p-2">Incident Log</div>
								</div>
								<div class="col-4">
									<button class="btn pull-right" id="btnLogActivity"
										style="background-color: transparent;">
										<i class="material-icons" style="font-size: 35px;">assignment</i>
									</button>
								</div>
							</div>
							<div class="row" id="rowDisplayLogBody">
								<div class="col-12">
									<table class="table">
										<thead style="background-color: #6CBEFD;">
											<tr>
												<th style="color: #FFFFFF">Date</th>
												<th style="color: #FFFFFF">Notes</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="displayLogBodyTable"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="assignEmployees">
					<div class="row" id="rowAssignEmployees">
						<div class="col-12">
							<div class="row">
								<div class="col-10">
									<h1 class="display-4" id="rowAssignEmployeesHeading"></h1>
								</div>
								<div class="col-2">
									<button id="btnCancelAssignmentPic" class="btn btn-danger" style="background-color: transparent">
										<i class="material-icons text-danger" style="font-size: 80px">cancel</i>
									</button>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-11" style="max-height: 200px; overflow-y: auto;">
									<h1 class="lead">Assigned Employees:</h1>
									<table class="table">
										<thead>
											<tr>
												<th>Employee No.</th>
												<th>Name</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="assignEmpTable">
										</tbody>
									</table>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-12" id="msgAssignEmployees"></div>
							</div>
							<div class="row">
								<div class="col-11"
									style="max-height: 400px; overflow-y: auto;">
									<h1 class="lead">Available Employees:</h1>
									<input type="text" class="form-control"
										id="txtAssignEmployeeSearch" placeholder="Search Employees"
										onkeyup="searchAvailableEmployees()" />
									<table class="table">
										<thead>
											<tr>
												<th>Employee No.</th>
												<th>Name</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="assignEmpAllTable">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="logActivity">
					<div class="row mb-4">
						<div class="col-8">
							<h1 class="display-4" id="titleLogActivity"></h1>
						</div>
						<div class="col-2">
							<button class="btn btn-success pull-right" style="background-color: transparent"
								id="btnSaveLogActivity">
								<i class="material-icons text-success" style="font-size: 80px">check</i>
							</button>
						</div>
						<div class="col-2">
							<button class="btn btn-danger pull-right" style="background-color: transparent"
								id="btnCloseLogActivity">
								<i class="material-icons text-danger" style="font-size: 80px">cancel</i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="input-group-prepend mb-2">
								<span class="input-group-text">Date</span>
								<input type="date" id="incidentLogDate" class="form-control" />
							</div>
							<div class="input-group-prepend mb-2">
								<span class="input-group-text">Notes</span>
								<textarea id="incidentLogNotes" class="form-control"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div id="newIncident">
					<div class="row mb-4">
						<div class="col-8">
							<h1 class="display-4">New Incident</h1>
						</div>
						<div class="col-2">
							<button class="btn btn-success pull-right" style="background-color: transparent" id="btnAddIncident">
								<i class="material-icons text-success" style="font-size: 80px;">check</i>
							</button>
						</div>
						<div class="col-2">
							<button class="btn btn-danger pull-right" style="background-color: transparent"
								id="btnCancelAddIncident">
								<i class="material-icons text-danger" style="font-size: 80px;">cancel</i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div id="newIncidentMessage"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Invoice No:</span> <input
										type="text" id="newInvoice" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Customer:</span> <input
										type="text" id="newCustomer" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Start:</span> <input type="date"
										id="newStart" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Complaint:</span>
									<textarea id="newComplaint" class="form-control"></textarea>
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Status:</span> <input
										type="text" id="newStatus" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Address:</span> <input
										type="text" id="newAddress" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">City:</span> <input type="text"
										id="newCity" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">State:</span> <input type="text"
										id="newState" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Zip Code:</span> <input
										type="text" id="newZip" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Phone:</span> <input type="text"
										id="newPhone" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">$:</span> <input type="text"
										id="newAmount" class="form-control" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container" id="pageEmployee"
				style="background: #FFFFFF; border-radius: 15px;">
				<h1 class="display-3 mb-3">Employees</h1>
				<div id="displayEmployees">
					<div class="row mb-3">
						<div class="col-6">
							<div class="mb-2">
								<div class="input-group">
									<input type="text" id="txtSearch"
										placeholder="Search for Employee Name"
										onkeyup="searchEmployee()" class="form-control" />
									<button class="btn" id="btnNewEmployee"
										style="background-color: transparent; border-color: #6CBEFD;">
										<i class="material-icons"
											style="font-size: 30px; color: #6CBEFD;">add</i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div id="msgPageEmployee"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-12" style="overflow-y: auto; max-height: 600px;">
							<table class="table">
								<thead style="background-color: #6CBEFD;">
									<tr>
										<th scope="col" style="color: #FFFFFF">Emp No.</th>
										<th scope="col" style="color: #FFFFFF">Name</th>
										<th scope="col" style="color: #FFFFFF">Company</th>
										<th></th>
									</tr>
								</thead>
								<tbody id="pageEmployeeTableEmployee"></tbody>
							</table>
						</div>
					</div>
					<!--  -->
				</div>
				<div id="newEmployee">
					<div class="row mb-3">
						<div class="col-8">
							<h1 class="display-4">New Employee</h1>
						</div>
						<div class="col-2">
							<button class="btn btn-success pull-right" style="background-color: transparent;" id="btnAddEmployee">
								<i class="material-icons text-success" style="font-size: 80px;">check</i>
							</button>
						</div>
						<div class="col-2">
							<button class="btn btn-danger pull-right" style="background-color: transparent;" id="btnCancelAddEmployee">
								<i class="material-icons text-danger" style="font-size: 80px;">cancel</i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div id="msgPageEmployeeNew"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Employee No:</span>
									<input type="text" id="newEmployeeNo" class="form-control">
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Name:</span>
									<input type="text" id="newEmployeeName" class="form-control">
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<label class="input-group-text" for="newEmployeeCompany">Company:</label>
									<select class="customer-select form-control" id="newEmployeeCompany">
										<option value="SSB">Atlanta</option>
										<option value="HOU">Houston</option>
										<option value="NJC">Toms River</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 container-fluid">
				<footer class="footer">
				<div id="footerTitle" class="text-center"></div>
				</footer>
			</div>
		</div>
		<script>
			$(document)
					.ready(
							function() {
								var d = new Date(Date.now());
								document.getElementById("footerTitle").innerHTML = "Copyright &copy; - Accountomation "
										+ d.getFullYear();
								$("#pageEmployee").hide();
								$('#divResults').hide();
								$('#divError').hide();
								$('#searchResults').hide();
								$("#successUpdate").hide();
								$("#assignEmployees").hide();
								$("#logActivity").hide();
								$("#newIncident").hide();
								$("#newEmployee").hide();
								$("#msgPageEmployeeNew").hide();
								$("#msgPageEmployee").hide();

								$("#navEmployee").click(function(event) {
									$("#pageIncident").fadeOut(800);
									$("#pageEmployee").fadeIn(2000);
								});

								$("#navIncident").click(function(event) {
									$("#pageEmployee").fadeOut(800);
									$("#pageIncident").fadeIn(2000);
								});

								$("#btnUpdateIncident").click(function(event) {
									event.preventDefault();
									updateIncident();
									displ
								});

								$("#btnAssignEmployees")
										.click(
												function(event) {
													$("#displayIncident")
															.slideUp();
													$(
															"#rowAssignEmployeesHeading")
															.append(
																	"Assign Employees to "
																			+ document
																					.getElementById("editId").innerHTML);
													var incident = {};
													incident.id = document
															.getElementById("editId").innerHTML;
													loadEmployeesForAssignment(incident);
													$("#assignEmployees")
															.show();
												});

								$("#btnLogActivity")
										.click(
												function(event) {
													$("#displayIncident")
															.slideUp();
													$("#titleLogActivity")
															.append(
																	"Log Activity for "
																			+ document
																					.getElementById("editId").innerHTML);
													$("#logActivity").show();
												});

								$("#btnSaveLogActivity")
										.click(
												function(event) {
													console
															.log("entering btnSaveLogActivity event handler...");
													var incident = {};
													incident.id = document
															.getElementById("editId").innerHTML;
													console.log(incident.id);
													incidentLog = {};
													incidentLog.date = $(
															"#incidentLogDate")
															.val();
													incidentLog.notes = $(
															"#incidentLogNotes")
															.val();
													incidentLog.incident = incident;

													$
															.ajax({
																type : "POST",
																contentType : "application/json",
																url : "http://localhost:8080/repairity/incidentREST/logActivity",
																data : JSON
																		.stringify(incidentLog),
																dataType : "json",
																timeout : 100000,
																success : function(
																		data) {
																	$(
																			"#logActivity")
																			.slideUp();
																	$(
																			"#displayIncident")
																			.show();
																	displayMessage(
																			"row alert alert-success",
																			"Activity has been logged!",
																			"successUpdate",
																			2000);
																	loadIncidentLog(incident);
																},
																error : function(
																		error,
																		xhr) {
																	displayMessage(
																			"row alert alert-danger",
																			"ERROR: Activity was not logged",
																			"successUpdate",
																			5000);
																}
															});
												});

								$("#btnCloseLogActivity")
										.click(
												function(event) {
													$("#logActivity").slideUp();
													document
															.getElementById("titleLogActivity").innerHTML = "";
													$("#displayIncident")
															.show();
												});

								$("#btnCancelAssignmentPic")
										.click(
												function(event) {
													document
															.getElementById("rowAssignEmployeesHeading").innerHTML = "";
													document
															.getElementById("assignEmpTable").innerHTML = "";
													$("#assignEmployees")
															.slideDown();
													$("#assignEmployees")
															.hide();
													$("#displayIncident")
															.show();
												});

								$("#btnNewIncident").click(function(event) {
									$("#displayIncident").slideUp();
									$("#newIncident").show();
								});

								$("#btnAddIncident").click(function(event) {
									event.preventDefault();
									newIncident();
								});

								$("#btnCancelAddIncident")
										.click(
												function(event) {
													document
															.getElementById("newInvoice").innerHTML = "";
													document
															.getElementById("newCustomer").innerHTML = "";
													document
															.getElementById("newStart").innerHTML = "";
													document
															.getElementById("newComplaint").innerHTML = "";
													document
															.getElementById("newStatus").innerHTML = "";
													document
															.getElementById("newAddress").innerHTML = "";
													document
															.getElementById("newCity").innerHTML = "";
													document
															.getElementById("newState").innerHTML = "";
													document
															.getElementById("newZip").innerHTML = "";
													document
															.getElementById("newPhone").innerHTML = "";
													document
															.getElementById("newAmount").innerHTML = "";
													$("#newIncident").hide();
													$("#displayIncident")
															.show();
												});

								$("#btnNewEmployee").click(function(event) {
									$("#displayEmployees").slideUp();
									$("#newEmployee").show();
								});

								$("#btnCancelAddEmployee").click(function(event) {
									document.getElementById("newEmployeeNo").value = "";
									document.getElementById("newEmployeeName").value = "";
									
									$("#newEmployee").fadeOut(500);
									$("#displayEmployees").fadeIn(500);
								});

								$("#btnAddEmployee").click(function(event) {
									newEmployee();
								});		

								listViaAjax();

								loadAllEmployees();
								loadAllEmployeesPageEmployee();

							});

			function displayMessage(className, message, parent, fadeOut) {
				var p = document.getElementById(parent);

				p.className = className;
				p.innerHTML = message;
				p.role = "alert";

				$(p).show();
				$(p).fadeOut(fadeOut);
			}

			function newEmployee() {
				var employee = {};
				var company = {};

				employee.id = $("#newEmployeeNo").val();
				employee.name = $("#newEmployeeName").val();
				company.id = $("#newEmployeeCompany").val();
				employee.company = company;

				$.ajax({
					type: "POST",
					contentType: "application/json",
					url: "http://localhost:8080/repairity/employeeREST/new",
					data: JSON.stringify(employee),
					dataType: "json",
					timeout: 100000,
					success: function(data) {
							document.getElementById("newEmployeeNo").value = "";
							document.getElementById("newEmployeeName").value = "";
							loadAllEmployeesPageEmployee();
							$("#newEmployee").hide();
							$("#displayEmployees").show();
							displayMessage("row alert alert-success", data.name + " has been added!", "msgPageEmployee", 2000);
						},
					error: function(error, xhr) {
							displayMessage("row alert alert-danger", "ERROR: Employee not added: " + error, "msgPageEmployeeNew", 5000);
						}
				});
			}

			function newIncident() {
				var incident = {};
				var start = new Date($("#newStart").val());
				start
						.setMinutes(start.getMinutes()
								+ start.getTimezoneOffset());
				incident.id = $("#newInvoice").val();
				incident.customer = $("#newCustomer").val();
				incident.start = start;
				incident.complaint = $("#newComplaint").val();
				incident.status = $("#newStatus").val();
				incident.address = $("#newAddress").val();
				incident.city = $("#newCity").val();
				incident.state = $("#newState").val();
				incident.zip = $("#newZip").val();
				incident.phone = $("#newPhone").val();
				incident.amount = $("#newAmount").val();

				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "http://localhost:8080/repairity/incidentREST/save",
					data : JSON.stringify(incident),
					dataType : "json",
					timeout : 100000,
					success : function(data) {
						$("#newIncident").hide();
						document.getElementById("newInvoice").innerHTML = "";
						document.getElementById("newCustomer").innerHTML = "";
						document.getElementById("newStart").innerHTML = "";
						document.getElementById("newComplaint").innerHTML = "";
						document.getElementById("newStatus").innerHTML = "";
						document.getElementById("newAddress").innerHTML = "";
						document.getElementById("newCity").innerHTML = "";
						document.getElementById("newState").innerHTML = "";
						document.getElementById("newZip").innerHTML = "";
						document.getElementById("newPhone").innerHTML = "";
						document.getElementById("newAmount").innerHTML = "";
						$("#displayIncident").show();
						listViaAjax();
						displayMessage("row alert alert-success", data.id
								+ " has been successfully added!",
								"successUpdate", 2000);
					},
					error : function(error, xhr) {
						displayMessage("row alert alert-success",
								"ERROR: could not add new incident: " + error,
								"newIncidentMessage", 5000);
					}
				});
			}

			function loadIncidentLog(incident) {
				$
						.ajax({
							type : "GET",
							contentType : "application/json",
							url : "http://localhost:8080/repairity/incidentREST/getActivityLog",
							data : incident,
							dataType : "json",
							timeout : 100000,
							success : function(data) {
								var body = document
										.getElementById("displayLogBodyTable");
								body.innerHTML = "";
								console.log(data.length + " log length");
								for (var i = 0; i < data.length; i++) {
									var row = document.createElement("tr");
									row.id = "row" + data[i].id;

									var date = new Date(data[i].date);

									var logDate = document.createElement("td");
									logDate.innerHTML = (date.getMonth() + 1)
											+ "/" + date.getDate() + "/"
											+ date.getFullYear();
									console.log(data[i].date);

									var logNotes = document.createElement("td");
									logNotes.innerHTML = data[i].notes;

									var logRemove = document.createElement("i");
									logRemove.className = "fa fa-trash-o";
									logRemove.style = "font-size: 30px";
									logRemove.id = "removeLog" + data[i].id;

									row.appendChild(logDate);
									row.appendChild(logNotes);
									row.appendChild(logRemove);
									body.appendChild(row);

									$("#removeLog" + data[i].id).hover(
											function() {
												$(this).css("color", "red");
											}, function() {
												$(this).css("color", "black");
											}).click({
										id : data[i].id,
										incident : data[i].incident
									}, removeLog);
								}
							},
							error : function(error, xhr) {
								displayMessage("row alert alert-danger",
										"Error loading logs", "successUpdate",
										5000);
							}
						});
			}

			function removeLog(event) {
				var incidentLog = {};
				incidentLog.id = event.data.id;

				$
						.ajax({
							type : "DELETE",
							contentType : "application/json",
							url : "http://localhost:8080/repairity/incidentREST/removeActivity",
							data : JSON.stringify(incidentLog),
							dataType : "json",
							timeout : 100000,
							success : function(data) {
								loadIncidentLog(event.data.incident);
								displayMessage("row alert alert-success",
										"Activity for " + event.data.incident
												+ " has been removed",
										"successUpdate", 2000);
							},
							error : function(error, xhr) {
								displayMessage("row alert alert-danger",
										"Activity for " + event.data.incident
												+ " was not removed",
										"successUpdate", 5000);
							}
						});
			}

			function loadAllEmployeesPageEmployee() {
				$.ajax({
					type : "GET",
					contentType : "application/json",
					url : "http://localhost:8080/repairity/employeeREST/list",
					dataType : "json",
					success : function(data) {
						listAllEmployeesPageEmployee(data);
					},
					error : function(error, xhr) {
						console.log("Problem on loadAllEmployees: " + error);
					}
				});
			}

			function listAllEmployeesPageEmployee(data) {
				var tableBody = document
						.getElementById("pageEmployeeTableEmployee");
				tableBody.innerHTML = "";

				for (var i = 0; i < data.length; i++) {
					var tableRow = document.createElement("tr");
					tableRow.id = "pageEmployeeassignEmpAllRow" + data[i].id;
					var tableRowId = document.createElement("th");
					tableRowId.innerHTML = data[i].id;
					var tableRowName = document.createElement("td");
					tableRowName.innerHTML = data[i].name;
					var tableRowCompany = document.createElement("td");
					tableRowCompany.innerHTML = data[i].company.name;
					var btnEdit = document.createElement("button");
					btnEdit.style = "background-color: transparent";
					btnEdit.className = "btn pull-right";
					btnEdit.id = "btnEditAssignment" + data[i].id;
					var tableRowEdit = document.createElement("i");
					tableRowEdit.className = "material-icons";
					tableRowEdit.style = "font-size: 20px";
					tableRowEdit.innerHTML = "mode_edit";
					tableRowEdit.id = "editAssignment" + data[i].id;

					btnEdit.appendChild(tableRowEdit);
					tableRow.appendChild(tableRowId);
					tableRow.appendChild(tableRowName);
					tableRow.appendChild(tableRowCompany);
					tableRow.appendChild(btnEdit);
					tableBody.appendChild(tableRow);

					$("#btnEditAssignment" + data[i].id).hover(function() {
						$(this).css("color", "green");
					}, function() {
						$(this).css("color", "black");
					}).click({
						id : data[i].id
					}, editEmployee);

				}
			}

			function editEmployee(event) {
				
			}

			function loadAllEmployees() {
				$.ajax({
					type : "GET",
					contentType : "application/json",
					url : "http://localhost:8080/repairity/employeeREST/list",
					dataType : "json",
					success : function(data) {
						listAllEmployees(data);
					},
					error : function(error, xhr) {
						console.log("Problem on loadAllEmployees: " + error);
					}
				});
			}

			function listAllEmployees(data) {
				var tableBody = document.getElementById("assignEmpAllTable");
				tableBody.innerHTML = "";

				for (var i = 0; i < data.length; i++) {
					var tableRow = document.createElement("tr");
					tableRow.id = "assignEmpAllRow" + data[i].id;
					var tableRowId = document.createElement("th");
					tableRowId.innerHTML = data[i].id;
					var tableRowName = document.createElement("td");
					tableRowName.innerHTML = data[i].name;
					var tableRowAdd = document.createElement("i");
					tableRowAdd.className = "fa fa-plus pull-right";
					tableRowAdd.style = "font-size: 26px";
					tableRowAdd.id = "addAssignment" + data[i].id;

					tableRow.appendChild(tableRowId);
					tableRow.appendChild(tableRowName);
					tableRow.appendChild(tableRowAdd);
					tableBody.appendChild(tableRow);

					$("#addAssignment" + data[i].id).hover(function() {
						$(this).css("color", "green");
					}, function() {
						$(this).css("color", "black");
					}).click({
						id : data[i].id
					}, assignEmployee);

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
				console.log("in listEmployeesAssigned...data length "
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

					/* 				$("#tableRow" + data[i].id).hover(function() {
										$(this).css("background-color", "yellow");
									}, function() {
										$(this).css("background-color", "white");
									}); */
				}
			}

			function listEmployeesAssignedForAssignment(data) {
				console.log("in listEmployeesAssigned...data length "
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

					var tableRowRemove = document.createElement("i");
					tableRowRemove.className = "fa fa-trash-o pull-right";
					tableRowRemove.style = "font-size: 36px";
					tableRowRemove.id = "removeAssignment" + data[i].id;

					tableRow.appendChild(tableRowHeader);
					tableRow.appendChild(tableRowName);
					tableRow.appendChild(tableRowRemove);
					bodyEmpAssigned.appendChild(tableRow);

					$("#removeAssignment" + data[i].id).hover(function() {
						$(this).css("color", "red");
					}, function() {
						$(this).css("color", "black");
					}).click({
						id : data[i].id
					}, removeAssignment);
				}
			}

			function assignEmployee(event) {
				var employeeIncident = {}, employee = {}, incident = {};
				employee.id = event.data.id;
				incident.id = document.getElementById("editId").innerHTML;
				employeeIncident.employee = employee;
				employeeIncident.incident = incident;

				$
						.ajax({
							type : "POST",
							contentType : "application/json",
							url : "http://localhost:8080/repairity/employeeREST/assignEmployee",
							data : JSON.stringify(employeeIncident),
							timeout : 100000,
							success : function(data) {
								console.log("success for assignment");
								displayMessage("row alert alert-success",
										"Employee Has Been Assigned!",
										"msgAssignEmployees", 2000);
								loadEmployeesForAssignment(incident);
								loadEmployees(incident);
							},
							error : function(error, xhr) {
								displayMessage("row alert alert-danger",
										"Employee was not assigned: " + error,
										"msgAssignEmployees", 5000);
							}
						});
			}

			function removeAssignment(event) {
				var employeeIncident = {}, employee = {}, incident = {};
				employee.id = event.data.id;
				incident.id = document.getElementById("editId").innerHTML;
				employeeIncident.employee = employee;
				employeeIncident.incident = incident;

				$
						.ajax({
							type : "DELETE",
							contentType : "application/json",
							url : "http://localhost:8080/repairity/employeeREST/removeAssignment",
							data : JSON.stringify(employeeIncident),
							timeout : 100000,
							success : function(data) {
								displayMessage("row alert alert-success",
										"Assignment Has Been Removed",
										"msgAssignEmployees", 2000);
								loadEmployeesForAssignment(incident);
								loadEmployees(incident);
							},
							error : function(error, xhr) {
								displayMessage("row alert alert-danger",
										"Assignment was not removed: " + error,
										"msgAssignEmployees", 5000);
							}
						});
			}

			function searchViaAjax() {
				var incdt = {}
				incdt.id = $("#invoiceNo").val();
				$
						.ajax({
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
								console.log("done with ajax function");
							}
						});
			}

			function searchAvailableEmployees() {
				var employee = {}
				var search = $("#txtAssignEmployeeSearch").val();
				employee.name = search;
				console.log(employee.name);
				$
						.ajax({
							type : "GET",
							contentType : "application/json",
							url : "http://localhost:8080/repairity/employeeREST/search",
							data : employee,
							dataType : 'json',
							timeout : 100000,
							success : function(data) {
								listAllEmployees(data);
							},
							error : function(e) {
							}
						});
			}

			function listViaAjax() {
				var incdt = {};
				incdt.id = $("#invoiceNo").val();
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
				var start = new Date($("#editStart").val());
				start
						.setMinutes(start.getMinutes()
								+ start.getTimezoneOffset());
				var stop = new Date($("#editStop").val());
				stop.setMinutes(stop.getMinutes() + stop.getTimezoneOffset());

				incdt.id = document.getElementById("editId").innerHTML;
				incdt.customer = $("#editCustomer").val();
				incdt.start = start;
				incdt.stop = stop;
				incdt.complaint = $("#editComplaint").val();
				incdt.status = $("#editStatus").val();
				incdt.address = $("#editAddress").val();
				incdt.city = $("#editCity").val();
				incdt.state = $("#editState").val();
				incdt.zip = $("#editZip").val();
				incdt.phone = $("#editPhone").val();
				incdt.amount = $("#editAmount").val();

				$
						.ajax({
							type : "PUT",
							contentType : "application/json",
							url : "http://localhost:8080/repairity/incidentREST/update",
							data : JSON.stringify(incdt),
							dataType : 'json',
							timeout : 100000,
							success : function() {
								listViaAjax();
								displayMessage("row alert alert-success",
										"Incident has been saved!",
										"successUpdate", 2000);
							},
							error : function(e) {
								displayMessage("row alert alert-danger",
										"Error! Incident not saved!",
										"successUpdate", 5000);
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
					cardHeader.style = "background: #6CBEFD;";
					var invoice = document.createElement("div");
					invoice.innerHTML = data[i].id;
					invoice.style = "color: #fafdff";
					invoice.id = "txtId" + data[i].id;
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
						$(this).css("background-color", "#CEEAFF");
					}, function() {
						$(this).css("background-color", "#6CBEFD");
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
								displayMessage("row alert alert-danger",
										"Incident cannot be displayed",
										"successUpdate", 5000);
							}
						});

				loadEmployees(incident);
				loadIncidentLog(incident);
			}
		</script>
</body>
</html>