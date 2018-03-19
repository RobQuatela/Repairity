package com.accountomation.repairity.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbincident")
public class Incident {

	private String id;
	private String status;
	private Date start;
	private Date stop;
	private String customer;
	private String address;
	private String city;
	private String state;
	private String zip;
	private String complaint;
	private String phone;
	private double amount;
	
	public Incident() {
		
	}

	public Incident(String id, String status, Date start, Date stop, String customer, String address, String city,
			String state, String zip, String complaint, String phone, double amount) {
		super();
		this.id = id;
		this.status = status;
		this.start = start;
		this.stop = stop;
		this.customer = customer;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.complaint = complaint;
		this.phone = phone;
		this.amount = amount;
	}

	@Id
	@Column(name = "incident_id")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "incident_status")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "incident_start")
	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	@Column(name = "incident_stop")
	public Date getStop() {
		return stop;
	}

	public void setStop(Date stop) {
		this.stop = stop;
	}

	@Column(name = "incident_customer")
	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	@Column(name = "incident_address")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "incident_city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "incident_state")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "incident_zip")
	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	@Column(name = "incident_complaint")
	public String getComplaint() {
		return complaint;
	}

	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}

	@Column(name = "incident_phone")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "incident_amount")
	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
}
