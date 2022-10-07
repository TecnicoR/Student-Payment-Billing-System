package com.paymentbillsystem.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.paymentbillsystem.dao.FeesDao;
import com.paymentbillsystem.dao.NewStudentDao;
import com.paymentbillsystem.model.Student;

/**
 * Servlet implementation class NewStudentRegisterServlet
 */
@WebServlet("/registernewstudent")
public class NewStudentRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private FeesDao feesDao = new FeesDao();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String course = request.getParameter("course");
		String mobile = request.getParameter("mobile");
		String fathersName = request.getParameter("fname");
		String mothersName = request.getParameter("mname");
		String dateOfBirth = request.getParameter("dob");
		String dateOfJoining = request.getParameter("doj");
		String paid = String.valueOf(0);
		String fee = feesDao.getCourseFee(course);
		String balance = null;
		if(fee!=null && paid !=null)
		balance = String.valueOf(Integer.parseInt(fee)- Integer.parseInt(paid));
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
		
//		System.out.println(s);
		HttpSession session = request.getSession();
		NewStudentDao newStudentDao = new NewStudentDao();
		if(newStudentDao.selectStudent(id)!=null) {
			session.setAttribute("idAvail", "yes");
			session.setAttribute("erStuData",s);
			response.sendRedirect("showallstudentser.jsp");
		}
		else {
		newStudentDao.registerStudent(s);
		
		session.setAttribute("newstudent", "New Student Details Succesfully Saved");
		response.sendRedirect("showallstudents.jsp");
		}
	}

}
