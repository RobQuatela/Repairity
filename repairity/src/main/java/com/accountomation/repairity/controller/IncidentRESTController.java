package com.accountomation.repairity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.service.IncidentService;

@RestController
@RequestMapping(value = "/incidentREST")
public class IncidentRESTController {

	@Autowired
	IncidentService incidentService;
	
/*	@RequestMapping(//value = "/{id}", 
			method = RequestMethod.POST)
	public ResponseEntity<Incident> getIncident(String invoiceNo) {
		Incident incident = incidentService.getIncident(invoiceNo);
		System.out.println("Request invocie no: " + invoiceNo);
		
		if(incident == null) {
			return new ResponseEntity(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Incident>(incident, HttpStatus.OK);
	}*/
	
	@GetMapping(value = "/search")
	public ResponseEntity<Incident> getIncident(@RequestParam("id") String id) {
		Incident incident = incidentService.getIncident(id);
		System.out.println("Request invocie no: " + id);
		
		if(incident == null) {
			return new ResponseEntity<Incident>(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Incident>(incident, HttpStatus.OK);
	}
	
	@PostMapping(value = "/save")
	public ResponseEntity<Incident> saveIncident(@RequestBody Incident incdt) {
		try {
			incidentService.saveIncident(incdt);
			return new ResponseEntity<Incident>(HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Incident>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PutMapping(value = "/update")
	public ResponseEntity<Incident> updateIncident(@RequestBody Incident incdt) {
		
		Incident updatedIncident = new Incident();
		
		try {
			System.out.println(incdt.getId() + " " + incdt.getStart());
			updatedIncident = incidentService.updateIncident(incdt);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(updatedIncident == null)
			return new ResponseEntity<Incident>(HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<Incident>(updatedIncident, HttpStatus.OK);
	}
	
	@GetMapping(value = "/list")
	public ResponseEntity<List<Incident>> listIncidents(@RequestParam("id") String id) {
		
		List<Incident> incidents;
		
		if(!id.equals("")) {
			incidents = incidentService.getIncidents(id);
		} else {
			incidents = incidentService.getIncidents();
		}
		
		if(incidents == null) {
			return new ResponseEntity<List<Incident>>( HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<List<Incident>>(incidents, HttpStatus.OK);
	}
}
