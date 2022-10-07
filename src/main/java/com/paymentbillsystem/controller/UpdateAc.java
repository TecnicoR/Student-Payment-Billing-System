package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.NewAccountantDao;
import com.paymentbillsystem.model.Accountant;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateaccountant")

public class UpdateAc extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String branch = request.getParameter("branch");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String doj = request.getParameter("doj");
		String dob = request.getParameter("dob");
		String salary = request.getParameter("salary");
		
		Accountant accountant = new Accountant();
		
		accountant.setBranch(branch);
		accountant.setUsername(username);
		accountant.setPassword(password);
		accountant.setDateOfJoining(doj);
		accountant.setDateOfBirth(dob);
		accountant.setSalary(salary);
		
		NewAccountantDao accountantDao = new NewAccountantDao();
		accountantDao.updateAccountant(accountant);
		HttpSession session = request.getSession();
		session.setAttribute("updateaccountant", "Accountant Succesfully Updated");
		response.sendRedirect("accountantModifyShowAll.jsp");
	}
}
