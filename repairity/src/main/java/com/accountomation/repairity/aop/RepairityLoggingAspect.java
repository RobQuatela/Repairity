package com.accountomation.repairity.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.jboss.logging.Logger;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class RepairityLoggingAspect {

	private Logger logger = Logger.getLogger(getClass().getName());
	
	@Pointcut("execution(* com.accountomation.repairity.controller.*.*(..))")
	private void forControllerPackage() {}
	
	@Pointcut("execution(* com.accountomation.repairity.service.*.*(..))")
	private void forServicePackage() {}
	
	@Pointcut("execution(* com.accountomation.repairity.repository.*.*(..))")
	private void forRepositoryPackage() {}
	
	@Pointcut("forControllerPackage() || forServicePackage() || forRepositoryPackage()")
	private void forApplication() {}
	
	@Before("forApplication()")
	public void before(JoinPoint joinPoint) {
		String methodName = joinPoint.getSignature().toShortString();
		logger.info("Information: in @Before Advice: Calling the Method: " + methodName);
	}
	
	@AfterReturning(pointcut="forApplication()", returning="result")
	public void afterReturning(JoinPoint joinPoint, Object result) {
		String methodName = joinPoint.getSignature().toShortString();
		logger.info("Information: in @AfterReturning: From Method: " + methodName);
		logger.info("Info: Data returned by Method: " + result);
	}
}
