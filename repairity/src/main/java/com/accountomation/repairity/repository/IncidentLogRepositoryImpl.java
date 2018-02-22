package com.accountomation.repairity.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

@Repository("incidentLogRepository")
public class IncidentLogRepositoryImpl implements IncidentLogRepository {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(IncidentLog incidentLog) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(incidentLog);
		session.getTransaction().commit();
		session.close();
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
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(incidentLog);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public IncidentLog get(Long id) {
		Session session = sessionFactory.openSession();
		return session.load(IncidentLog.class, id);
	}

	@Override
	public List<IncidentLog> list(Incident incident) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
