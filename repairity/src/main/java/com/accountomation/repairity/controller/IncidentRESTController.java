package com.accountomation.repairity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ResponseEntity<Incident> getIncident(@RequestBody Incident incdt) {
		Incident incident = incidentService.getIncident(incdt.getId());
		System.out.println("Request invocie no: " + incdt.getId());
		
		if(incident == null) {
			return new ResponseEntity(HttpStatus.NOT_FOUND);
		}
		
		return new ResponseEntity<Incident>(incident, HttpStatus.OK);
	}
	
	@PostMapping(value = "/save")
	public void saveIncident(@RequestBody Incident incdt) {
		try {
			incidentService.saveIncident(incdt);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
