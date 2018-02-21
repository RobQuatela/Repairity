package com.accountomation.repairity.service;

import java.util.List;

import com.accountomation.repairity.model.Company;

public interface CompanyService {

	public List<Company> findAll();
	
	public void saveCompany(Company company);
	
	public void deleteCompany(Company company);
	
	public void updateCompany(Company company);
	
	public Company findCompany(String id);
}
