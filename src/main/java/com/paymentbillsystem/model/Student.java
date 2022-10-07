package com.paymentbillsystem.model;

public class Student{
	private String id;
	private String name;
	private String course;
	private String mobile;
	private String fathersName;
	private String mothersName;
	private String dateOfBirth;
	private String dateOfJoining;
	private String paid;
	private String fee;
	private String balance;
	private String address;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getFathersName() {
		return fathersName;
	}
	public void setFathersName(String fathersName) {
		this.fathersName = fathersName;
	}
	public String getMothersName() {
		return mothersName;
	}
	public void setMothersName(String mothersName) {
		this.mothersName = mothersName;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getDateOfJoining() {
		return dateOfJoining;
	}
	public void setDateOfJoining(String dateOfJoining) {
		this.dateOfJoining = dateOfJoining;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public String getFee() {
		return fee;
	}
	public void setFee(String fee) {
		this.fee = fee;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Student(String id, String name, String course, String mobile, String fathersName, String mothersName,
			String dateOfBirth, String dateOfJoining, String paid, String fee, String balance, String address) {
		super();
		this.id = id;
		this.name = name;
		this.course = course;
		this.mobile = mobile;
		this.fathersName = fathersName;
		this.mothersName = mothersName;
		this.dateOfBirth = dateOfBirth;
		this.dateOfJoining = dateOfJoining;
		this.paid = paid;
		this.fee = fee;
		this.balance = balance;
		this.address = address;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", course=" + course + ", mobile=" + mobile + ", fathersName="
				+ fathersName + ", mothersName=" + mothersName + ", dateOfBirth=" + dateOfBirth + ", dateOfJoining="
				+ dateOfJoining + ", paid=" + paid + ", fee=" + fee + ", balance=" + balance + ", address=" + address
				+ "]";
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
		
	
	
}