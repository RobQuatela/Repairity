package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

public interface IncidentRepository {

	public Incident save(Incident incident);
	
	public Incident update(Incident incident);
	
	public void delete(Incident incident);
	
	public Incident get(String id);
	
	public List<Incident> list();
	
	public List<Incident> list(String id);
	
	public void log(IncidentLog incidentLog);
}
