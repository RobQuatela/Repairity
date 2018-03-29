package com.accountomation.repairity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.model.EmployeeIncident;
import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.repository.EmployeeIncidentRepository;
import com.accountomation.repairity.repository.EmployeeRepository;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeRepository employeeRepository;
	
	private EmployeeIncidentRepository employeeIncidentRepository;
	
	@Autowired
	public void setEmployeeRepository(EmployeeRepository employeeRepository) {
		this.employeeRepository = employeeRepository;
	}
	
	@Autowired
	public void setEmployeeIncidentRepository(EmployeeIncidentRepository employeeIncidentRepository) {
		this.employeeIncidentRepository = employeeIncidentRepository;
	}

	@Override
	public Employee saveEmployee(Employee emp) {
		return employeeRepository.save(emp);
	}

	@Override
	public Employee updateEmployee(Employee emp) {
		return employeeRepository.update(emp);
	}

	@Override
	public void deleteEmployee(Employee emp) {
		employeeRepository.delete(emp);
	}

	@Override
	public Employee getEmployee(String id) {
		return employeeRepository.get(id);
	}

	@Override
	public List<Employee> getEmployees(Company company) {
		return employeeRepository.getEmployees(company);
	}

	@Override
	public List<Employee> getEmployees() {
		return employeeRepository.getEmployees();
	}

	@Override
	public List<Employee> searchEmployees(String name) {
		return employeeRepository.searchEmployees(name);
	}

	@Override
	public List<Employee> getEmployeesByIncident(Incident incident) {
		return employeeRepository.getEmployeesByIncident(incident);
	}

	@Override
	public EmployeeIncident assignEmployee(EmployeeIncident employeeIncident) {
		return employeeIncidentRepository.save(employeeIncident);
	}

	@Override
	public EmployeeIncident updateAssignment(EmployeeIncident employeeIncident) {
		return employeeIncidentRepository.update(employeeIncident);
	}

	@Override
	public void removeAssignment(EmployeeIncident employeeIncident) {
		employeeIncidentRepository.delete(employeeIncident);
	}

}
