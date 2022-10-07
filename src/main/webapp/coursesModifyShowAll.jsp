<%@page
	import="java.sql.*,java.util.List,com.paymentbillsystem.model.*,com.paymentbillsystem.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="stylesheet" href="resulttablestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%@include file="/header.jsp"%>
	<%
		response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma","no-cache"); //HTTP 1.0
		response.setHeader("Expires","0"); //proxy
	
		if(session.getAttribute("Ausername")==null){
			response.sendRedirect("adminLogin.jsp");
		}else if(String.valueOf(session.getAttribute("isadmin")).equals("no")){
			response.sendRedirect("adminLogin.jsp");
		}
		if(session.getAttribute("newaccountant")!=null){
			out.print("<br>");
			out.print("<center><font size='4' color='blue'>");
			out.print(session.getAttribute("newaccountant"));
			out.print("</font></center>");
			session.removeAttribute("newaccountant");
		}
		
		
      
  	FeesDao dao = new FeesDao();
	List<Course> a = dao.getAllCourses();
	if(a.size()>0){
		out.print("<div class='resultBody'>");
		out.print("<table>");
		out.print("<thead>");
		out.print("<tr>");
		out.print("<th>Course</th>");
		out.print("<th>Fee</th>");
		out.print("<th>Actions</th>");
		out.print("</tr>");
		out.print("</thead>");
		out.print("<tbody>");
	}
	else{
		out.print("<center style='margin-bottom:50px;'><h3>No Data is Available</h3></center>");
	}
 
            
            	for (int i = 0; i < a.size(); i++)
            	{
        		  out.print("<tr>");
                  out.print("<td>"+ a.get(i).getCourseString()+"</td>");
        		  out.print("<td>"+ a.get(i).getFeesString()+"</td>");
        		  out.print("<td><a href='editForCourse.jsp?course="+a.get(i).getCourseString()+"'>edit<a/></td>");
        		
        		  
        		  out.print("</tr>");
            	}
            
                if(a.size()>=0){
                	out.print("</tbody>");
                	out.print("</table>");
                	out.print("</div>");
                }
			%>
	<%@include file="/footer.jsp"%>
</body>
</html>