package com.accountomation.repairity.service;

import java.util.List;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;

public interface CompanyService {

	public List<Company> findAll();
	
	public void saveCompany(Company company);
	
	public void deleteCompany(Company company);
	
	public void updateCompany(Company company);
	
	public Company find(String id);
	
	public void addEmployee(Company company, Employee employee);
	
	public List<Employee> getEmployees(Company company);
}
