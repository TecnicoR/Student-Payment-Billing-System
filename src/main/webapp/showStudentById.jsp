<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show All Student Details</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="stylesheet" href="resulttablestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%
response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setHeader("Expires","0"); //proxy
if(session.getAttribute("Ausername")==null){
	response.sendRedirect("index.jsp");
}
%>
	<%@include file="/header.jsp"%>

	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Search Through Student ID</h3>
			</center>
			<hr />
			<form action="findstudent" method="post">
				<label for="find">Find</label><input type="text" id="find"
					placeholder="enter student id to search" name="find" /> <input
					type="submit" value="Search" /> <a
					style="margin: 6px auto -2px auto; font-size: 18px;"
					href="showallstudents.jsp">View All Students</a>
			</form>
		</div>
	</div>


	<div class="resultBody">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Course</th>
					<th>Mobile</th>
					<th>Father's Name</th>
					<th>Mother's Name</th>

					<th>Date of Birth</th>
					<th>Date of Join</th>

					<th>Paid</th>
					<th>Fee</th>
					<th>Balance</th>
					<th>Address</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<%
                  com.paymentbillsystem.model.Student s = (com.paymentbillsystem.model.Student)session.getAttribute("selectStudent");
        		  out.print("<td>"+ s.getId()+"</td>");
        		  out.print("<td>"+ s.getName()+"</td>");
        		  out.print("<td>"+ s.getCourse()+"</td>");
        		  out.print("<td>"+ s.getMobile()+"</td>");
        		  out.print("<td>"+ s.getFathersName()+"</td>");
        		  out.print("<td>"+ s.getMothersName()+"</td>");
        		  
        		  out.print("<td>"+ s.getDateOfBirth()+"</td>");
        		  out.print("<td>"+ s.getDateOfJoining()+"</td>");
        		  
        		  out.print("<td>"+ s.getPaid()+"</td>");
        		  out.print("<td>"+ s.getFee()+"</td>");
        		  out.print("<td>"+ s.getBalance()+"</td>");
        		  out.print("<td>"+ s.getAddress()+"</td>");
        		  
        		
     
                %>
				</tr>
			</tbody>
		</table>
	</div>

	<%@include file="/footer.jsp"%>
</body>
</html>