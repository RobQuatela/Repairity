package com.accountomation.repairity.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.model.Incident;

@Configuration
@EnableTransactionManagement
public class HibernateConfig {

	@Autowired
	private ApplicationContext context;
	
    @Bean
    public LocalSessionFactoryBean getSessionFactory() {
        LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
/*        factoryBean.setConfigLocation(context.getResource("classpath:hibernate.cfg.xml"));
        factoryBean.setAnnotatedClasses(Company.class, Employee.class, Incident.class);*/
        factoryBean.setDataSource(dataSource());
        factoryBean.setPackagesToScan("com.accountomation.repairity.model");
        factoryBean.setHibernateProperties(hibernateProperties());
        return factoryBean;
    }
    
    @Bean
    public HibernateTransactionManager getTransactionManager() {
    	HibernateTransactionManager transactionManager = new HibernateTransactionManager();
    	transactionManager.setSessionFactory(getSessionFactory().getObject());
    	return transactionManager;
    }
    
    @Bean
    public DataSource dataSource() {
    	BasicDataSource dataSource = new BasicDataSource();
    	dataSource.setDriverClassName("com.mysql.jdbc.Driver");
    	dataSource.setUrl("jdbc:mysql://LocalHost:3306/repairity?useSSL=false");
    	dataSource.setUsername("");
    	dataSource.setPassword("");
    	
    	return dataSource;
    }
    
    private final Properties hibernateProperties() {
    	Properties hibernateProperties = new Properties();
    	hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "create");
    	hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5InnoDBDialect");
    	hibernateProperties.setProperty("hibernate.show_sql", "true");
    	
    	return hibernateProperties;
    }
	

}
