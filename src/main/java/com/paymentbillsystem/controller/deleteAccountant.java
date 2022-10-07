package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.GetAccountantDao;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/delete")
public class deleteAccountant extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String username = request.getParameter("username");
		System.out.print(username);
		GetAccountantDao getaccountantdao = new GetAccountantDao();
		getaccountantdao.deleteAccountant(username);
		response.sendRedirect("accountantModifyShowAll.jsp");
	}	
}
