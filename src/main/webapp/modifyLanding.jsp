<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modify Details</title>
<link rel="stylesheet" href="btnsStyle.css">
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
	<div class="btns">
		<a href="studentModifyShowAll.jsp"><button>Modify
				Students Details</button></a>
		<%
			if(String.valueOf(session.getAttribute("isadmin")).equals("yes")){
			out.print("<a href='accountantModifyShowAll.jsp'>");
			out.print("<button>Modify Accountant Details</button>");
			out.print("</a>");
			
			out.print("<a href='coursesModifyShowAll.jsp'>");
			out.print("<button>Modify Course Details</button>");
			out.print("</a>");
		}
%>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>