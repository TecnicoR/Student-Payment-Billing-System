package com.paymentbillsystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.paymentbillsystem.model.Accountant;

public class GetAccountantDao {
	
	private static final String SELECT_ALL_USERS = "select * from accountant";
	private static final String SELECT_ACCOUNTANT_BY_USERNAME = "select * from accountant where username=?";
	private static final String UPDATE_ACCOUNTANT_BY_USERNAME = "update accountant set branch = ?, username=?, password=?, date_of_joining = ?, date_of_birth =?, salary=? where username=?";
	private static final String DELETE_ACCOUNTANT_BY_ID = 	"delete from accountant where username=?";
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
	
	
	public boolean updateAccountant(Accountant a) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_ACCOUNTANT_BY_USERNAME);) {
            statement.setString(1, a.getBranch());
            statement.setString(2, a.getUsername());
            statement.setString(3, a.getPassword());
            statement.setString(4, a.getDateOfJoining());
            statement.setString(5, a.getDateOfBirth());
            statement.setString(6, a.getSalary());
            
            
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
	
	public boolean MatchAccountant(Accountant a) {
		String query = "select * from accountant";
		 try (Connection c = getConnection();){ 
			Statement statement = c.createStatement();
			ResultSet rSet = statement.executeQuery(query);
			while(rSet.next()) {
				if(a.getUsername().equals(rSet.getString("username")) && a.getPassword().equals(rSet.getString("password"))) {
					return true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public List < Accountant > selectAllAccountants() {
		List < Accountant > accountants = new ArrayList <Accountant> (); 
		try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			 ResultSet rs = preparedStatement.executeQuery();
			 while (rs.next()) {
				 String branch  = rs.getString("branch");
				 String username  = rs.getString("username");
				 String password  = rs.getString("password");
				 String doj = rs.getString("date_of_joining");
				 String dob = rs.getString("date_of_birth");
				 String salary = rs.getString("salary");
				 accountants.add(new Accountant(branch, username, password, doj, dob, salary));
			 }
			 }
		 catch (Exception e) {
			// TODO: handle exception
		}
		return accountants;
	}
	
	public Accountant selectAccountant(String username) {
        Accountant accountant=null;
        try (Connection c = getConnection()) {
            PreparedStatement p = c.prepareStatement(SELECT_ACCOUNTANT_BY_USERNAME);
            p.setString(1, username);
//            System.out.println(preparedStatement);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
            	String branch  = rs.getString("branch");
				 String uname  = rs.getString("username");
				 String password  = rs.getString("password");
				 String doj = rs.getString("date_of_joining");
				 String dob = rs.getString("date_of_birth");
				 String salary = rs.getString("salary");
				 accountant = new Accountant(branch, uname, password, doj, dob, salary);
				 System.out.println(accountant);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accountant;
    }
	
	 public void deleteAccountant(String username) {
	    	try (Connection c = getConnection();
	    			 PreparedStatement p = c.prepareStatement(DELETE_ACCOUNTANT_BY_ID)) {
	    			 p.setString(1, username);
	    			 p.executeUpdate();
	    	}
	    	 catch (Exception e) {
	             // TODO: handle exception
	         }
	    }
}
