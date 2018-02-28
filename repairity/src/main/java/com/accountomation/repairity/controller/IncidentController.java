package com.accountomation.repairity.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.service.CompanyService;

@Controller
@RequestMapping(value = "/incident")
public class IncidentController {

	@Autowired
	private CompanyService companyService;
	
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
	
	@PostMapping("/addCompany")
	public String saveCompany(@ModelAttribute("company") @Valid Company company,
			BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			
		}
		
		companyService.saveCompany(company);
		
		return "redirect:/";
	}
}
