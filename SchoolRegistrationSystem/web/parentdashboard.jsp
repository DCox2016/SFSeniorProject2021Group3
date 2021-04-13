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
 </head>
 <body class="bg-success">
    <div class="d-flex flex-row bd-highlight justify-content-end p-5">
     <a href="login.jsp">
  	 <label class="btn btn-outline-light m-1 text-light" for="btncheck1">Log Out</label>	
  	   </a>
 	 </div>
 	<div class="container-fluid">
		<div class="d-flex justify-content-center">
			<h1>
				<span class="badge rounded-pill bg-primary">Parent</span>
				<span class="badge rounded-pill bg-danger">Dashboard</span> 
			 </h1>
		 </div>
   </div>
   <div class="container">
      <div class="card">
  		<div class="card-body">
   	     <%
  			String firstName = request.getParameter("firstName");
  			String lastName = request.getParameter("lastName");
  			String studentId = request.getParameter("studentId");
  			out.println("Welcome back " + firstName + " " + lastName);
 		%>
  		</div>
	</div>

	
	<div class="row">
	
	 <div class="col-4">
	<div class="card mt-5" style="width: 18rem;">
  		<img class="card-img-top" src="https://i.pinimg.com/originals/2c/54/ff/2c54ff31b9d05983462266e982b142a6.jpg" alt="Card image cap">
  		<div class="card-body">
   		 <h5 class="card-title">School News. Go Mighty Dragons !</h5>
   		 <p class="card-text">The Might Dragons have a home game tonight!</p>
  		</div>
  	</div>
  	</div>
  	
  	 <div class="col-8 mt-5 mb-5">
  	<div class="card">
 		 <div class="card-header bg-primary">
   		<jsp:useBean id="students" class="com.SchoolRegistrationSystem.ParentServlet"/>  
           	<%
           	String Grade = "";
           	String StudentId = "";
           	String Present = "";
           	String Absent = "";
           	
           	try {
           	ResultSet rs;
           	rs = students.getStudent(firstName, lastName);
            while (rs.next())
            {
            	out.print(" " + rs.getString("FirstName"));
            	out.print(" " + rs.getString("LastName"));
            	StudentId = rs.getString("StudentId");
            	Grade = rs.getString("Grade");
            	Present = rs.getString("Present");
            	Absent = rs.getString("Absent");
            	
            };
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
           	%> 
 		 </div>
  			<div class="card-body">
    		<h5 class="card-title"> <%
            	out.print(Grade);
           	%>th Grade</h5> 
  			</div>
  			
  			<div class="card">
  				<div class="card-body">
  				<h5 class="card-title">Current Grade</h5>
    		<div class="container">
 			 <div class="row">
   				 <div class="col">
   				 <jsp:useBean id="grades" class="com.SchoolRegistrationSystem.ParentServlet"> 
   				 <% 
   				 try {
   				ResultSet rs = students.getGrades(studentId);
   	            while (rs.next())
   	            {
   	            	out.print(" " + rs.getString("ClassName"));
   	            	out.print(" " + rs.getString("Grades"));
   	            	
   	            };
   	  	  		} catch (Exception e) {
   	  	  			System.out.println(e.toString());
   	  	  		}
   				%>
   				</jsp:useBean>
   				 </div>
   			 <div class="col">
   			 </div>
   			 <div class="col">
   			 </div>
  			</div>
			</div>
  				</div>
			</div>
			
			<div class="card">
  				<div class="card-body">
    				<h5 class="card-title">Current Schedule</h5>
    				<table class="table">
				  <tbody>
				    <tr>
				      <th scope="row">First Period</th>
				      <td>Reading</td>
				    </tr>
				    <tr>
				      <th scope="row">Second Period</th>
				      <td>Math</td>
				    </tr>
				      <tr>
				      <th scope="row">Lunch</th>
				      <td>1 hour lunch</td>
				    </tr>
				    <tr>
				      <th scope="row">Third Period</th>
				      <td>PR</td>
				    </tr>
				  </tbody>
				</table>
  				</div>
			</div>
  			
  			<div class="card">
  				<div class="card-body">
  				<h5 class="card-title">Attendance</h5>
    		<div class="container">
 			 <div class="row">
   				 <div class="col">
   				   Days out: <%out.print(Present);%>
   				 </div>
   			 <div class="col">
   			   	   Days in: <%out.print(Absent);%>
   			 </div>
   			 <div class="col">
   		
   			 </div>
  			</div>
			</div>
  				</div>
			</div>
		</div>
	
		
		</div>
	</div>
   </div>
<body>

</body>
</html>
