package com.paymentbillsystem.model;

public class Course {
	private String courseString;
	private String feesString;
	public String getCourseString() {
		return courseString;
	}
	public void setCourseString(String courseString) {
		this.courseString = courseString;
	}
	public String getFeesString() {
		return feesString;
	}
	public void setFeesString(String feesString) {
		this.feesString = feesString;
	}
	public Course(String courseString, String feesString) {
		super();
		this.courseString = courseString;
		this.feesString = feesString;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
