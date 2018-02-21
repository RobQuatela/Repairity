package com.accountomation.repairity.model;

import java.sql.Date;

public class IncidentLog {

	private Long id;
	private Date logDate;
	private String notes;
	private Incident incident;
	
	public IncidentLog() {
		
	}

	public IncidentLog(Long id, Date logDate, String notes, Incident incident) {
		super();
		this.id = id;
		this.logDate = logDate;
		this.notes = notes;
		this.incident = incident;
	}

	public IncidentLog(Date logDate, String notes, Incident incident) {
		super();
		this.logDate = logDate;
		this.notes = notes;
		this.incident = incident;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
