<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" href="contactUsStyle.css">
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="contactbody">

		<div class="leftcb">
			<div class="formbody">
				<center>
					<h3>Contact Us Form</h3>
				</center>
				<hr />
				<form action="#">
					<label for="contactmsg">Write to Us</label>
					<textarea name="" id="contactmsg" cols="60" rows="7"></textarea>
					<label for="email">Enter your mail:</label><input type="text"
						name="" id="email" placeholder="your email"> <input
						type="submit" value="Send">
				</form>
			</div>
		</div>
		<div class="rightcb">
			<img src="contactus.png" alt="">
		</div>
	</div>
	<%@include file="/footer.jsp"%>
</body>
</html>