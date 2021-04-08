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
  <%-- Blinking text for users that are not approved yet--%>
    <script> 
	  	var ofs = 0;
		window.setInterval(function(){
		  $('#imp').css('background', 'rgba(255,0,0,'+Math.abs(Math.sin(ofs))+')');
		  ofs += 0.008;
		}, 10); 
	</script>
	<%-- content change--%>
	<script>
	function myFunction1() {
	  document.getElementById("content").innerHTML = "List of Courses";
	  
	}
	function myFunction2() {
	  document.getElementById("content").innerHTML = "Student Schedule list";
	  
	}
	function myFunction3() {
	  document.getElementById("content").innerHTML = "Student Grades";
	  
	}
	function myFunction4() {
	  document.getElementById("content").innerHTML = "Student Personal Data";
	  
	}
	</script>
	<style>li {cursor: pointer;}a:hover { background-color: #90ee90; transition: 0.1s;}</style>
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
   <div onclick="location.href='userApproval.jsp';" id="imp" style="width: 100%; cursor: pointer; text-align: center;  padding: 15px 0px 15px 0px;">One or more users awaiting to be approved</div>
	<div class="row">
		<div class="col-3">
			<nav class ="navbar bg-light">
				<ul class ="nav navbar-nav" >
					<li>Main Dashboard</li>
					<li class ="nav-item">
					<a class ="nav-link" onclick="myFunction1()"> View Courses </a>
					</li>
					<li class ="nav-item">
					<a class ="nav-link" onclick="myFunction2()"> View Student Schedules </a>
					</li>
					<li class ="nav-item">
					<a class ="nav-link" onclick="myFunction3()"> View Student Grades </a>
					</li>
					<li class ="nav-item">
					<a class ="nav-link" onclick="myFunction4()"> View Student Personal Information </a>
					</li>
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
           	
            while (rset.next ())
            {
            	out.print("<table>" +
            	"<thead>" +
            	"<tbody>"+
                "<tr>" +
                "<th> First name: "+ rset.getString("FirstName")+".  " + "</th>"+
                "<th> Last name: "+ rset.getString("LastName")+".  " + "</th>"+
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
