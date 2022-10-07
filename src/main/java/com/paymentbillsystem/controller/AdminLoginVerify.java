package com.paymentbillsystem.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.paymentbillsystem.dao.AdminDao;
import com.paymentbillsystem.model.Admin;


@WebServlet("/adminloginverify")
public class AdminLoginVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		AdminDao ad = new AdminDao();
		Admin a = ad.getAdminCredentials();
		
		HttpSession session = request.getSession();
		if(username.equals(a.getUsername()) && password.equals(a.getPassword())) {
			session.setAttribute("Ausername", username);
			session.setAttribute("isadmin", "yes");
			session.setAttribute("newlog", "yes");
			session.setAttribute("isAccountant", "no");
			response.sendRedirect("adminHomePage.jsp");
			
		}
		else {
			session.setAttribute("Error","Sorry! Username or Password Error. Plz Enter Correct Detail ");
			response.sendRedirect("adminLogin.jsp");
		}
	}

}
