package com.accountomation.repairity.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.service.IncidentService;

@Controller
@RequestMapping(value = "/incident")
public class IncidentController {

	@Autowired
	private IncidentService incidentService;
	
	@RequestMapping("/")
	public String showHomePage() {
		return "/IncidentViews/index";
	}
	
	@RequestMapping("/new")
	public String newIncident() {
		return "/IncidentViews/newIncident";
	}
	
	@RequestMapping("/showIncident")
	public String showIncident() {
		return "/IncidentViews/showIncident";
	}
	
	@RequestMapping(value = "/addIncident", method = RequestMethod.POST)
	public String saveIncident(Model model, 
			@RequestParam("txtInvoice") String invoice,
			@RequestParam("txtStatus") String status
			) {
		
		Incident incident = new Incident();

		incident.setId(invoice);
		incident.setStatus(status);
		
		//incidentService.saveIncident(incident);
		model.addAttribute("incident", incident);
		
		return "/IncidentViews/showIncident";
	}
}
