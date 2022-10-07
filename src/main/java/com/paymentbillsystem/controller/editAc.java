package com.paymentbillsystem.controller;

import java.io.IOException;

import com.paymentbillsystem.dao.GetAccountantDao;
import com.paymentbillsystem.model.Accountant;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/edita")
public class editAc extends HttpServlet{
	private static final long serialVersionUID = 1L;
 
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String userid = request.getParameter("username");
		HttpSession session =  request.getSession();
		Accountant a = new GetAccountantDao().selectAccountant(userid);
		session.setAttribute("uidforedit", a);
		response.sendRedirect("editForAc.jsp");
	}
}
