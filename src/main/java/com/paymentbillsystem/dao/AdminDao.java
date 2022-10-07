package com.paymentbillsystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.paymentbillsystem.model.Admin;

public class AdminDao {
	public Admin getAdminCredentials() {
		String query = "select * from admin";
		Admin a = new Admin();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/PaymentBillSystem","root","system");
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery(query);
			rs.next();
			a.setUsername(rs.getString("username"));
			a.setPassword(rs.getString("password"));
			
			c.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(ClassNotFoundException c) {
			c.printStackTrace();
		}
		return a;
	}
}
