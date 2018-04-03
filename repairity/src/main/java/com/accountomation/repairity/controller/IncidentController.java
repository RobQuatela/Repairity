package com.accountomation.repairity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.service.IncidentService;

@Controller
@RequestMapping(value = "/incident")
public class IncidentController {

	@Autowired
	private IncidentService incidentService;
	
/*	@RequestMapping("/index")
	public String showHomePage() {
		return "/IncidentViews/index";
	}*/
	
	@RequestMapping(value = "/")
	public String vewIncident(Model model) {
		//return "/IncidentViews/indexIncident";
		return "/IncidentViews/indexIncident";
	}
	
	/*@RequestMapping("/assign")
	public String assignEmployees(Model model) {
		return "/IncidentViews/assignEmployees";
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
		
		incidentService.saveIncident(incident);
		model.addAttribute("incident", incident);
		
		return "redirect:/incident/showIncident";
	}
	
	@RequestMapping("/list")
	public String listIncidents(Model model) {
		List<Incident> incidents = incidentService.getIncidents();
		model.addAttribute("incidents", incidents);
		return "/IncidentViews/listIncidents";
	}
	
	@GetMapping("/edit")
	public String updateIncident(@RequestParam("id") String id, Model model) {
		Incident incident = incidentService.getIncident(id);
		model.addAttribute("incident", incident);
		System.out.println("Incident no: " + incident.getId());
		return "/IncidentViews/editIncident";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Incident getIncident(@PathVariable("id") String invoiceNo) {
		Incident incident = incidentService.getIncident(invoiceNo);
		System.out.println("Request invocie no: " + incident.getId());
		return incident;
	}*/
}
