package com.accountomation.repairity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employee_incident")
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

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(targetEntity = Employee.class)
	@JoinColumn(name = "employee", nullable = false,
		foreignKey = @ForeignKey(name = "fk_employee_incident_employee"))
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(targetEntity = Incident.class)
	@JoinColumn(name = "incident", nullable = false,
		foreignKey = @ForeignKey(name = "fk_employee_incident_incident"))
	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
