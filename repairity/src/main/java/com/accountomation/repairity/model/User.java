package com.accountomation.repairity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {

	private String email;
	private String password;
	private UserRole role;
	
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	@Id
	@Column(name = "email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@ManyToOne(targetEntity = UserRole.class)
	@JoinColumn(name = "role", nullable = false,
			foreignKey = @ForeignKey(name = "fk_user_role"))
	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}
	
	
}
