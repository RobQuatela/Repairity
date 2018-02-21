package com.accountomation.repairity.model;

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
@Table(name = "incidentimage")
public class IncidentImage {

	private Long id;
	private String imageUrl;
	private Incident incident;
	
	public IncidentImage() {
		
	}

	public IncidentImage(Long id, String imageUrl, Incident incident) {
		super();
		this.id = id;
		this.imageUrl = imageUrl;
		this.incident = incident;
	}

	public IncidentImage(String imageUrl, Incident incident) {
		super();
		this.imageUrl = imageUrl;
		this.incident = incident;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "iiid")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "iiimageurl")
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@ManyToOne(targetEntity = Incident.class)
	@JoinColumn(name = "incident", nullable = false,
		foreignKey = @ForeignKey(name = "fk_incidentimage_incident"))
	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
