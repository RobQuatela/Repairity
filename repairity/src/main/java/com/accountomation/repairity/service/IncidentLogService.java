package com.accountomation.repairity.service;

import java.util.List;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

public interface IncidentLogService {

	public void saveLog(IncidentLog incidentLog);
	
	public void updateLog(IncidentLog incidentLog);
	
	public void deleteLog(IncidentLog incidentLog);
	
	public IncidentLog getLog(Long id);
	
	public List<IncidentLog> getList(Incident incident);
}
