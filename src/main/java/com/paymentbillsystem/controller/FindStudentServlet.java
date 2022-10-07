package com.paymentbillsystem.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.paymentbillsystem.dao.NewStudentDao;
import com.paymentbillsystem.model.Student;
@WebServlet("/findstudent")
public class FindStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NewStudentDao newStudentDao = new NewStudentDao();
		String idString = request.getParameter("find");
		HttpSession session = request.getSession();
		Student student = newStudentDao.selectStudent(idString);
//		System.out.println(student);
		if(student==null) {
			session.setAttribute("notfoundmsg", "Data not Found in the Database");
			response.sendRedirect("accountantLanding.jsp");
		}
		else {
			 session.setAttribute("selectStudent", student);
		     response.sendRedirect("showStudentById.jsp");
		}
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
