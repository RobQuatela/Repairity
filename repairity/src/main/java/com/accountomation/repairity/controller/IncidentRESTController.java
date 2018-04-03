package com.accountomation.repairity.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.model.IncidentLog;
import com.accountomation.repairity.service.IncidentService;

@RestController
@RequestMapping(value = "/incidentREST")
public class IncidentRESTController {

	@Autowired
	IncidentService incidentService;
	
	@GetMapping(value = "/search")
	public ResponseEntity<Incident> getIncident(@RequestParam("id") String id) {
		Incident incident = incidentService.getIncident(id);
		
		if(incident == null) {
			return new ResponseEntity<Incident>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Incident>(incident, HttpStatus.OK);
	}
	
	@PostMapping(value = "/save")
	public ResponseEntity<Incident> saveIncident(@RequestBody Incident incdt) {
		Incident incident = new Incident();
		try {
			incident = incidentService.saveIncident(incdt);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Incident>(HttpStatus.BAD_REQUEST);
		}
		
		return new ResponseEntity<Incident>(incident, HttpStatus.OK);
	}
	
	@PutMapping(value = "/update")
	public ResponseEntity<Incident> updateIncident(@RequestBody Incident incdt) {
		
		Incident updatedIncident = new Incident();
		
		try {
			updatedIncident = incidentService.updateIncident(incdt);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(updatedIncident == null)
			return new ResponseEntity<Incident>(HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<Incident>(updatedIncident, HttpStatus.OK);
	}
	
	@GetMapping(value = "/list")
	public ResponseEntity<List<Incident>> listIncidents(@RequestParam("customer") String customer) {

		List<Incident> incidents;
		
		if(!customer.equals("")) {
			incidents = incidentService.getIncidents(customer);
		} else {
			incidents = incidentService.getIncidents();
		}
		
		if(incidents == null) {
			return new ResponseEntity<List<Incident>>( HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<List<Incident>>(incidents, HttpStatus.OK);
	}
	
	@GetMapping(value = "/listByStatus")
	public ResponseEntity<List<Incident>> listIncidentsByStatus(@RequestParam("status") String status) {
		List<Incident> incidents = new ArrayList<>();
		
		incidents = incidentService.getIncidentsByStatus(status);
		
		if(incidents == null)
			return new ResponseEntity<List<Incident>>(incidents, HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<List<Incident>>(incidents, HttpStatus.OK);
	}
	
	@GetMapping(value = "/getActivityLog")
	public ResponseEntity<List<IncidentLog>> logActivity(@RequestParam("id") String incident) {

		List<IncidentLog> incidentLog = new ArrayList<>();
		Incident incidentRecord = new Incident();
		incidentRecord.setId(incident);
		
		try {
			incidentLog = incidentService.listIncidentLog(incidentRecord);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<IncidentLog>>(HttpStatus.EXPECTATION_FAILED);
		}
		
		return new ResponseEntity<List<IncidentLog>>(incidentLog, HttpStatus.OK);
	}
	
	@PostMapping(value = "/logActivity")
	public ResponseEntity<IncidentLog> logActivity(@RequestBody IncidentLog incidentLog) {
		IncidentLog il = new IncidentLog();
		
		try {
			il = incidentService.logActivity(incidentLog);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<IncidentLog>(HttpStatus.EXPECTATION_FAILED);
		}
		
		return new ResponseEntity<IncidentLog>(il, HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/removeActivity")
	public ResponseEntity<IncidentLog> removeActivity(@RequestBody IncidentLog incidentLog) {
		IncidentLog il = new IncidentLog();
		
		try {
			incidentService.removeLog(incidentLog);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<IncidentLog>(HttpStatus.EXPECTATION_FAILED);
		}
		
		return new ResponseEntity<IncidentLog>(il, HttpStatus.OK);
	}
}
