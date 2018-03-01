package com.accountomation.repairity.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.service.IncidentService;

@Controller
@RequestMapping(value = "/incident")
public class IncidentController {

	@Autowired
	private IncidentService incidentService;
	
	@RequestMapping("/")
	public String showHomePage() {
		return "index";
	}
	
	@RequestMapping("/new")
	public String newIncident() {
		return "newIncident";
	}
	
	@RequestMapping("/showIncident")
	public String showIncident() {
		return "showIncident";
	}
	
	@RequestMapping(value = "/addIncident", method = RequestMethod.POST)
	public String saveIncident(Model model, HttpServletRequest request) {
		Incident incident = new Incident();
		incident.setId(request.getParameter("txtInvoice"));
		incident.setStatus(request.getParameter("txtStatus"));
		
		incidentService.saveIncident(incident);
		model.addAttribute("incident", incident);
		
		return "showIncident";
	}
}
