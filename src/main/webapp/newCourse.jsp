<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Create New Course</title>
        <link rel="stylesheet" href="loginpagestyle.css" />
        <link rel="icon" href="favicon-16x16.png" type="image/x-icon">
    </head>

    <body>
        <% response.setHeader("cache-control","no-cache,no-store,must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma","no-cache"); //HTTP 1.0 response.setHeader("Expires","0"); //proxy
            if(session.getAttribute("Ausername")==null){ response.sendRedirect("adminLogin.jsp"); }
            if(String.valueOf(session.getAttribute("isadmin")).equals("no")){ response.sendRedirect("adminLogin.jsp"); }
            %>
            <%@include file="/header.jsp" %>
                <%if(session.getAttribute("feesAdded")!=null){ out.print("<br>");
                    out.print("<center> <font size='4' color='blue'>");
                    out.print(session.getAttribute("feesAdded"));
                    out.print("</font></center>");
                    session.removeAttribute("feesAdded");
                    }
                    %>
                    <div class="loginpage">
                        <div class="formbody">
                            <center>
                                <h3>Create a new course</h3>
                            </center>
                            <hr />
                            <form action="createcourse" method="post">
                                <label for="course">Course: </label>
                                <input type="text" name="course" id="course" placeholder="Course" required autofocus />
                                <label for="fees">Fees:
                                </label><input type="text" name="fees" id="fees" required placeholder="Fees" />
                                <input type="submit" name="" id="" value="Create">
                            </form>
                        </div>
                    </div>
                    <%@include file="/footer.jsp" %>
    </body>

    </html>