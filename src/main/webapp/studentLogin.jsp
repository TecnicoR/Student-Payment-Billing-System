<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%@include file="/header.jsp"%>
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
				<h3>Student Login Form</h3>
			</center>
			<hr />
			<form action="studentloginverify" method="post">


				<!-- this part might be linked to jsp and to database for fetching branches available -->


				<label for="userid">Enter UserName:</label><input type="text"
					id="userid" name="userid" placeholder="roll number" required
					autofocus /> <label for="password">Enter password:</label><input
					type="password" id="password" name="password"
					placeholder="mobile number" required /> <input type="submit"
					value="Login" />
			</form>
		</div>
	</div>

	<!-- login form ends here -->
	<%@include file="/footer.jsp"%>
</body>
</html>