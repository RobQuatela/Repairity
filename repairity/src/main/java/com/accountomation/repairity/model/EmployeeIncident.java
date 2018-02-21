package com.accountomation.repairity.model;

public class EmployeeIncident {

	private Long id;
	private Employee employee;
	private Incident incident;
	
	public EmployeeIncident() {
		
	}

	public EmployeeIncident(Long id, Employee employee, Incident incident) {
		super();
		this.id = id;
		this.employee = employee;
		this.incident = incident;
	}

	public EmployeeIncident(Employee employee, Incident incident) {
		super();
		this.employee = employee;
		this.incident = incident;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
