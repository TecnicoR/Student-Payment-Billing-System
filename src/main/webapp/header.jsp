<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="headerStyle.css">
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<div class="header">
		<h1>PAYMENT BILLING SYSTEM</h1>
		<%
        response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setHeader("Expires","0"); //proxy
		if(session.getAttribute("Ausername")!=null){
		out.print("<p style='margin: 18px; font-size:18px; color: white; border:2px solid #EEEEEE; padding: 6px; border-radius:6px;'> <b><i>");
		out.print(session.getAttribute("Ausername"));
		out.print("</b></i> &nbsp;Logged in</p>");
		out.print(" <form action='logoutaction'>");
		out.print("<input type='submit' value='Logout'>");
		out.print("</form>");
		}
		%>
	</div>
	<div class="img-container"></div>
	<div class="menu">
		<ul>
			<li><a href="accountantLogin.jsp">ACCOUNTANT</a></li>
			<li><a href="studentLogin.jsp">STUDENT</a></li>
			<%
			if(String.valueOf(session.getAttribute("isAccountant")).equals("yes") || String.valueOf(session.getAttribute("isadmin")).equals("yes")){
				out.print("<li><a href='newStudentRegister.jsp'>NEW STUDENT REGISTRATION</a></li>");
				out.print("<li><a href='modifyLanding.jsp'>MODIFY DETAIL</a></li>");
			}
			%>
			<li><a href="adminLogin.jsp">ADMINISTRATOR</a></li>
			<%
			if(String.valueOf(session.getAttribute("isadmin")).equals("yes")){
				out.print("<li><a href='newCourse.jsp'>CREATE COURSE</a></li>");
			}
			%>
			<li><a href="contactUs.jsp">CONTACT US</a></li>
		</ul>
	</div>
</body>
</html>