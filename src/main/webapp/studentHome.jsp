<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Search Student Details</title>
<link rel="stylesheet" href="loginpagestyle.css" />
<link rel="stylesheet" href="resulttablestyle.css" />
<link rel="icon" href="favicon-16x16.png" type="image/x-icon">


<script>
	function printBill() {
            var divContents = document.getElementById("billMsg").innerHTML;
			var sname = document.getElementById("sname").innerHTML;
			var scourse = document.getElementById("scourse").innerHTML;
			var sfees = document.getElementById("sfees").innerHTML;
			var spaid = document.getElementById("spaid").innerHTML;
			var sbalance = document.getElementById("sbalance").innerHTML;
			var currentdate = new Date(); var datetime = "Last Sync: " + currentdate.getDate() + "/" + (currentdate.getMonth()+1) + "/" + currentdate.getFullYear() + " @ " + currentdate.getHours() + ":" + currentdate.getMinutes() + ":" + currentdate.getSeconds();
            var a = window.open('height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body><center><h1>Thank You For Paying</h1></center><br>');
            a.document.write("<div id='printbill'>Name : "+sname+" <br>");
            a.document.write('<div>Course : '+scourse+' <br>');
            a.document.write('<div>Total Fees : '+sfees+' <br>');
            a.document.write('<div>Amount Paid : '+spaid+' <br>');
			a.document.write('<div>Amount Pending : '+sbalance+' <br>');
			a.document.write(currentdate);
            a.document.write('</div></body></html>');
			a.document.getElementById("printbill").style.fontSize = "34px";
			a.document.getElementById("printbill").style.textAlign = "left";
			a.document.getElementById("printbill").style.width = "60%";
			a.document.getElementById("printbill").style.margin = "auto";
            a.document.close();
            a.print();
        }

	
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<% 
            response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0 
            response.setHeader("Expires","0"); //proxy
            if(session.getAttribute("studentInfo")==null){ response.sendRedirect("studentLogin.jsp"); } 


            if(session.getAttribute("amountError")!=null){
            out.print("<br>");
            out.print("<center><font size='4' color='red'>");
            out.print(session.getAttribute("amountError"));
            out.print("</font></center>");
            session.removeAttribute("amountError");
            }

            if(session.getAttribute("updatebalance")!=null){
                out.print("<br>");
                out.print("<center><font size='4' color='blue'><span id='billMsg'>");
                out.println(session.getAttribute("updatebalance"));
				out.print("<br>Don't refresh the page first click to download the receipt</span>");
                out.print("</font></center>");
				out.print("<center><input type='button' style='width: 250px; border-radius: 10px; margin-top: 15px; border: 2px solid #041562; cursor: pointer; width: 70px; padding: 6px;' value='Print Bill' onclick='printBill()'/></center>");
                session.removeAttribute("updatebalance");
                }
			com.paymentbillsystem.model.Student s=(com.paymentbillsystem.model.Student)session.getAttribute("studentInfo");
				
            if(Integer.parseInt(s.getBalance())<1){
				out.print("<br>");
                out.print("<center><font size='4' color='purple'><span id='billMsg'>");
				out.print("<br><<<  Amount is fully paid, don't have to pay anymore >>></span>");
                out.print("</font></center>");
			}
        %>

	<div class="resultBody">
		<br>
		<center>
			<h2>
				Hey Welcome Back
				<span id='sname'>
				<%out.print(s.getName()); %>
				</span>
			</h2>
		</center>
		<br>
		<table>
			<tr>
				<th>Course :</th>
				<th>Total Fees:</th>
				<th>Paid Fee:</th>
				<th>Balance Fee:</th>
			</tr>
			<% out.print("<td id='scourse'>"+ s.getCourse()+"</td>");
						out.print("<td id='sfees'>"+ s.getFee()+"</td>");
                                out.print("<td id='spaid'>"+ s.getPaid()+"</td>");
                                out.print("<td id='sbalance'>"+ s.getBalance()+"</td>");
                                %>
		</table>

		<div class="loginpage">
			<div class="formbody">
				<form action="updatebalance" method="post">
					<script>

					</script>
					<input type="hidden" name="id" value="<%=s.getId()%>"> <label
						for="paymentAmount">Enter amount to pay:</label><input type="text"
						id="paymentAmount" name="paymentAmount"
						placeholder="Amount to pay" required autofocus /> 
						<%
							if(Integer.parseInt(s.getBalance())<1){
								out.print("<input type='submit' disabled id='paybtn' value='Pay'/>");
							}
							else{
								out.print("<input type='submit' id='paybtn' value='Pay'/>");
							}
						%>
						
				</form>
			</div>
		</div>

	</div>
	<%@include file="/footer.jsp"%>

</body>

</html>