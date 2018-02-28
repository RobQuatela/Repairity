package com.accountomation.repairity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.repository.CompanyRepository;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService {

	//@Autowired
	private CompanyRepository companyRepository;
	
	@Autowired
	public void setCompanyRepository(CompanyRepository companyRepository) {
		System.out.println("Using Setter Injection");
		this.companyRepository = companyRepository;
	}

	@Override
	public List<Company> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional
	public void saveCompany(Company company) {
		companyRepository.save(company);
	}

	@Override
	public void deleteCompany(Company company) {
		companyRepository.delete(company);
	}

	@Override
	public void updateCompany(Company company) {
		companyRepository.update(company);
	}

	@Override
	public Company find(String id) {
		Company company = companyRepository.getCompany(id);
		return company;
	}

	@Override
	public void addEmployee(Company company, Employee employee) {
		companyRepository.addEmployee(company, employee);
	}

	@Override
	public List<Employee> getEmployees(Company company) {
		return companyRepository.listEmployees(company);
	}

}
