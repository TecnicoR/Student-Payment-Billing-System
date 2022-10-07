package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.NewStudentDao;
import com.paymentbillsystem.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/studentloginverify")
public class StudentLoginVerify extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private static NewStudentDao dao = new NewStudentDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usernameString = req.getParameter("userid");
		String passwordString = req.getParameter("password");
		Student student = null;
		if((student =  dao.studentLogin(usernameString, passwordString))!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("studentInfo", student);
			session.setAttribute("Ausername", student.getName());
			session.setAttribute("isadmin", "no");
			session.setAttribute("isAccountant", "no");
			session.setAttribute("newlog", "yes");
			resp.sendRedirect("studentHome.jsp");
		}
		else {
			HttpSession session = req.getSession();
			session.setAttribute("Error","Sorry! Username or Password Error. Plz Enter Correct Detail ");
			resp.sendRedirect("studentLogin.jsp");
		}
	}

}

