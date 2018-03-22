package com.accountomation.repairity.repository;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;

@Repository("companyRepository")
@Transactional
public class CompanyRepositoryImpl implements CompanyRepository {

	//@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void save(Company company) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(company);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Company getCompany(String id) {
		Session session = sessionFactory.getCurrentSession();
		return session.load(Company.class, id);
	}

	@Override
	public List<Company> getCompanies() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Company company) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(company);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(Company company) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(company);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void addEmployee(Company company, Employee employee) {
		Session session = sessionFactory.getCurrentSession();
		Company companyA = session.load(Company.class, company.getId());
		companyA.addEmployee(employee);
		session.close();
	}

	@Override
	public List<Employee> listEmployees(Company company) {
		Session session = sessionFactory.openSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Employee> criteria = cb.createQuery(Employee.class);
		Root<Employee> root = criteria.from(Employee.class);
		criteria
			.select(root)
			.where(cb.equal(root.get("company"), company));
		Query<Employee> query = session.createQuery(criteria);
		return query.getResultList();
	}

}
