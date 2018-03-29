package com.accountomation.repairity.service;

import java.util.List;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.model.EmployeeIncident;
import com.accountomation.repairity.model.Incident;

public interface EmployeeService {

	public Employee saveEmployee(Employee emp);
	
	public Employee updateEmployee(Employee emp);
	
	public void deleteEmployee(Employee emp);
	
	public Employee getEmployee(String id);
	
	public List<Employee> getEmployees(Company company);
	
	public List<Employee> getEmployees();
	
	public List<Employee> searchEmployees(String name);
	
	public List<Employee> getEmployeesByIncident(Incident incident);
	
	public EmployeeIncident assignEmployee(EmployeeIncident employeeIncident);
	
	public EmployeeIncident updateAssignment(EmployeeIncident employeeIncident);
	
	public void removeAssignment(EmployeeIncident employeeIncident);
}
