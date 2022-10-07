<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Billing System</title>
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%@include file="/header.jsp"%>

	<%
	if(session.getAttribute("Ausername")!=null){
		if(String.valueOf(session.getAttribute("isAccountant")).equals("yes"))
	}
	%>
	<%@include file="/accountantLogin.jsp"%>
	<%@include file="/footer.jsp"%>
</body>
</html>