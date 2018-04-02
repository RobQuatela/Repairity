package com.accountomation.repairity.repository;

import java.util.List;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

public interface IncidentLogRepository {

	public IncidentLog save(IncidentLog incidentLog);
	
	public void update(IncidentLog incidentLog);
	
	public void delete(IncidentLog incidentLog);
	
	public IncidentLog get(Long id);
	
	public List<IncidentLog> list(Incident incident);
}
