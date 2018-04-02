package com.accountomation.repairity.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "incident_log")
public class IncidentLog {

	private Long id;
	private Date date;
	private String notes;
	private Incident incident;
	
	public IncidentLog() {
		
	}

	public IncidentLog(Long id, Date date, String notes, Incident incident) {
		super();
		this.id = id;
		this.date = date;
		this.notes = notes;
		this.incident = incident;
	}

	public IncidentLog(Date logDate, String notes, Incident incident) {
		super();
		this.date = logDate;
		this.notes = notes;
		this.incident = incident;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "date")
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name = "notes")
	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@ManyToOne(targetEntity = Incident.class)
	@JoinColumn(name = "incident", nullable = false,
		foreignKey = @ForeignKey(name = "fk_incident_log_incident"))
	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
