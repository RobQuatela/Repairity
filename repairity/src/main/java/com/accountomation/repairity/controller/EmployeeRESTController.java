package com.accountomation.repairity.controller;

import java.util.ArrayList;
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

import com.accountomation.repairity.model.Company;
import com.accountomation.repairity.model.Employee;
import com.accountomation.repairity.model.Incident;
import com.accountomation.repairity.service.EmployeeService;

@RestController
@RequestMapping(value = "/employeeREST")
public class EmployeeRESTController {

	@Autowired
	EmployeeService employeeService;
	
	@GetMapping(value = "/get")
	public ResponseEntity<Employee> getEmployee(@RequestParam("id") String id) {
		Employee emp = employeeService.getEmployee(id);
		
		if(emp == null)
			return new ResponseEntity<Employee>(HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<Employee>(emp, HttpStatus.OK);
	}
	
	@GetMapping(value = "/listByCompany")
	public ResponseEntity<List<Employee>> listEmployeesByCompany() {
		Company co = new Company();
		co.setId("SSB");
		
		List<Employee> emps = employeeService.getEmployees(co);
		System.out.println(emps.size());
		
		if(emps.isEmpty())
			return new ResponseEntity<List<Employee>>(HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<List<Employee>>(emps, HttpStatus.OK);
	}
	
	@GetMapping(value = "/listByIncident")
	public ResponseEntity<List<Employee>> listEmployeesByIncident(@RequestParam("id") String invoice) {
		List<Employee> emps = new ArrayList<>();
		Incident incident = new Incident();
		incident.setId(invoice);
		System.out.println("incident invoice: " + incident.getId());
		emps = employeeService.getEmployeesByIncident(incident);
		System.out.println("Emps for incident: " + incident.getId() + ": " + emps.size());
		
		if(emps.isEmpty())
			return new ResponseEntity<List<Employee>>(HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<List<Employee>>(emps, HttpStatus.OK);
	}
	
	@GetMapping(value = "/list")
	public ResponseEntity<List<Employee>> listEmployees() {
		List<Employee> emps = employeeService.getEmployees();
		
		if(emps.isEmpty())
			return new ResponseEntity<List<Employee>>(HttpStatus.NOT_FOUND);
		
		return new ResponseEntity<List<Employee>>(emps, HttpStatus.OK);
	}
	
	@PutMapping(value = "/update")
	public ResponseEntity<Employee> updateEmployee(@RequestBody Employee employee) {
		Employee empUpdate = new Employee();
		
		try {
			empUpdate = employeeService.updateEmployee(employee);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Employee>(HttpStatus.EXPECTATION_FAILED);
		}
		
		return new ResponseEntity<Employee>(empUpdate, HttpStatus.OK);
	}
	
	@PostMapping(value = "/new")
	public ResponseEntity<Employee> saveEmployee(@RequestBody Employee employee) {
		Employee savedEmployee = new Employee();
		
		try {
			savedEmployee = employeeService.saveEmployee(employee);
			//companyService.addEmployee(company, employee);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Employee>(HttpStatus.EXPECTATION_FAILED);
		}
		
		return new ResponseEntity<Employee>(savedEmployee, HttpStatus.OK);
	}
	
	@GetMapping(value = "/search")
	public ResponseEntity<List<Employee>> searchEmployees(@RequestParam("name") String name) {
		List<Employee> emps = new ArrayList<>();
		System.out.println(name);
		try {
			emps = employeeService.searchEmployees(name);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<Employee>>(HttpStatus.EXPECTATION_FAILED);
		}
		
		return new ResponseEntity<List<Employee>>(emps, HttpStatus.OK);
	}
}
