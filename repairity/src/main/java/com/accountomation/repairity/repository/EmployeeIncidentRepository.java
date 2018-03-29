package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.EmployeeIncident;

public interface EmployeeIncidentRepository {

	public EmployeeIncident save(EmployeeIncident employeeIncident);
	
	public EmployeeIncident update(EmployeeIncident employeeIncident);
	
	public void delete(EmployeeIncident employeeIncident);
	
}
