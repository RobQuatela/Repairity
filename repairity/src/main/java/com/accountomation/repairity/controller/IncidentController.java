package com.accountomation.repairity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IncidentController {

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
}
