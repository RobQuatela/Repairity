package com.accountomation.repairity.service;

import java.util.List;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;

public interface EmployeeService {

	public Employee saveEmployee(Employee emp);
	
	public void updateEmployee(Employee emp);
	
	public void deleteEmployee(Employee emp);
	
	public Employee getEmployee(String id);
	
	public List<Employee> getEmployees(Company company);
	
	public List<Employee> getEmployees();
	
	public List<Employee> searchEmployees(String name);
}
