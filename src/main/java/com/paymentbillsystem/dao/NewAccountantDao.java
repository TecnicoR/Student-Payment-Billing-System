package com.paymentbillsystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.paymentbillsystem.model.Accountant;

public class NewAccountantDao {
	public int registerAccountant(Accountant a) {
		String query = "insert into accountant values(?,?,?,?,?,?)";
		int result = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/PaymentBillSystem","root","system");
			PreparedStatement p = c.prepareStatement(query);
			p.setString(1,a.getBranch());
			p.setString(2,a.getUsername());
			p.setString(3,a.getPassword());
			p.setString(4,a.getDateOfJoining());
			p.setString(5,a.getDateOfBirth());
			p.setString(6,a.getSalary());
			
			
//			System.out.println(p);
			result = p.executeUpdate();
			
			p.close();
			c.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException c) {
			c.printStackTrace();
		}

		return result;
	}
	public int updateAccountant(Accountant a) {
		String query = "update accountant set branch = ?, username=?, password=?, date_of_joining = ?, date_of_birth =?, salary=? where username=?";
		int result = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/PaymentBillSystem","root","system");
			PreparedStatement p = c.prepareStatement(query);
			p.setString(1,a.getBranch());
			p.setString(2,a.getUsername());
			p.setString(3,a.getPassword());
			p.setString(4,a.getDateOfJoining());
			p.setString(5,a.getDateOfBirth());
			p.setString(6,a.getSalary());
			p.setString(7,a.getUsername());
			
//			System.out.println(p);
			result = p.executeUpdate();
			
			p.close();
			c.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException c) {
			c.printStackTrace();
		}

		return result;
	}
}
