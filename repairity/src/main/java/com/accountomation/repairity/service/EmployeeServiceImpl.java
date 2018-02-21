package com.accountomation.repairity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.repository.EmployeeRepository;

public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeRepository employeeRepository;
	
	@Autowired
	public void setEmployeeRepository(EmployeeRepository employeeRepository) {
		this.employeeRepository = employeeRepository;
	}

	@Override
	public void saveEmployee(Employee emp) {
		employeeRepository.save(emp);
	}

	@Override
	public void updateEmployee(Employee emp) {
		employeeRepository.update(emp);
	}

	@Override
	public void deleteEmployee(Employee emp) {
		employeeRepository.delete(emp);
	}

	@Override
	public Employee getEmployee(String id) {
		Employee emp =employeeRepository.get(id);
		return emp;
	}

	@Override
	public List<Employee> getEmployees() {
		// TODO Auto-generated method stub
		return null;
	}

}
