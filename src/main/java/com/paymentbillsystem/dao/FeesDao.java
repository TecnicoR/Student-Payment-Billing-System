package com.paymentbillsystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.paymentbillsystem.model.Course;

public class FeesDao {
	private static final String GET_FEE = "select fee from feeTable where course=?";
	private static final String CREATE_COURSE = "insert into feeTable values(?,?)";
	private static final String GET_ALL_COURSES = "select * from feeTable";
	private static final String UPDATE_COURSE = "update feeTable set fee=? where course=?";
	private static final String DELETE_COURSE = "delete from feeTable where course = ?";
	 Connection getConnection() {
	        Connection c = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/PaymentBillSystem", "root", "system");
	        } catch (Exception e) {
	            // TODO: handle exception
	        }

	        return c;
	    }
	 
	 public String getCourseFee(String course) {
		 String feeString = null;
		 try (Connection c = getConnection()) {
			 PreparedStatement statement = c.prepareStatement(GET_FEE);
			 statement.setString(1, course);
			 ResultSet resultset = statement.executeQuery();
			 if(resultset.next()) {
				 feeString = resultset.getString("fee");
			 }
		 }
		 catch (Exception e) {
			e.printStackTrace();
		}
		return feeString;
	 }
	 public int saveCourse(String course, String fees) {
		 int result = 0;
		 try(Connection c = getConnection()) {
			PreparedStatement statement = c.prepareStatement(CREATE_COURSE);
			statement.setString(1, course);
			statement.setString(2, fees);
			result =  statement.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	 }
	 
	 public List<Course> getAllCourses(){
		 List<Course> courses = new ArrayList<Course>();
		 try(Connection c = getConnection()) {
			 PreparedStatement statement = c.prepareStatement(GET_ALL_COURSES);
			 ResultSet executeQuery = statement.executeQuery();
			 while(executeQuery.next()) {
				 courses.add(new Course(executeQuery.getString("course"),executeQuery.getString("fee")));
			 }
		 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		 return courses;
	 }
	 
	 public void updateCourse(String courseString,String feeString) {
		 try(Connection c = getConnection()) {
			 PreparedStatement statement = c.prepareStatement(UPDATE_COURSE);
			 statement.setString(1, feeString);
			 statement.setString(2, courseString);
			 boolean is = statement.executeUpdate()>0;
			 System.out.println(is);
		 }
		 catch (Exception e) {
			e.printStackTrace();
		}
	 }
	 public void deleteCourse(String courString) {
		 try(Connection c = getConnection()) {
			 PreparedStatement statement = c.prepareStatement(DELETE_COURSE);
			 statement.setString(1, courString);
			 statement.executeUpdate();
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}
