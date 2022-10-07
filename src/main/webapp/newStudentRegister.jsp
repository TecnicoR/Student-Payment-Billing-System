<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Add New Student Details</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>

<body>
	<% response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
      response.setHeader("Pragma","no-cache"); //HTTP 1.0 response.setHeader("Expires","0"); //proxy
      if(session.getAttribute("Ausername")==null){ response.sendRedirect("index.jsp"); } %>
	<%@include file="/header.jsp"%>
	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Register New Student</h3>
			</center>
			<hr />
			<form action="registernewstudent" method="post">
				<label for="id">ID: </label><input type="text" name="id" id="id"
					placeholder="Id" required autofocus /> <label for="name">Name:
				</label><input type="text" id="name" name="name" required placeholder="Name" />
				<label for="course">Course:</label><input type="text" id="course"
					name="course" required placeholder="Course" /> <label for="mobile">Mobile:</label><input
					type="text" id="mobile" name="mobile" required placeholder="Mobile" />
				<label for="fname">Father's Name:</label><input type="text"
					id="fname" name="fname" required placeholder="Father's Name" /> <label
					for="mname">Mother's Name:</label><input type="text" id="mname"
					name="mname" required placeholder="Mother's Name" /> <label
					for="dob">Date of Birth:</label><input type="date" id="dob"
					name="dob" required placeholder="Date of Birth" /> <label
					for="doj">Date of Join:</label><input type="date" id="doj"
					name="doj" required placeholder="Date of Joining" /> <label
					for="address">Address:</label><input type="text" id="address"
					name="address" required placeholder="Address" /> <input
					type="submit" id="" value="Save" />
			</form>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>

</html>