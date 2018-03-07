package com.accountomation.repairity.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.repository.IncidentRepository;

@Aspect
@Component
public class IncidentAspect {

	@Before("execution(* com.accountomation.repairity.repository.IncidentRepositoryImpl.save(..))")
	public void validateIncident(JoinPoint joinPoint) {
		System.out.println("Method: ValidateIncident is being processed...");
		Object[] args = joinPoint.getArgs();
		Incident incident = (Incident)args[0];
		IncidentRepository incidentRepo = (IncidentRepository) joinPoint.getTarget();
		String invoiceNo = incident.getId();
		if(incidentRepo.get(invoiceNo) != null) {
			throw new RuntimeException("Incident with invoice no " + invoiceNo + " already exists...");
		}
	}
}
