package com.accountomation.repairity.config;


import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan({"com.accountomation.repairity"})
public class AppConfig {

	//@Bean(name = "companyService")
	//public CompanyService getCompanyService() {
	//	CompanyServiceImpl service = new CompanyServiceImpl();
	//	//service.setCompanyRepository(getCompanyRepository());
	//	return service;
	//}
	
	//@Bean(name = "companyRepository")
	//public CompanyRepository getCompanyRepository() {
	//	return new CompanyRepositoryImpl();
	//}
	
/*	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory() {
		SessionFactory sessionFactory = null;
		try {
			sessionFactory = new org.hibernate.cfg.Configuration().configure().buildSessionFactory();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return sessionFactory;
	}*/
}
