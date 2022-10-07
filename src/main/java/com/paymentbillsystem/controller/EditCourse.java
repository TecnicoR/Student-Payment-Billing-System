package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.FeesDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateCourse")
public class EditCourse extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static FeesDao dao = new FeesDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String courseString = req.getParameter("course");
		String feeString = req.getParameter("fees");
		System.out.println(courseString);
		System.out.println(feeString);
		dao.updateCourse(courseString, feeString);
		resp.sendRedirect("coursesModifyShowAll.jsp");
		
	}

}
