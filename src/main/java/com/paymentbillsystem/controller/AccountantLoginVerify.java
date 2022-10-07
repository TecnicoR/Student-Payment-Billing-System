package com.paymentbillsystem.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.paymentbillsystem.dao.GetAccountantDao;
import com.paymentbillsystem.model.Accountant;

@WebServlet("/accountantloginverify")
public class AccountantLoginVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String pass = request.getParameter("password");
		
		Accountant accountant = new Accountant();
		accountant.setUsername(userid);
		accountant.setPassword(pass);
		
		GetAccountantDao getAccountantDao = new GetAccountantDao();
		HttpSession session = request.getSession();
		
		if(getAccountantDao.MatchAccountant(accountant)) {
			session.setAttribute("Ausername", userid);
			session.setAttribute("isadmin", "no");
			session.setAttribute("isAccountant", "yes");
			session.removeAttribute("Error");
			session.setAttribute("newlog", "yes");
			response.sendRedirect("accountantLanding.jsp");
		}
		else {
			session.setAttribute("Error","Sorry! Username or Password Error. Plz Enter Correct Detail ");
			response.sendRedirect("index.jsp");
		}
	}

}
