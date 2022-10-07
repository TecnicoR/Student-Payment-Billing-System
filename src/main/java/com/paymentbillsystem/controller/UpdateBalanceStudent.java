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

@WebServlet("/updatebalance")
public class UpdateBalanceStudent extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static NewStudentDao dao = 	new NewStudentDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String amountString = req.getParameter("paymentAmount");
		String idString = req.getParameter("id");
		Student selectStudent = dao.selectStudent(idString);
		HttpSession session = req.getSession();
		if(Integer.parseInt(selectStudent.getBalance())<Integer.parseInt(amountString)) {
			session.setAttribute("amountError", "Entered Amount can not be greater than Balance amount which is "+selectStudent.getBalance());
			session.setAttribute("studentInfo", selectStudent);
		}
		else {
			selectStudent = dao.updateBalance(amountString, idString);
			session.setAttribute("studentInfo", selectStudent);
			session.setAttribute("updatebalance", "Congratulations!!! You have succesfully paid " + amountString + " ruppees updated balance shown below");
			
		}
		resp.sendRedirect("studentHome.jsp");
		
	}

}
