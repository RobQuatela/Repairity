package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;

public interface EmployeeRepository {

	public void save(Employee emp);
	
	public void update(Employee emp);
	
	public void delete(Employee emp);
	
	public Employee get(String id);
	
	public List<Employee> getEmployees(Company company);
}
