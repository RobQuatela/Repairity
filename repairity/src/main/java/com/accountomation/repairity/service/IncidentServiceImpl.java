package com.accountomation.repairity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;
import com.accountomation.repairity.repository.IncidentLogRepository;
import com.accountomation.repairity.repository.IncidentRepository;

@Service("incidentService")
public class IncidentServiceImpl implements IncidentService {

	private IncidentRepository incidentRepository;
	private IncidentLogRepository incidentLogRepository;
	
	@Autowired
	public void setIncidentRepository(IncidentRepository incidentRepository) {
		this.incidentRepository = incidentRepository;
	}
	
	@Autowired
	public void setIncidentLogRepository(IncidentLogRepository incidentLogRepository) {
		this.incidentLogRepository = incidentLogRepository;
	}
	
	@Override
	@Transactional
	public Incident saveIncident(Incident incident) {
		return incidentRepository.save(incident);
	}

	@Override
	public Incident updateIncident(Incident incident) {
		return incidentRepository.update(incident);
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
	@Transactional
	public List<Incident> getIncidents() {
		return incidentRepository.list();
	}

	@Override
	public void log(IncidentLog incidentLog) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Incident> getIncidents(String customer) {
		return incidentRepository.list(customer);
	}

	@Override
	public IncidentLog logActivity(IncidentLog incidentLog) {
		return incidentLogRepository.save(incidentLog);
	}

	@Override
	public List<IncidentLog> listIncidentLog(Incident incident) {
		return incidentLogRepository.list(incident);
	}

	@Override
	public void removeLog(IncidentLog incidentLog) {
		incidentLogRepository.delete(incidentLog);
	}

	@Override
	public List<Incident> getIncidentsByStatus(String status) {
		return incidentRepository.listByStatus(status);
	}
	
	

}
