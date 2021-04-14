<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<% String usertype = (String)request.getSession().getAttribute("LogedInType");
	   if(usertype != "staff"){
		   session.invalidate();
		   response.sendRedirect("AccessDenied.jsp");
	   }
	%>
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
	
	<%-- Navigation content Change--%>
	<script>
	function myFunction() {
		var x = document.getElementById("myDIV");
		var z = document.getElementById("myDIV2");
		var a = document.getElementById("myDIV3");
		var b = document.getElementById("myDIV4");
	  if (x.style.display === "none") {
	    x.style.display = "block",z.style.display = "none",a.style.display = "none",b.style.display = "none";
	  } 
	}
	function myFunction2() {
		var x = document.getElementById("myDIV");
		var z = document.getElementById("myDIV2");
		var a = document.getElementById("myDIV3");
		var b = document.getElementById("myDIV4");
		  if (z.style.display === "none") {
		    z.style.display = "block",x.style.display = "none",a.style.display = "none",b.style.display = "none";
		  } 	  
		}
	function myFunction3() {
		var x = document.getElementById("myDIV");
		var z = document.getElementById("myDIV2");
		var a = document.getElementById("myDIV3");
		var b = document.getElementById("myDIV4");
		  if (a.style.display === "none") {
		    a.style.display = "block",x.style.display = "none",z.style.display = "none",b.style.display = "none";
		  }   
		}
	function myFunction4() {
		var x = document.getElementById("myDIV");
		var z = document.getElementById("myDIV2");
		var a = document.getElementById("myDIV3");
		var b = document.getElementById("myDIV4");
		  if (b.style.display === "none") {
		    b.style.display = "block",x.style.display = "none",z.style.display = "none",a.style.display = "none";
		  } 	  
		}
	</script> 
	<%-- -------------Menu Style -------------- --%>
	<style>li {cursor: pointer;}a:hover { background-color: #90ee90; transition: 0.1s;}</style>
	<%-- ------------Table Style -------------- --%>
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
  <%-- Log out --%>
    <div class="d-flex flex-row bd-highlight justify-content-end p-5">
    	<label class="btn btn-outline-danger m-1 text-danger" for="btncheck1"><a href="login.jsp">Log Out</a></label>
 	</div>
 <%-- Header --%>
 	<div class="container">
		<div class="d-flex justify-content-center">
			<h1>
				<span class="badge rounded-pill bg-success">Staff</span>
				<span class="badge rounded-pill bg-warning text-dark">Dashboard</span> 	
			 </h1> 
		 </div>
   </div>
  <%-------------------- Menu------------------- --%>
   
	<div class="row">
	
		<div class="col-4">
			<nav class ="navbar bg-light">
				<ul class ="nav navbar-nav" >
					<li>Main Dashboard</li>
					<li class ="nav-item">
						<a class ="nav-link" onclick="myFunction()"> View Courses </a>
					</li>
					<li class ="nav-item">
						<a class ="nav-link" onclick="myFunction2()"> View Student Schedules </a>
					</li>
					<li class ="nav-item">
						<a class ="nav-link" onclick="myFunction3()"> View Student Grades </a>
					</li>
					<li class ="nav-item">
						<a class ="nav-link" onclick="myFunction4()"> View Student Info </a>
					</li>
				</ul>
			</nav>
		</div>	
		<%-- Content with text change via Javascript--%>
		<div class="col-8">
			<div class="container">
			<div  onclick="location.href='userApproval.jsp';" id="imp" style="width: 100%; cursor: pointer; text-align: center;  padding: 15px 0px 15px 0px;">One or more users awaiting to be approved</div>
	           	<div id="content">
	           	
	   			<%-- Get from StaffServlet List of courses --%>  			
	           	<jsp:useBean id="users" class="com.SchoolRegistrationSystem.StaffServlet"/>  
	           	<%
	           
	     	   if(usertype == "staff"){
	           	ResultSet rset;
	           	rset = users.getclassList();
	           	out.print("<div id='myDIV'style='display:none;'><h2>List of Courses</h2><table>"+"<thead>" +
	                	"<tbody>"+
	                    "<tr>" +
	                    "<th> Course Number</th>"+          
	                    "<th> Course Name</th>"+
	                    "</tr>");
	            while (rset.next ())
	            {
	            	out.print(
	            	"<tr>"+
	                "<td>"+ rset.getString("ClassId")+"</td>"+               
	                "<td>"+ rset.getString("ClassName")+"</td>"+
	                "</tr>");
	            }
	            out.print(
	                    "</table></div>");
	            }%>
	           	</div>    
	           	      	
	           	<%-- Get from StaffServlet Student Class Schedule--%>
	           	<jsp:useBean id="studentScheduleID" class="com.SchoolRegistrationSystem.StaffServlet"/>  
	           	<%
	     	   if(usertype == "staff"){
	           	ResultSet StoredStudentClassData;
	           	StoredStudentClassData = studentScheduleID.getStudentStoredData();
	           	out.print("<div id='myDIV2'style='display:none;'><h2>Student Class Schedules</h2>"+
	           			"<p>Select a student to view their schedule</p>"+
	           			"<table>"+"<thead>" +
	                	"<tbody>"+
	                    "<tr>" +
	                    "<th> Student</th>"+
	                    "<th> Student ID</th>"+
	                    "</tr>");
	            while (StoredStudentClassData.next ())
	            {
	            	out.print(
	            	"<tr>"+
	            	"<td>"+ StoredStudentClassData.getString("Student")+"</td>"+
	                "<td>"+ StoredStudentClassData.getString("StudentId")+"</td>"+               
	                "</tr>");
	            }
	            out.print(
	                    "</table></div>"); 
	                    }%>
                    
                    <%-- Get from StaffServlet Student Grade--%>
           	<jsp:useBean id="studentGradeID" class="com.SchoolRegistrationSystem.StaffServlet"/>  
           	<%
     	   if(usertype == "staff"){
           	ResultSet StoredStudentGradeData;
           	StoredStudentGradeData = studentGradeID.getStudentStoredData();
           	out.print("<div id='myDIV3'style='display:none;'><h2>Student Grades</h2>"+
           			"<p>Select a student to view their grades</p>"+
           			"<table>"+"<thead>" +
                	"<tbody>"+
                    "<tr>" +
                    "<th> Student</th>"+
                    "<th> Student ID</th>"+
                    "</tr>");
            while (StoredStudentGradeData.next ())
            {
            	out.print(
            	"<tr>"+
            	"<td>"+ StoredStudentGradeData.getString("Student")+"</td>"+
            	"<td>"+ StoredStudentGradeData.getString("StudentId")+"</td>"+ 
                "</tr>");
            }
            out.print(
                    "</table></div>");} %>
                    
                    <%-- Get from StaffServlet Student Personal Information --%>
            <jsp:useBean id="classiess" class="com.SchoolRegistrationSystem.StaffServlet"/>  
           	<%
     	   if(usertype == "staff"){
           	ResultSet StoredStudentData;
           	StoredStudentData = classiess.getStudentData();
           	out.print("<div id='myDIV4'style='display:none;'><h2>Student Personal Information</h2><table>"+"<thead>" +
                	"<tbody>"+
                    "<tr>" +
                    "<th> Student ID</th>"+               
                    "<th> Name</th>"+
                    "<th> Last Name</th>"+
                    "<th> Birthday</th>"+
                    "<th> Address</th>"+
                    "<th> City</th>"+
                    "<th> Zip</th>"+
                    "<th> PhoneNumber</th>"+
                    "</tr>");
            while (StoredStudentData.next ())
            {
            	out.print(
            	"<tr>"+
                "<td>"+ StoredStudentData.getString("StudentId")+"</td>"+               
                "<td>"+ StoredStudentData.getString("FirstName")+"</td>"+
                "<td>"+ StoredStudentData.getString("LastName")+"</td>"+               
                "<td>"+ StoredStudentData.getString("Birthday")+"</td>"+
                "<td>"+ StoredStudentData.getString("Address")+"</td>"+               
                "<td>"+ StoredStudentData.getString("City")+"</td>"+
                "<td>"+ StoredStudentData.getString("Zip")+"</td>"+               
                "<td>"+ StoredStudentData.getString("PhoneNumber")+"</td>"+
                "</tr>");
            }
            out.print(
                    "</table></div>");} %>                    
			</div>
		</div>
	</div>
</body>
</html>
