package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.model.Incident;

public interface EmployeeRepository {

	public Employee save(Employee emp);
	
	public Employee update(Employee emp);
	
	public void delete(Employee emp);
	
	public Employee get(String id);
	
	public List<Employee> getEmployees(Company company);
	
	public List<Employee> getEmployees();
	
	public List<Employee> searchEmployees(String name);
	
	public List<Employee> getEmployeesByIncident(Incident incident);
}
