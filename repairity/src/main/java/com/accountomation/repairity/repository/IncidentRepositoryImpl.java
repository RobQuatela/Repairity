package com.accountomation.repairity.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

@Repository("incidentRepository")
public class IncidentRepositoryImpl implements IncidentRepository {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(Incident incident) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(incident);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void update(Incident incident) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(incident);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public void delete(Incident incident) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.delete(incident);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Incident get(String id) {
		Session session = sessionFactory.openSession();
		return session.load(Incident.class, id);
	}

	@Override
	public List<Incident> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void log(IncidentLog incidentLog) {
		// TODO Auto-generated method stub
		
	}

}
