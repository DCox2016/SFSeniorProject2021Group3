<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
 <head>
  <title>School Registration System Application</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<style>li {cursor: pointer;}a:hover { background-color: #90ee90; transition: 0.1s;}</style>
 	 <style>
	table {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	td, th {
	  border: 1px solid #dddddd;
	  text-align: left;
	  padding: 8px;
	}
	
	tr:nth-child(even) {
	  background-color: #dddddd;
	}
	</style>
 </head>
 <body>
 <%-- Header --%>
 	<div class="container">
		<div class="d-flex justify-content-center">
			<h1>
				<span class="badge rounded-pill bg-success">Staff</span>
				<span class="badge rounded-pill bg-warning text-dark">Dashboard</span> 	
			 </h1> 
		 </div>
   </div>
  <%-- Menu --%>
	<div class="row">
		<div class="col-3">
			<nav class ="navbar bg-light">
				<ul class ="nav navbar-nav" >
					<li class ="nav-link"> <a href="staffDashboard.jsp">Main Dashboard</a></li>					
				</ul>
			</nav>
		</div>
		<%-- Content with text change via Javascript--%>
		<div class="col-9">
			<div class="container">
           	<p id="content"></p>
           	<jsp:useBean id="users" class="com.SchoolRegistrationSystem.StaffServlet"/>  
           	<%
           	ResultSet rset;
           	rset = users.getWaitingUsers();
           	out.print("<br><h2>Users Awaiting Approval</h2><table>"+"<thead>" +
                	"<tbody>"+
                    "<tr>" +
                    "<th> Full Name</th>"+               
                    "<th> User Type</th>"+
                    "</tr>");
            while (rset.next ())
            {
            	out.print(
            	"<tr>"+
                "<td>"+ rset.getString("User")+"</td>"+               
                "<td>"+ rset.getString("UserType")+"</td>"+
                "</tr>");
            }
            out.print(
                    "</table>");
           	
            while (rset.next ())
            {
            	out.print("<table>" +
            	"<thead>" +
            	"<tbody>"+
                "<tr>" +
                "<th> First name: "+ rset.getString("User")+".  " + "</th>"+
                "<th> User Type: "+ rset.getString("UserType")+".  " + "</th>"+
                "<tr>"+
                "</table>");
            }
           	%>
			</div>
		</div>
	</div>	
</body>
</html>
