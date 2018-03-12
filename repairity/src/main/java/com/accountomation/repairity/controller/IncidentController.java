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
	public String updateIncident(@RequestParam("invoiceNo") String invoice, Model model) {
		Incident incident = incidentService.getIncident(invoice);
		model.addAttribute("incident", incident);
		return "/IncidentViews/newIncident";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Incident getIncident(@PathVariable("id") String invoiceNo) {
		System.out.println("Request invoice no: " + invoiceNo);
		Incident incident = incidentService.getIncident(invoiceNo);
		return incident;
	}
}
