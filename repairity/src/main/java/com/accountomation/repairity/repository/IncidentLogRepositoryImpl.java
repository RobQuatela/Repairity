package com.accountomation.repairity.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

@Repository("incidentLogRepository")
@Transactional
public class IncidentLogRepositoryImpl implements IncidentLogRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public IncidentLog save(IncidentLog incidentLog) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(incidentLog);
		return incidentLog;
	}

	@Override
	public void update(IncidentLog incidentLog) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(incidentLog);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(IncidentLog incidentLog) {
		Session session = sessionFactory.getCurrentSession();
		IncidentLog il = session.load(IncidentLog.class, incidentLog.getId());
		session.delete(il);
	}

	@Override
	public IncidentLog get(Long id) {
		Session session = sessionFactory.openSession();
		return session.load(IncidentLog.class, id);
	}

	@Override
	public List<IncidentLog> list(Incident incident) {
		List<IncidentLog> incidentLog = new ArrayList<>();
		
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaQuery<IncidentLog> criteria = session.getCriteriaBuilder().createQuery(IncidentLog.class);
			Root<IncidentLog> root = criteria.from(IncidentLog.class);
			criteria
				.select(root)
				.where(session.getCriteriaBuilder().equal(root.get("incident"), incident));
			Query<IncidentLog> query = session.createQuery(criteria);
			incidentLog = query.getResultList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return incidentLog;
	}
	
	
}
