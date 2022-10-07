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
		if(session.getAttribute("updateaccountant")!=null){
			out.print("<br>");
			out.print("<center><font size='4' color='blue'>");
			out.print(session.getAttribute("updateaccountant"));
			out.print("</font></center>");
			session.removeAttribute("updateaccountant");
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
				<h3>Search Accountant Menu</h3>
			</center>
			<hr />
			<form action="findupdateaccountant.jsp">
				<label for="find">Find:</label><input type="text" id="find"
					name="username" placeholder="Enter accountant username to find" />
				<input type="submit" value="Search" /> <a
					style="margin: 6px 2px -2px 2px; border: 2px solid blue; padding: 6px; border-radius: 10px; text-decoration: none; font-size: 18px;"
					href="newAccountant.jsp">Create New Accountant</a> <a
					style="margin: 6px 2px -2px 2px; border: 2px solid blue; padding: 6px; border-radius: 10px; text-decoration: none; font-size: 18px;"
					href="showallaccountants.jsp">Show All Accountants</a>
			</form>

		</div>
	</div>

	<%
      GetAccountantDao getAccountantDao = new GetAccountantDao();
  	List<Accountant> a = getAccountantDao.selectAllAccountants();
  	if(a.size()>0){
  		out.print("<div class='resultBody'>");
  		out.print("<table>");
  		out.print("<thead>");
  		out.print("<tr>");
  		out.print("<th>Branch</th>");
  		out.print("<th>UserName</th>");
  		out.print("<th>Password</th>");
  		out.print("<th>Date of Join</th>");
  		out.print("<th>Date of Birth</th>");
  		out.print("<th>Salary</th>");
  		out.print("<th colspan='2'>Actions</th>");
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
                      out.print("<td>"+ a.get(i).getBranch()+"</td>");
            		  out.print("<td>"+ a.get(i).getUsername()+"</td>");
            		  out.print("<td>"+ a.get(i).getPassword()+"</td>");
            		  out.print("<td>"+ a.get(i).getDateOfJoining()+"</td>");
            		  out.print("<td>"+ a.get(i).getDateOfBirth()+"</td>");
            		  out.print("<td>"+ a.get(i).getSalary()+"</td>");
            		  out.print("<td><a href='edita?username="+a.get(i).getUsername()+"'>edit<a/></td>");
            		  out.print("<td><a href='delete?username="+a.get(i).getUsername()+"'>delete<a/></td>");
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