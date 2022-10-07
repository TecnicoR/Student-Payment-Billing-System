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
        FeesDao dao = new FeesDao();
        String course = request.getParameter("course");
       	
       	
        String fee = dao.getCourseFee(course);
        
   
	%>

	<%@include file="/header.jsp"%>

	<div class="loginpage">
		<div class="formbody">
			<center>
				<h3>Update Course</h3>
			</center>
			<hr />
            <form action="updateCourse" method="post">
                <label for="course">Course: </label>
                <input type="text" name="course" value=<%=course%> id="course" placeholder="Course" required autofocus />
                <label for="fees">Fees:
                </label><input type="text" value=<%=fee%> name="fees" id="fees" required placeholder="Fees" />
                <input type="submit" name="" id="" value="Update">
            </form>
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>

</html>