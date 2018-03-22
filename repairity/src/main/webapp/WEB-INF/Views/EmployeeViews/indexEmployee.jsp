<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#msgSuccessInsert").hide();
		$("#msgError").hide();
		$("#newEmployeeCard").hide();

		$("#btnNewEmployee").click(function(event) {
			$("#newEmployeeCard").show();
			$("#btnNewEmployee").hide();
		});

		$("#btnCancel").click(function(event) {
			$("#newEmployeeCard").hide();
			$("#btnNewEmployee").show();
		});
		
		list();

		$("#frmNewEmployee").submit(function(event) {
			event.preventDefault();
			createEmployee();
		});

		$("#frmUpdateEmployee").submit(function(event) {
			event.preventDefault();
			updateEmployee();
		});
		
	});

	function searchEmployee() {
		var search = $("#txtSearch").val();
		var employee = {};
		employee.name = search;

		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/employeeREST/search",
			data: employee,
			dataType: "json",
			success: function(data) {
					listEmployees(data);
				},
			error: function(error, xhr) {
					$("#msgError").append(error);
					$("#msgError").show();
					$("#msgError").fadeOut(2000);
				}
		});
	}

	function createEmployee() {
		var company = {};
		company.id = $("#newCompany").val();
		
		var employee = {};
		employee.id = $("#newId").val();
		employee.name = $("#newName").val();
		employee.company = company;
		console.log(employee.company);

		$.ajax({
			type: "POST",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/employeeREST/new",
			data: JSON.stringify(employee),
			dataType: 'json',
			timeout: 100000,
			success: function(data) {
				list();
				$("#newEmployeeCard").hide();
				$("#btnNewEmployee").show();
				$("#msgSuccessInsert").show();
				$("#msgSuccessInsert").fadeOut(2000);
			},
			error: function(error) {
				$("#msgError").append(error);
				$("#msgError").show();
				$("#msgError").fadeOut(5000);
			}
		});
	}

	function list() {
		$.ajax({
			type: "GET",
			contentType: "application/json",
			url: "http://localhost:8080/repairity/employeeREST/list",
			dataType: 'json',
			timeout: 100000,
			success: function(data) {
				listEmployees(data);
			},
			error: function(error) {
				console.log(error);
			}
		});
	}

	function listEmployees(data) {
		var tableBody = document.getElementById("empTable");
		tableBody.innerHTML = "";

		for(var i = 0; i < data.length; i++) {
			var tableRow = document.createElement("tr");
			tableRow.id = "tableRow" + data[i].id;
			var tableRowHeader = document.createElement("th");
			
			tableRowHeader.scope = "row";
			tableRowHeader.innerHTML = data[i].id;

			var tableRowName = document.createElement("td");
			tableRowName.innerHTML = data[i].name;

			var tableRowCompany = document.createElement("td");
			tableRowCompany.innerHTML = data[i].company.name;

			tableRow.appendChild(tableRowHeader);
			tableRow.appendChild(tableRowName);
			tableRow.appendChild(tableRowCompany);
			tableBody.appendChild(tableRow);

			$("#tableRow" + data[i].id).hover(function() {
				$(this).css("background-color", "yellow");
			}, function() {
				$(this).css("background-color", "white");
			});

			$("#tableRow" + data[i].id).click({
				id: data[i].id, name: data[i].name
			}, showEmployee);
		}
	}

	function showEmployee(event) {
		document.getElementById("updateId").value = event.data.id;
		document.getElementById("updateName").value = event.data.name;
	}
</script>
</head>
<body>
	<div class="container container-fluid">
		<%@ include file="/WEB-INF/Views/header.jsp"%>
		<div class="container">
			<h1 class="display-2">Employees</h1>
		</div>
		<br />
		<div class="row">
			<div class="col-6">
				<div class="card">
					<form id="frmUpdateEmployee">
						<h5 class="card-header">Employee Detail</h5>
						<div class="card-body">
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Employee No:</span> <input
										type="text" id="updateId" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Employee Name:</span> <input
										type="text" id="updateName" class="form-control" />
								</div>
							</div>
							<button class="btn btn-primary" id="btnUpdateEmployee">Save Employee</button>
							<button class="btn btn-primary" id="btnNewEmployee">New Employee</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-6">
				<div class="card" id="newEmployeeCard">
					<form id="frmNewEmployee">
						<h5 class="card-header">New Employee</h5>
						<div class="card-body">
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Employee No:</span> <input
										type="text" id="newId" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<span class="input-group-text">Employee Name:</span> <input
										type="text" id="newName" class="form-control" />
								</div>
							</div>
							<div class="mb-2">
								<div class="input-group-prepend">
									<label class="input-group-text" for="newCompany">Company:</label>
									<select class="customer-select" id="newCompany">
										<option value="SSB">Atlanta</option>
										<option value="HOU">Houston</option>
										<option value="NJC">Toms River</option>
									</select>
								</div>
							</div>
							<button class="btn btn-primary" id="btnAddEmployee">Create Employee</button>
							<button class="btn btn-primary" id="btnCancel">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br />
		<div class="alert alert-success" id="msgSuccessInsert">Employee has been successfully created!</div>
		<div class="alert alert-danger" id="msgError">Error has occurred: </div>
		<div class="row">
			<div class="col-6">
				<div class="mb-2">
					<div class="input-group-prepend">
						<span class="input-group-text">Name:</span> <input
							type="text" id="txtSearch" placeholder="Search for Employee Name" onkeyup="searchEmployee()" class="form-control" />
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12" style="overflow-y: auto; height: 400px;">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Emp No.</th>
							<th scope="col">Name</th>
							<th scope="col">Company</th>
						</tr>
					</thead>
					<tbody id="empTable">
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="/WEB-INF/Views/footer.jsp"%>
	</div>
</body>
</html>