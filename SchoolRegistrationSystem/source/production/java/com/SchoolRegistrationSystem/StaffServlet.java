package com.SchoolRegistrationSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.Region;

/**
 * Servlet implementation class staffServlet
 */
@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 //db connection information
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
    public StaffServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    

      

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	}
	
	//New!!!!!!!!!!!!!!!!!!!!!!!!!
	public ResultSet getRegCount() throws SQLException {
		ResultSet rs = null;
	try {
    		
  			//Connection to db
  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
  				    		    
  			//Make a statement
  			Statement st = con.createStatement();
  		//ResultSet
  			 rs = st.executeQuery("select FirstName from registrationuser");
  			
    	}	
  	  		catch (SQLException e) {
  	  			System.out.println(e.toString());
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
	
	   return rs;
	}
	
	//Class list gets queried and sent to staffDashboard.jsp
	public ResultSet getWaitingUsers() throws SQLException {
		ResultSet rs = null;
	try {
    		
  			//Connection to db
  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
  				    		    
  			//Make a statement
  			Statement st = con.createStatement();
  			String query = "select concat(FirstName,' ',LastName) AS User, UserType from registrationuser";
  		//ResultSet
  			 rs = st.executeQuery(query);
  			
    	}	
  	  		catch (SQLException e) {
  	  			System.out.println(e.toString());
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
	
	   return rs;
	}
	
	
	//Class list gets queried and sent to staffDashboard.jsp
	public ResultSet getUserApprovalList() throws SQLException {
		ResultSet rs = null;
	try {
    		
  			//Connection to db
  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
  				    		    
  			//Make a statement
  			Statement st = con.createStatement();
  			String query = "Select * from classregistration";
  		//ResultSet
  			 rs = st.executeQuery(query);
  			
    	}	
  	  		catch (SQLException e) {
  	  			System.out.println(e.toString());
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
	
	   return rs;
	}
	//Class list gets queried and sent to staffDashboard.jsp
	public ResultSet getclassList() throws SQLException {
		ResultSet rs = null;
	try {
    		
  			//Connection to db
  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
  				    		    
  			//Make a statement
  			Statement st = con.createStatement();
  			String query = "Select * from classregistration";
  		//ResultSet
  			 rs = st.executeQuery(query);
  			
    	}	
  	  		catch (SQLException e) {
  	  			System.out.println(e.toString());
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
	
	   return rs;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	//Student data gets queried and sent to staffDashboard.jsp
	public ResultSet getStudentData() throws SQLException {
		ResultSet rs = null;
	try {
  			//Connection to db
  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
  			//Make a statement
  			Statement st = con.createStatement();
  			String query = "Select * from studentdata";
  		//ResultSet
  			 rs = st.executeQuery(query);
    	}	
  	  		catch (SQLException e) {
  	  			System.out.println(e.toString());
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
	   return rs;
	}
	//Student class data gets queried and sent to staffDashboard.jsp
	public ResultSet getStudentStoredData() throws SQLException {
		ResultSet rs = null;
	try {
  			//Connection to db
  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
  			//Make a statement
  			Statement st = con.createStatement();
  			String query = "select concat(FirstName,' ',LastName) AS Student, StudentId from studentdata;";
  		//ResultSet
  			 rs = st.executeQuery(query);
    	}	
  	  		catch (SQLException e) {
  	  			System.out.println(e.toString());
  	  		} catch (Exception e) {
  	  			System.out.println(e.toString());
  	  		}
	   return rs;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
	}

}
