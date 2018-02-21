package com.accountomation.repairity.repository;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.util.HibernateUtil;

@Repository("companyRepository")
public class CompanyRepositoryImpl implements CompanyRepository {

	@Override
	public void save(Company company) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.save(company);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Company getCompany(String id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Company company = session.load(Company.class, id);
		return company;
	}

	@Override
	public List<Company> getCompanies() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Company company) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.update(company);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(Company company) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.delete(company);
		session.getTransaction().commit();
		session.close();
	}

}
