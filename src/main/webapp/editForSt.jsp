<%@page
	import="java.sql.*,java.util.List,com.paymentbillsystem.model.*,com.paymentbillsystem.dao.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Edit Student Details</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>

<body>
	<% response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
        response.setHeader("Pragma","no-cache"); //HTTP 1.0 response.setHeader("Expires","0"); //proxy
        if(session.getAttribute("Ausername")==null){ response.sendRedirect("index.jsp"); } Student
        s=(Student)session.getAttribute("uidforeditstudent"); %>

	<%@include file="/header.jsp"%>
	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Update Student</h3>
			</center>
			<hr />
			<form action="updatestudent" method="post">
				<label for="id">ID: </label><input type="text"
					value="<%=s.getId()%>" name="id" id="id" placeholder="Id" readonly />
				<label for="name">Name: </label><input type="text" id="name"
					name="name" value="<%=s.getName()%>" placeholder="Name" required
					autofocus /> <label for="course">Course:</label><input type="text"
					id="course" name="course" value="<%=s.getCourse()%>" required
					placeholder="Course" /> <label for="mobile">Mobile:</label><input
					type="text" id="mobile" name="mobile" value="<%=s.getMobile()%>"
					required placeholder="Mobile" /> <label for="fname">Father's
					Name:</label><input type="text" id="fname" name="fname"
					value="<%=s.getFathersName()%>" required
					placeholder="Father's Name" /> <label for="mname">Mother's
					Name:</label><input type="text" id="mname" name="mname"
					value="<%=s.getMothersName()%>" required
					placeholder="Mother's Name" /> <label for="dob">Date of
					Birth:</label><input type="date" value="<%=s.getDateOfBirth()%>" id="dob"
					name="dob" required placeholder="Date of Birth" /> <label
					for="doj">Date of Join:</label><input type="date"
					value="<%=s.getDateOfJoining()%>" id="doj" name="doj" required
					placeholder="Date of Joining" /> <label for="paid">Paid:</label><input
					type="text" id="paid" name="paid" required value="<%=s.getPaid()%>"
					placeholder="Paid" /> <label for="fee">Fee:</label><input
					type="text" id="fee" name="fee" required value="<%=s.getFee()%>"
					placeholder="Fee" /> <label for="balance">Balance:</label><input
					type="text" id="balance" name="balance" required
					value="<%=s.getBalance()%>" placeholder="Balance" /> <label
					for="address">Address:</label><input type="text" id="address"
					name="address" required value="<%=s.getAddress()%>"
					placeholder="Address" /> <input type="submit" id="" value="update" />
			</form>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>

</html>