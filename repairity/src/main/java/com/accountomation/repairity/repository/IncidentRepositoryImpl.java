package com.accountomation.repairity.repository;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
		try {
			Session session = sessionFactory.getCurrentSession();
			//session.saveOrUpdate(incident);
			session.save(incident);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		Incident incident = new Incident();
		try {
			Session session = sessionFactory.getCurrentSession();
			incident = (Incident) session.get(Incident.class, id);
			if(incident == null) {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return incident;
	}

	@Override
	public List<Incident> list() {
		List<Incident> incidents = new ArrayList<>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query<Incident> query = session.createQuery("From Incident", Incident.class);
			incidents = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return incidents;
	}

	@Override
	public void log(IncidentLog incidentLog) {
		// TODO Auto-generated method stub

	}

}
