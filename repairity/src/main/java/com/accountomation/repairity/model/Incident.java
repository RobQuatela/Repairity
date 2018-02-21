package com.accountomation.repairity.model;

import java.sql.Date;

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getStop() {
		return stop;
	}

	public void setStop(Date stop) {
		this.stop = stop;
	}

	public String getCustomer() {
		return customer;
	}

	public void setCustomer(String customer) {
		this.customer = customer;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getComplaint() {
		return complaint;
	}

	public void setComplaint(String complaint) {
		this.complaint = complaint;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	
}
