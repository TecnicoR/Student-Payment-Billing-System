package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.GetAccountantDao;
import com.paymentbillsystem.model.Accountant;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/getaccountantbyusername")
public class SearchAccountant extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uname = request.getParameter("username");
		GetAccountantDao getAccountantDao = new GetAccountantDao();
		Accountant accountant = getAccountantDao.selectAccountant(uname);
		HttpSession session = request.getSession();
		if(accountant==null) {
			session.setAttribute("notfoundmsg", "Data not found in the Database");
			response.sendRedirect("adminHomePage.jsp");
		}
		else {
		session.setAttribute("selectAccountant", accountant);
		response.sendRedirect("showAccountantsByUname.jsp");
		}
	}
}
