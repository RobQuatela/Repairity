package com.accountomation.repairity.util;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.context.annotation.Bean;

public class HibernateUtil {

	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
/*	static {
		try {
			sessionFactory = new Configuration().configure()
					.buildSessionFactory();
		} catch(HibernateException e) {
			e.printStackTrace();
		}
	}*/
	
	public SessionFactory getSessionFactory() {
		try {
			sessionFactory = new Configuration().configure().buildSessionFactory();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return sessionFactory;
	}
}
