package com.accountomation.repairity.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_role")
public class UserRole implements Serializable {

	private User user;
	private String role;
	
	public UserRole(User user, String role) {
		this.user = user;
		this.role = role;
	}

	@Id
	@OneToOne
	@JoinColumn(name = "role_user", nullable = false,
		foreignKey = @ForeignKey(name = "fk_user_role_user"))
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "role_role")
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
}
