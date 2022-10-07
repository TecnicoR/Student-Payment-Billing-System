package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.NewStudentDao;
import com.paymentbillsystem.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/updatestudent")
public class UpdateSt extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String mobile = request.getParameter("mobile");
		String fathersName = request.getParameter("fname");
		String mothersName = request.getParameter("mname");
		
		String dateOfBirth = request.getParameter("dob");
		String dateOfJoining = request.getParameter("doj");
		
		String paid = request.getParameter("paid");
		String fee = request.getParameter("fee");
		String balance = request.getParameter("balance");
		String address = request.getParameter("address");
	
		
		
		Student s = new Student();
		
		s.setId(id);
		s.setName(name);
		s.setCourse(course);
		s.setMobile(mobile);
		s.setFathersName(fathersName);
		s.setMothersName(mothersName);
		
		s.setDateOfBirth(dateOfBirth);
		s.setDateOfJoining(dateOfJoining);
		
		s.setPaid(paid);
		s.setFee(fee);
		s.setBalance(balance);
		s.setAddress(address);
		

		NewStudentDao newStudentDao = new NewStudentDao();
		newStudentDao.updateStudent(s);
		HttpSession session = request.getSession();
		session.setAttribute("updatestudenttext", "Student Details Succesfully Updated");
		response.sendRedirect("studentModifyShowAll.jsp");
	}
}
