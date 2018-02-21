package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Company;

public interface CompanyRepository {

	public void save(Company company);
	
	public Company getCompany(String id);
	
	public List<Company> getCompanies();
	
	public void update(Company company);
	
	public void delete(Company company);
}
