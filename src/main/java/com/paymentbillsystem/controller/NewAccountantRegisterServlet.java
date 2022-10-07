package com.paymentbillsystem.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.paymentbillsystem.dao.GetAccountantDao;
import com.paymentbillsystem.dao.NewAccountantDao;
import com.paymentbillsystem.model.Accountant;
@WebServlet("/registernewaccountant")
public class NewAccountantRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		HttpSession session = request.getSession();
		NewAccountantDao accountantDao = new NewAccountantDao();
		if(new GetAccountantDao().selectAccountant(username)!=null) {
			session.setAttribute("idAvail", "yes");
			session.setAttribute("erAcData",accountant);
			response.sendRedirect("showallaccountantser.jsp");
		}
		else {
		accountantDao.registerAccountant(accountant);
		
		session.setAttribute("newaccountant", "New Accountant Succesfully Registered");
		response.sendRedirect("showallaccountants.jsp");
		}
	}

}
