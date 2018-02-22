package com.accountomation.repairity.service;

import java.util.List;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;

public interface IncidentService {

	public void saveIncident(Incident incident);
	
	public void updateIncident(Incident incident);
	
	public void deleteIncident(Incident incident);
	
	public Incident getIncident(String id);
	
	public List<Incident> getIncidents();
	
	public void log(IncidentLog incidentLog);
}
