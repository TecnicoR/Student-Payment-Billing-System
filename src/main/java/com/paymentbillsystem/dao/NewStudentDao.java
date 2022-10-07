package com.paymentbillsystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.paymentbillsystem.model.*;

public class NewStudentDao {
    private static final String SELECT_USER_BY_ID = "select * from student where id=?";
    private static final String INSERT_USERS_SQL = "insert into student values(?,?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_ALL_USERS = "select * from student";
    private static final String DELETE_STUDENT_BY_ID = 	"delete from student where id=?";
    private static final String UPDATE_STUDENT_BY_ID = "update student set id=?,name=?,course=?,mobile=?,fathers_name=?,mothers_name=?,date_of_birth=?,date_of_join=?,paid=?,fee=?,balance=?,address=? where id = ?";
    private static final String SELECT_STUDENT = "select * from student where id=? and mobile=?";


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
    
    public Student updateBalance(String amount, String id) {
    	Student student = null;
    	Student selectStudent = selectStudent(id);
    	String balance = selectStudent.getBalance();
    	String paid = selectStudent.getPaid();
    	selectStudent.setBalance(String.valueOf(Integer.parseInt(balance) - Integer.parseInt(amount)));
    	selectStudent.setPaid(String.valueOf(Integer.parseInt(paid) + Integer.parseInt(amount)));
    	updateStudent(selectStudent);
    	student = selectStudent(id);
    	return student;
    }
    
    public Student studentLogin(String id, String mobile) {
    	Student student = null;
    	try (Connection c = getConnection();) {
    		PreparedStatement statement = c.prepareStatement(SELECT_STUDENT);
    		statement.setString(1, id);
    		statement.setString(2, mobile);
    		ResultSet rs = statement.executeQuery();
    		if(rs.next()) {
                String name = rs.getString("name");
                String course = rs.getString("course");
                String fathersName = rs.getString("fathers_name");
                String mothersName = rs.getString("mothers_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String dateOfJoining = rs.getString("date_of_join");
                String paid = rs.getString("paid");
                String fee = rs.getString("fee");
                String balance = rs.getString("balance");
                String address = rs.getString("address");

                student = new Student(id, name, course, mobile, fathersName, mothersName, dateOfBirth, dateOfJoining, paid, fee, balance, address);
    		}
    		
    		
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return student;
    }
    public int registerStudent(com.paymentbillsystem.model.Student s) {

        int result = 0;

        try (Connection c = getConnection();) {

            PreparedStatement p = c.prepareStatement(INSERT_USERS_SQL);
            p.setString(1, s.getId());
            p.setString(2, s.getName());
            p.setString(3, s.getCourse());
            p.setString(4, s.getMobile());
            p.setString(5, s.getFathersName());
            p.setString(6, s.getMothersName());
            p.setString(7, s.getDateOfBirth());
            p.setString(8, s.getDateOfJoining());
            p.setString(9, s.getPaid());
            p.setString(10, s.getFee());
            p.setString(11, s.getBalance());
            p.setString(12, s.getAddress());
       



//            System.out.println(p);
            result = p.executeUpdate();

            p.close();
            c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public int updateStudent(com.paymentbillsystem.model.Student s) {

        int result = 0;

        try (Connection c = getConnection();) {

            PreparedStatement p = c.prepareStatement(UPDATE_STUDENT_BY_ID);
            p.setString(1, s.getId());
            p.setString(2, s.getName());
            p.setString(3, s.getCourse());
            p.setString(4, s.getMobile());
            p.setString(5, s.getFathersName());
            p.setString(6, s.getMothersName());
            p.setString(7, s.getDateOfBirth());
            p.setString(8, s.getDateOfJoining());
            p.setString(9, s.getPaid());
            p.setString(10, s.getFee());
            p.setString(11, s.getBalance());
            p.setString(12, s.getAddress());
            p.setString(13, s.getId());


//            System.out.println(p);
            result = p.executeUpdate();

            p.close();
            c.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    
    public Student selectStudent(String id_) {
        Student student = null;
        try (Connection c = getConnection()) {
            PreparedStatement p = c.prepareStatement(SELECT_USER_BY_ID);
            p.setString(1, id_);
            //			System.out.println(preparedStatement);
            ResultSet rs = p.executeQuery();
            while (rs.next()) {
            	String id = rs.getString("id");
                String name = rs.getString("name");
                String course = rs.getString("course");
                String mobile = rs.getString("mobile");
                String fathersName = rs.getString("fathers_name");
                String mothersName = rs.getString("mothers_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String dateOfJoining = rs.getString("date_of_join");
                String paid = rs.getString("paid");
                String fee = rs.getString("fee");
                String balance = rs.getString("balance");
                String address = rs.getString("address");

                student = new Student(id, name, course, mobile, fathersName, mothersName, dateOfBirth, dateOfJoining, paid, fee, balance, address); 

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }


    public List < Student > selectAllStudents() {


        List < Student > students = new ArrayList <Student> ();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
//            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String course = rs.getString("course");
                String mobile = rs.getString("mobile");
                String fathersName = rs.getString("fathers_name");
                String mothersName = rs.getString("mothers_name");
                String dateOfBirth = rs.getString("date_of_birth");
                String dateOfJoining = rs.getString("date_of_join");
                String paid = rs.getString("paid");
                String fee = rs.getString("fee");
                String balance = rs.getString("balance");
                String address = rs.getString("address");
                students.add(new Student(id, name, course, mobile, fathersName, mothersName, dateOfBirth, dateOfJoining, paid, fee, balance, address) );
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return students;

    }
    public void deleteStudent(String id) {
    	try (Connection c = getConnection();
    			 PreparedStatement p = c.prepareStatement(DELETE_STUDENT_BY_ID)) {
    			p.setString(1, id);
    			 p.executeUpdate();
    	}
    	 catch (Exception e) {
             // TODO: handle exception
         }
    }


}