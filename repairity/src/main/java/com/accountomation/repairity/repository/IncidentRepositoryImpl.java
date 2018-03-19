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

@Repository("incidentRepository")
@Transactional
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
	public Incident update(Incident incident) {
		Session session = sessionFactory.getCurrentSession();
		session.update(incident);
		return incident;
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

	@Override
	public List<Incident> list(String id) {
		List<Incident> incidents = new ArrayList<>();
		try {
			Session session = sessionFactory.getCurrentSession();
			CriteriaQuery<Incident> criteria = session.getCriteriaBuilder().createQuery(Incident.class);
			Root<Incident> root = criteria.from(Incident.class);
			criteria
				.select(root)
				.where(session.getCriteriaBuilder().like(root.get("id"), "%" + id + "%"));
			Query<Incident> query = session.createQuery(criteria);			
			//Query<Incident> query = session.createQuery("From Incident I WHERE I.id like :incd%", Incident.class);
			//query.setParameter("incd", id);
			incidents = query.getResultList();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return incidents;
	}

}
