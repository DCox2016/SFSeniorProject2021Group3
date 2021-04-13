package com.SchoolRegistrationSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class gradeupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
  	String url = "jdbc:mysql://localhost:3306/schoolregistrationsystem";
  	String dbUsername = "root";
  	String dbPassword = "admin";
  	boolean successRegistration = false;
  	
	public void init() {
  		//load driver
  		try {
  			Class.forName("com.mysql.jdbc.Driver");
  		} catch (ClassNotFoundException e) {
  			e.printStackTrace();
  		}
  	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gradeupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String EventId=request.getParameter("eventid");
	String Student=request.getParameter("student");
	String Class=request.getParameter("class");
	String Homework=request.getParameter("homework");
	String Test=request.getParameter("test");
	String Grades=request.getParameter("grades");
	String Delete=request.getParameter("delete");

	String ClassId = null;

	try{
		Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
		Statement st=con.createStatement();

		ResultSet rs = st.executeQuery("select ClassId from classregistration where ClassName = '"+Class+"';");
		while (rs.next()) {
			  ClassId = rs.getString("ClassId");
			  }

	if (Test.contentEquals(Homework)) {
		System.out.println("Homework and Test value can not be the same.");
	} else if (ClassId == null) {
		System.out.println("Class does not exist. Contact admin to add class.");
	} else{
		
	if (EventId != "" && Delete == null) {
	int i=st.executeUpdate("update gradeevent set Homework = '"+Homework+"', Test = '"+Test+"', Grades = '"+Grades+"' where EventId = " +EventId+ ";");
	int j=st.executeUpdate("update gradejoinstudent set StudentId = '"+Student+"', ClassId = '"+ClassId+"', EventId = '"+EventId+"' where EventId = " +EventId+ ";");
	System.out.println("Grade Updated.");
	} else if (Delete == null) {
		int i=st.executeUpdate("insert into gradeevent (Homework, Test, Grades) values ('"+Homework+"', '"+Test+"', '"+Grades+"');");
		rs = st.executeQuery("select last_insert_id() as EventId");
		while (rs.next()) {
			  EventId = rs.getString("EventId");
		}
		int j=st.executeUpdate("insert into gradejoinstudent (StudentId, ClassId, EventId) values ('"+Student+"', '"+ClassId+"', '"+EventId+"');");
		System.out.println("Grade Created.");
	} else {
		int i=st.executeUpdate("delete from gradeevent where EventId = "+EventId+";");
		int j=st.executeUpdate("delete from gradejoinstudent where EventId = "+EventId+";");
		System.out.println("Grade Deleted.");
	}
	}
	}
	catch(Exception e)
	{
	System.out.print(e);
	e.printStackTrace();
	}
}
}
