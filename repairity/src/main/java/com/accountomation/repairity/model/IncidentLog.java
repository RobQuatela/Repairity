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
@Table(name = "incidentlog")
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

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ilid")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "ildate")
	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	@Column(name = "ilnotes")
	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@ManyToOne(targetEntity = Incident.class)
	@JoinColumn(name = "incident", nullable = false,
		foreignKey = @ForeignKey(name = "fk_incidentlog_incident"))
	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
