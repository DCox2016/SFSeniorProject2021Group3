<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
  <title>School Registration System Application</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src ="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src ="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
           	<p id="content">This is where users that need to be approved will go.</p>
			</div>
		</div>
	</div>	
</body>
</html>
