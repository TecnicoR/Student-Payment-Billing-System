package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.NewStudentDao;
import com.paymentbillsystem.model.Student;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/editst")
public class editSt extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		HttpSession session =  request.getSession();
		Student s = new NewStudentDao().selectStudent(id);
		session.setAttribute("uidforeditstudent", s);
		response.sendRedirect("editForSt.jsp");
	}
}
