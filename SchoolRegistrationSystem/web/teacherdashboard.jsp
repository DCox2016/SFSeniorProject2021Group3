<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
	<% String usertype = (String)request.getSession().getAttribute("LogedInType");
	   if(usertype != "teacher"){
		   session.invalidate();
		   response.sendRedirect("AccessDenied.jsp");
	   }
	%>
<!DOCTYPE html>
 <head>
  <title>School Registration System Application</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link href="css/teacherdashboard.css" rel="stylesheet">
  <script src="js/teacherdashboard.js"></script>
  <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <head>
    <title>
  		Teacher Dashboard
  	</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  <link type="text/css" rel="stylesheet" href="css/teacherdashboard.css">
  <script src ="js/teacherdashboard.js"></script>
  </head>
 <body class="bg-success">
	<button class="tablink" onclick="openPage('Student', this)">Student</button>
	<button class="tablink" onclick="openPage('Grades', this)">Grades</button>
	<button class="tablink" onclick="openPage('Classes', this)">Classes</button>
	<button class="tablink" onclick="openPage('LogOut', this)">Log Out</button>

	<div id="Grades" class="tabcontent">
		<table>
			<tr>
				<td>Student Id</td>
				<td>Class</td>
				<td>Homework</td>
				<td>Test</td>
				<td>Grades</td>
			</tr>
<jsp:useBean id="grades" class="com.SchoolRegistrationSystem.teacherServlet"/>  
           	 	<tr><td colspan="4">
		
		<%
           	try {
           	ResultSet rs;
           	rs = grades.getGrades();
            while (rs.next())
            {
            	out.println("<form method=\"post\" action=\"gradeupdate\" class=\"inline\">");
            	out.println("<input type=\"text\" readonly name=\"eventid\" value="+rs.getString("EventId")+" style=\"display: none;\">");
            	out.println("<input type=\"text\" readonly name=\"classid\" value="+rs.getString("ClassId")+" style=\"display: none;\">");
            	out.println("<input type=\"text\"  name=\"studentid\" value="+rs.getString("StudentId")+" style=\"width: 75px; margin-right:65px;\">");
            	out.println("<input type=\"text\"  name=\"class\" value="+rs.getString("ClassName")+" style=\"width: 80px; margin-right:65px;\">");
            	out.println("<input type=\"text\"  name=\"homework\" value="+rs.getString("Homework")+" style=\"width: 75px; margin-right:68px;\">");
            	out.println("<input type=\"text\"  name=\"test\" value="+rs.getString("Test")+" style=\"width: 75px; margin-right:68px;\">");
            	out.println("<input type=\"text\"  name=\"grades\" value="+rs.getString("Grades")+" style=\"width: 75px; margin-right:35px;\">");
            	out.println("Delete <input type=\"checkbox\" name=\"delete\" value=\"Delete\">");
            	out.println("<input type=\"submit\" value=\"Submit\">");
            	out.println("</form>");
            };
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
           	%> 
	<br>
	</td></tr>
	<jsp:useBean id="student" class="com.SchoolRegistrationSystem.teacherServlet" scope="request">  
          <%--  	<%
           	String Grade = "";
           	String StudentId = "";
           	try {
           	ResultSet rs;
           	rs = students.getStudent(firstName, lastName);
            while (rs.next())
            {
            	out.print(" " + rs.getString("FirstName"));
            	out.print(" " + rs.getString("LastName"));
            	StudentId = rs.getString("StudentId");
            	Grade = rs.getString("Grade");
            	
            };
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
           	%>  --%>
           	</jsp:useBean>
	<tr><td colspan="4">
		<form method="post" action="gradeupdate" class="inline">
			<input type="text" readonly name="eventid" style="display: none;">
			<input type="text" name="student" value="1" style="width: 60px; width: 75px; margin-right:65px;"> 
			<input type="text" name="class" value="Math" style="width: 80px; margin-right:65px;">   
			<input type="text" name="homework" value="No" style="width: 75px; margin-right:68px;"> 
			<input type="text" name="test" value="No" style="width: 75px; margin-right:68px;">         
			<input type="text" name="grades" value="0" style="width: 75px; margin-right:35px;">     
			<input type="submit" value="Add">
		</form>
	</td></tr>
</table>
</div>

<div id="Classes" class="tabcontent">

<jsp:useBean id="classes" class="com.SchoolRegistrationSystem.teacherServlet" scope="request">  
           	<%
           	try {
           	ResultSet rs;
           	rs = classes.getClasses();
            while (rs.next())
            {
            	out.println(rs.getString("ClassName") + "</br>");
            	
            };
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
           	%> 
           	</jsp:useBean>
</div>

<div id="LogOut" class="tabcontent">
	<div class="d-flex flex-row bd-highlight justify-content-end p-5">
    <label class="btn btn-outline-danger m-1 text-danger" for="btncheck1"><a href="login.jsp">Log Out</a></label>
 	</div>
</div>

<div id="Student" class="tabcontent">
<table>
<tr>
<td style="width: 60px; clear: both;">Student ID</td>
<td style="width:100px;">Name</td>
<td style="width: 16%;">Present</td>
<td>Absent</td>
</tr>
<tr>
<td colspan="4">
<jsp:useBean id="students" class="com.SchoolRegistrationSystem.teacherServlet" scope="request">
<%
	try {
   	ResultSet rs;
   	rs = students.getStudents();
    while (rs.next())
    {
		out.println("<form method=\"post\" action=\"attendanceupdate\"  class=\"inline\">"+
		"<input type=\"number\" readonly name=\"studentid\" value="+rs.getString("StudentId")+" id=\"studentid\" style=\"margin-right: 9px; width: 80px;\">"+
		"<span  style=\"width: 150px;\">"+rs.getString("FirstName")+ " "+rs.getString("LastName")+"</span>"+
		"<input type=\"number\" name=\"present\" min=\"0\" value="+rs.getString("Present")+" style=\"margin-left: 10px;\">"+
		"<input type=\"number\" name=\"absent\" min=\"0\" value="+rs.getString("Absent")+" style=\"margin-left: 10px;\">"+
		"<input type=\"submit\" value=\"Update\">"+
		"</form>");
    }
} catch (Exception e) {
			System.out.println(e.toString());
		}	
		 %>
		 </jsp:useBean>
		</td>
		</tr>
		</table>
</div>
</body>
</html>
