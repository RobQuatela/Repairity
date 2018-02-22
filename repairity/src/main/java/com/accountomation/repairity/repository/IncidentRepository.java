package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

public interface IncidentRepository {

	public void save(Incident incident);
	
	public void update(Incident incident);
	
	public void delete(Incident incident);
	
	public Incident get(String id);
	
	public List<Incident> list();
	
	public void log(IncidentLog incidentLog);
}
