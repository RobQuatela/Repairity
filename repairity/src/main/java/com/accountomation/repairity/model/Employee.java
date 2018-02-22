package com.accountomation.repairity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {

	private String id;
	private String name;
	private Company company;
	
	public Employee() {
		
	}
	
	public Employee(String id, String name, Company company) {
		super();
		this.id = id;
		this.name = name;
		this.company = company;
	}

	@Id
	@Column(name = "eid")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "ename")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne(targetEntity = Company.class)
	@JoinColumn(name = "company", nullable = false,
		foreignKey = @ForeignKey(name = "fk_employee_company"))
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
	
	
}
