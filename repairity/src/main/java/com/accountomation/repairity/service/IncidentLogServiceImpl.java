package com.accountomation.repairity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;
import com.accountomation.repairity.repository.IncidentLogRepository;

@Service("incidentLogService")
public class IncidentLogServiceImpl implements IncidentLogService {

	private IncidentLogRepository incidentLogRepository;

	@Autowired
	public void setIncidentLogRepository(IncidentLogRepository incidentLogRepository) {
		this.incidentLogRepository = incidentLogRepository;
	}

	@Override
	public void saveLog(IncidentLog incidentLog) {
		incidentLogRepository.save(incidentLog);
	}

	@Override
	public void updateLog(IncidentLog incidentLog) {
		incidentLogRepository.update(incidentLog);
	}

	@Override
	public void deleteLog(IncidentLog incidentLog) {
		incidentLogRepository.delete(incidentLog);
	}

	@Override
	public IncidentLog getLog(Long id) {
		return incidentLogRepository.get(id);
	}

	@Override
	public List<IncidentLog> getList(Incident incident) {
		return incidentLogRepository.list(incident);
	}
	
	
}
