package com.paymentbillsystem.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class LogoutActionForAll
 */
@WebServlet("/logoutaction")
public class LogoutActionForAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.removeAttribute("Ausername");
		session.removeAttribute("username");
		session.removeAttribute("newlog");
		session.removeAttribute("islogin");
		session.invalidate();
		response.sendRedirect("studentLogin.jsp");
	}

}
