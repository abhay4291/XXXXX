package com.synechron.proc.boot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="userregistration")
public class UserRegistration 
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String UserName;
	private String Password;
	private String RePassword;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getRePassword() {
		return RePassword;
	}
	public void setRePassword(String rePassword) {
		RePassword = rePassword;
	}
	@Override
	public String toString() {
		return "UserRegistration [id=" + id + ", UserName=" + UserName + ", Password=" + Password + ", RePassword="
				+ RePassword + "]";
	}
	
	
	
}
