<%@ page import="java.sql.*,java.util.List,com.paymentbillsystem.model.*,com.paymentbillsystem.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Accountant Details</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%
		response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setHeader("Expires","0"); //proxy
		if(session.getAttribute("Ausername")==null){
			response.sendRedirect("adminLogin.jsp");
		}
		if(session.getAttribute("isadmin").equals("no")){
			response.sendRedirect("adminLogin.jsp");
		}
		Accountant a = (Accountant)session.getAttribute("uidforedit");
	%>

	<%@include file="/header.jsp"%>

	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Update Accountant</h3>
			</center>
			<hr />
			<form action="updateaccountant" method="post">
				<label for="branch">Branch: </label><input type="text" name="branch"
					id="branch" value="<%=a.getBranch()%>" placeholder="Branch"
					readonly /> <label for="username">UserName: </label><input
					type="text" name="username" id="username"
					value="<%=a.getUsername()%>" placeholder="Username" required
					readonly /> <label for="password">Password: </label><input
					type="text" name="password" id="password"
					value="<%=a.getPassword()%>" autofocus required
					placeholder="Password" /> <label for="doj">Date of Joining:
				</label><input type="date" name="doj" value="<%=a.getDateOfJoining()%>"
					id="doj" required placeholder="Date of Join" /> <label for="dob">Date
					of Birth: </label><input type="date" name="dob"
					value="<%=a.getDateOfBirth()%>" id="dob" required
					placeholder="Date of Birth" /> <label for="salary">Salary</label><input
					type="text" name="salary" id="salary" value="<%=a.getSalary()%>"
					required placeholder="Salary" /> <input type="submit" name="" id=""
					value="Update">
			</form>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>

</html>