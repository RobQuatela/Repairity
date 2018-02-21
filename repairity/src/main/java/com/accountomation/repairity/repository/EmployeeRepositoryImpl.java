package com.accountomation.repairity.repository;

import java.util.List;

import org.hibernate.Session;

import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.util.HibernateUtil;

public class EmployeeRepositoryImpl implements EmployeeRepository {

	@Override
	public void save(Employee emp) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.saveOrUpdate(emp);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void update(Employee emp) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.update(emp);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(Employee emp) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		session.delete(emp);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Employee get(String id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Employee emp = session.load(Employee.class, id);
		return emp;
	}

	@Override
	public List<Employee> getEmployees() {
		// TODO Auto-generated method stub
		return null;
	}

}
