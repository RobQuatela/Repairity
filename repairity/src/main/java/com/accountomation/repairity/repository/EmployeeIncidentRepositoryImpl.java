package com.accountomation.repairity.repository;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.accountomation.repairity.model.EmployeeIncident;

@Repository("employeeIncidentRepository")
@Transactional
public class EmployeeIncidentRepositoryImpl implements EmployeeIncidentRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public EmployeeIncident save(EmployeeIncident employeeIncident) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(employeeIncident);
		return employeeIncident;
	}

	@Override
	public EmployeeIncident update(EmployeeIncident employeeIncident) {
		Session session = sessionFactory.getCurrentSession();
		session.update(employeeIncident);
		return employeeIncident;
	}

	@Override
	public void delete(EmployeeIncident employeeIncident) {
		EmployeeIncident empinc = new EmployeeIncident();
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaQuery<EmployeeIncident> criteria = session.getCriteriaBuilder().createQuery(EmployeeIncident.class);
			Root<EmployeeIncident> root = criteria.from(EmployeeIncident.class);
			criteria
				.select(root)
				.where(
						session.getCriteriaBuilder().equal(root.get("employee"), employeeIncident.getEmployee()),
						session.getCriteriaBuilder().equal(root.get("incident"), employeeIncident.getIncident())
				);
			Query<EmployeeIncident> query = session.createQuery(criteria);
			empinc = query.getSingleResult();
			if(empinc != null)
				session.delete(empinc);		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
