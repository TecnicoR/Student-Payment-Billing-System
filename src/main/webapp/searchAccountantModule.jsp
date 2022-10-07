<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>

	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Search Accountant Menu</h3>
			</center>
			<hr />
			<form action="getaccountantbyusername">
				<label for="find">Find:</label><input type="text" id="find"
					name="username" placeholder="Enter accountant username to find" />
				<input type="submit" value="Search" /> <a
					style="margin: 6px 2px -2px 2px; border: 2px solid blue; padding: 6px; border-radius: 10px; text-decoration: none; font-size: 18px;"
					href="newAccountant.jsp">Create New Accountant</a> <a
					style="margin: 6px 2px -2px 2px; border: 2px solid blue; padding: 6px; border-radius: 10px; text-decoration: none; font-size: 18px;"
					href="showallaccountants.jsp">Show All Accountants</a>
					 <a
					style="margin: 6px 2px -2px 2px; border: 2px solid blue; padding: 6px; border-radius: 10px; text-decoration: none; font-size: 18px;"
					href="showallcourses.jsp">Show All Courses</a>
			</form>

		</div>
	</div>
</body>
</html>