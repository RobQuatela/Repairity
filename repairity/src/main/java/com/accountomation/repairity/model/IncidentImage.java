package com.accountomation.repairity.model;

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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Incident getIncident() {
		return incident;
	}

	public void setIncident(Incident incident) {
		this.incident = incident;
	}
	
	
}
