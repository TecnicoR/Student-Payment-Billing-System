<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Student Details</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%
response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setHeader("Expires","0"); //proxy


if(session.getAttribute("Ausername")==null){
	response.sendRedirect("accountantLogin.jsp");
}
if(String.valueOf(session.getAttribute("isAccountant")).equals("no")){
	response.sendRedirect("accountantLogin.jsp");
}

%>
	<%@include file="/header.jsp"%>
	<%
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
	<%@include file="/footer.jsp"%>
</body>
</html>