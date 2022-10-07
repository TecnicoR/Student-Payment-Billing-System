package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.FeesDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/createcourse")
public class CreateCourse extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private static FeesDao dao = new FeesDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String course = req.getParameter("course");
		String fees = req.getParameter("fees");
		dao.saveCourse(course, fees);
		HttpSession session = req.getSession();
		session.setAttribute("feesAdded", "New Course Successfully Added");
		resp.sendRedirect("newCourse.jsp");
	}
}
