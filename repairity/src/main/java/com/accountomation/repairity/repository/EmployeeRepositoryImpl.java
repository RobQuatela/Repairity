package com.accountomation.repairity.repository;

import java.util.ArrayList;
import java.util.List;

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

@Repository("employeeRepository")
@Transactional
public class EmployeeRepositoryImpl implements EmployeeRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Employee save(Employee emp) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(emp);
		return emp;
	}

	@Override
	public void update(Employee emp) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(emp);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(Employee emp) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(emp);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Employee get(String id) {
		Session session = sessionFactory.openSession();
		Employee emp = session.load(Employee.class, id);
		return emp;
	}

	@Override
	public List<Employee> getEmployees(Company company) {
		List<Employee> emps = new ArrayList<>();
		
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaQuery<Employee> criteria = session.getCriteriaBuilder().createQuery(Employee.class);
			Root<Employee> root = criteria.from(Employee.class);
			criteria
				.select(root)
				.where(session.getCriteriaBuilder().equal(root.get("company"), company));
			Query<Employee> query = session.createQuery(criteria);
			emps = query.getResultList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return emps;
	}

	@Override
	public List<Employee> getEmployees() {
		List<Employee> emps = new ArrayList<>();
		
		try {
			Session session = sessionFactory.getCurrentSession();
			Query<Employee> query = session.createQuery("FROM Employee", Employee.class);
			emps = query.getResultList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return emps;
	}

	@Override
	public List<Employee> searchEmployees(String name) {
		List<Employee> emps = new ArrayList<>();
		
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaQuery<Employee> criteria = session.getCriteriaBuilder().createQuery(Employee.class);
			Root<Employee> root = criteria.from(Employee.class);
			criteria
				.select(root)
				.where(session.getCriteriaBuilder().like(root.get("name"), "%" + name + "%"));
			Query<Employee> query = session.createQuery(criteria);
			emps = query.getResultList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return emps;
	}

}
