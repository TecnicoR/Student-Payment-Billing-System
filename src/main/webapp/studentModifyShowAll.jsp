<%@ page language="java"
	import="java.util.List,com.paymentbillsystem.model.Student,com.paymentbillsystem.dao.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Student Details</title>
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
	<%

if(session.getAttribute("newstudent")!=null){
		out.print("<br>");
		out.print("<center><font size='4' color='blue'>");
		out.print(session.getAttribute("newstudent"));
		out.print("</font></center>");
		session.removeAttribute("newstudent");
		}
if(session.getAttribute("updatestudenttext")!=null){
	out.print("<br>");
	out.print("<center><font size='4' color='blue'>");
	out.print(session.getAttribute("updatestudenttext"));
	out.print("</font></center>");
	session.removeAttribute("updatestudenttext");
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
			<form action="findupdatestudent.jsp" method="post">
				<label for="find">Find</label><input type="text" id="find"
					placeholder="enter student id to search" name="find" /> <input
					type="submit" value="Search" /> <a
					style="margin: 6px auto -2px auto; font-size: 18px;"
					href="showallstudents.jsp">View All Students</a>
			</form>
		</div>
	</div>

	<%
 	NewStudentDao newStudentDao = new NewStudentDao();
 	List<Student> s = newStudentDao.selectAllStudents();
 	if(s.size()>0){
 		out.print("<div class='resultBody'>");
 		out.print("<table>");
 		out.print("<thead>");
 		out.print(" <tr>");
 		out.print("<th>ID</th>");
 		out.print("<th>Name</th>");
 		out.print("<th>Course</th>");
 		out.print(" <th>Mobile</th>");
 		out.print("<th>Father's Name</th>");
 		out.print("<th>Mother's Name</th>");
 		
 		out.print("<th>Date of Birth</th>");
 		out.print("<th>Date of Join</th>");
 	
 		out.print("<th>Paid</th>");
 		out.print("<th>Fee</th>");
 		out.print("<th>Balance</th>");
 		out.print("<th>Address</th>");
 		
 		out.print("<th colspan='2'>Actions</th>");
 		out.print("</tr>");
 		out.print(" </thead>");
 		out.print("<tbody>");
 	}
 	else{
 		out.print("<center style='margin-bottom:50px;'><h3>No Data is Available</h3></center>");
 	}

            
            	for (int i = 0; i < s.size(); i++)
            	{
        		  out.print("<tr>");
                  out.print("<td>"+ s.get(i).getId()+"</td>");
        		  out.print("<td>"+ s.get(i).getName()+"</td>");
        		  out.print("<td>"+ s.get(i).getCourse()+"</td>");
        		  out.print("<td>"+ s.get(i).getMobile()+"</td>");
        		  out.print("<td>"+ s.get(i).getFathersName()+"</td>");
        		  out.print("<td>"+ s.get(i).getMothersName()+"</td>");
        		  
        		  out.print("<td>"+ s.get(i).getDateOfBirth()+"</td>");
        		  out.print("<td>"+ s.get(i).getDateOfJoining()+"</td>");
        		  
        		  out.print("<td>"+ s.get(i).getPaid()+"</td>");
        		  out.print("<td>"+ s.get(i).getFee()+"</td>");
        		  out.print("<td>"+ s.get(i).getBalance()+"</td>");
        		  out.print("<td>"+ s.get(i).getAddress()+"</td>");
        		  
        		  out.print("<td><a href='editst?id="+s.get(i).getId()+"'>edit<a/></td>");
        		  out.print("<td><a href='deletestudent?id="+s.get(i).getId()+"'>delete<a/></td>");
        		  out.print("</tr>");
            	}
                %>
	<%
                if(s.size()>=0){
                	out.print("</tbody>");
                	out.print("</table>");
                	out.print("</div>");
                }
                %>




	<%@include file="/footer.jsp"%>
</body>
</html>