package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;

public interface CompanyRepository {

	public void save(Company company);
	
	public Company getCompany(String id);
	
	public List<Company> getCompanies();
	
	public void update(Company company);
	
	public void delete(Company company);
	
	public void addEmployee(Company company, Employee employee);
	
	public List<Employee> listEmployees(Company company);
}
