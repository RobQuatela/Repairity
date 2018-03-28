package com.accountomation.repairity.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "tbemployee")
public class Employee {

	private String id;
	private String name;
	private Company company;
	private List<EmployeeIncident> employeeIncident = new ArrayList<>();
	
	public Employee() {
		
	}
	
	public Employee(String id, String name, Company company) {
		super();
		this.id = id;
		this.name = name;
		this.company = company;
	}

	@Id
	@Column(name = "emp_id")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "emp_name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(targetEntity = Company.class)
	@JoinColumn(name = "company", nullable = false,
		foreignKey = @ForeignKey(name = "fk_tbemployee_company"))
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@JsonIgnore
	@OneToMany(mappedBy = "employee", cascade = CascadeType.ALL)
	public List<EmployeeIncident> getEmployeeIncident() {
		return employeeIncident;
	}

	public void setEmployeeIncident(List<EmployeeIncident> employeeIncident) {
		this.employeeIncident = employeeIncident;
	}
	
	
}
