<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Accountant</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%@include file="/header.jsp"%>
	<%
		response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setHeader("Expires","0"); //proxy
		if(session.getAttribute("Ausername")==null){
			response.sendRedirect("adminLogin.jsp");
		}
		if(String.valueOf(session.getAttribute("isadmin")).equals("no")){
			response.sendRedirect("adminLogin.jsp");
		}
		if(session.getAttribute("newlog")!=null){
			out.print("<br>");
			out.print("<center><font size='4' color='blue'>");
			out.print("Welcome Back " + session.getAttribute("Ausername"));
			out.print("</font></center>");
			session.removeAttribute("newlog");
		}
		if(session.getAttribute("notfoundmsg")!=null){
			out.print("<br>");
			out.print("<center><font size='4' color='red'>");
			out.print(session.getAttribute("notfoundmsg"));
			out.print("</font></center>");
			session.removeAttribute("notfoundmsg");
		}
	%>

	<%@include file="/searchAccountantModule.jsp"%>


	<%@include file="/footer.jsp"%>
</body>
</html>