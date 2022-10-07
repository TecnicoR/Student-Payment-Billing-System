<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrator Login</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%
	if(session.getAttribute("Ausername")!=null){
		if(session.getAttribute("isadmin").equals("yes")){
			response.sendRedirect("adminHomePage.jsp");
		}
	}

	%>
	<%@include file="/header.jsp"%>
	<!-- Actual code starts from here -->
	<% 
					if(session.getAttribute("Error")!=null){
					out.print("<br>");
					out.print("<center><font size='4' color='red'>");
					out.print(session.getAttribute("Error"));
					out.print("</font></center>");
					session.removeAttribute("Error");
					}
			%>

	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Admin Login Form</h3>
			</center>
			<hr />
			<form action="adminloginverify" method="post">
				<label for="userid">Enter UserName:</label><input type="text"
					id="userid" placeholder="username" name="username" required
					autofocus /> <label for="password">Enter password:</label><input
					type="password" id="password" placeholder="password" required
					name="password" /> <input type="submit" value="Login" />
			</form>
		</div>
	</div>

	<!-- login form ends here -->
	<%@include file="/footer.jsp"%>
</body>
</html>