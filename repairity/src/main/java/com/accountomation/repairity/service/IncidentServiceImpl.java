package com.accountomation.repairity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;
import com.accountomation.repairity.repository.IncidentRepository;

@Service("incidentService")
public class IncidentServiceImpl implements IncidentService {

	private IncidentRepository incidentRepository;
	
	@Autowired
	public void setIncidentRepository(IncidentRepository incidentRepository) {
		this.incidentRepository = incidentRepository;
	}
	
	@Override
	public void saveIncident(Incident incident) {
		incidentRepository.save(incident);
	}

	@Override
	public void updateIncident(Incident incident) {
		incidentRepository.update(incident);
	}

	@Override
	public void deleteIncident(Incident incident) {
		incidentRepository.delete(incident);
	}

	@Override
	public Incident getIncident(String id) {
		return incidentRepository.get(id);
	}

	@Override
	public List<Incident> getIncidents() {
		return incidentRepository.list();
	}

	@Override
	public void log(IncidentLog incidentLog) {
		// TODO Auto-generated method stub
		
	}

}
