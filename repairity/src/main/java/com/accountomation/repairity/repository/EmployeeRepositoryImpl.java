package com.accountomation.repairity.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;

public class EmployeeRepositoryImpl implements EmployeeRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Employee emp) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(emp);
		session.getTransaction().commit();
		session.close();
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
		// TODO Auto-generated method stub
		return null;
	}

}
