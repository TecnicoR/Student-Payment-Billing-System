package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.NewStudentDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet("/deletestudent")
public class DeleteStudent extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
//		System.out.print(id);
		NewStudentDao newstudent = new NewStudentDao();
		newstudent.deleteStudent(id);
		response.sendRedirect("studentModifyShowAll.jsp");
	}
}
