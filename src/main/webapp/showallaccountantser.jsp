<%@page
	import="java.sql.*,java.util.List,com.paymentbillsystem.model.*,com.paymentbillsystem.dao.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
		
		if(String.valueOf(session.getAttribute("isadmin")).equals("no")){
			response.sendRedirect("adminLogin.jsp");
		}
		Accountant a = (Accountant)session.getAttribute("erAcData");
		
		
	%>

	<%@include file="/header.jsp"%>
	<%
if(session.getAttribute("idAvail")!=null){
	out.print("<br>");
	out.print("<center><font size='4' color='red'>");
	out.print("User is Already Available Try with Another Username --- <a href='getaccountantbyusername?username="+a.getUsername()+"'>View Details of UserName["+a.getUsername()+"]</a>");
	out.print("</font></center>");
	session.removeAttribute("idAvail");
}
%>
	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Update Accountant</h3>
			</center>
			<hr />
			<form action="registernewaccountant" method="post">
				<label for="branch">Branch: </label><input type="text" name="branch"
					id="branch" value="<%=a.getBranch()%>" required autofocus
					placeholder="Branch" /> <label for="username">UserName: </label><input
					type="text" name="username" id="username"
					value="<%=a.getUsername()%>" placeholder="Username" required /> <label
					for="password">Password: </label><input type="text" name="password"
					id="password" value="<%=a.getPassword()%>" required
					placeholder="Password" /> <label for="doj">Date of Joining:
				</label><input type="date" name="doj" value="<%=a.getDateOfJoining()%>"
					id="doj" required placeholder="Date of Join" /> <label for="dob">Date
					of Birth: </label><input type="date" name="dob"
					value="<%=a.getDateOfBirth()%>" id="dob" required
					placeholder="Date of Birth" /> <label for="salary">Salary</label><input
					type="text" name="salary" id="salary" value="<%=a.getSalary()%>"
					required placeholder="Salary" /> <input type="submit" name="" id=""
					value="Create">
			</form>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>

</html>