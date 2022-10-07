package com.paymentbillsystem.model;

public class Accountant {
	private String branch;
	private String username;
	private String password;
	private String dateOfJoining;
	private String dateOfBirth;
	private String salary;
	
	
	@Override
	public String toString() {
		return "Accountant [branch=" + branch + ", username=" + username + ", password=" + password + ", dateOfJoining="
				+ dateOfJoining + ", dateOfBirth=" + dateOfBirth + ", salary=" + salary + "]";
	}
	public Accountant() {
		super();
	}
	public Accountant(String branch, String username, String password, String dateOfJoining, String dateOfBirth,
			String salary) {
		super();
		this.branch = branch;
		this.username = username;
		this.password = password;
		this.dateOfJoining = dateOfJoining;
		this.dateOfBirth = dateOfBirth;
		this.salary = salary;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	
}
