package com.accountomation.repairity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/employee")
public class EmployeeController {
	
	@RequestMapping(value = "/")
	public String showHomePage() {
		return "/EmployeeViews/index";
	}

}
