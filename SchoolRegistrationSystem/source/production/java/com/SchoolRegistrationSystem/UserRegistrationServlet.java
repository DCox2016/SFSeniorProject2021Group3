package com.SchoolRegistrationSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegistrationServlet
 */
@WebServlet("/Registration")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
  //db connection information
  	String url = "jdbc:mysql://localhost:3306/schoolregistrationsystem";
  	String dbUsername = "root";
  	String dbPassword = "admin";
  	
  	public void init() {
  		//load driver
  		try {
  			Class.forName("com.mysql.jdbc.Driver");
  		} catch (ClassNotFoundException e) {
  			e.printStackTrace();
  		}
  	}
  	
	private void adduser(String email, String password, String firstName, String lastName, String age, String address1,
			String address2, String city, String state, String zip, String phone, String userType, String grade,
			String dependents) {

			try {
	  			//Connection to db
	  			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
	  			
	  		    Integer Age = Integer.parseInt(age);
	  		    String CityStateZip = city + " " + zip;
	  		    Integer Grade;
	  		    String Dependents;
	  		    String Address2;
	  		    
	  		    if(grade == null) {
	  		    	Grade = null;
	  		    } else {
	  		    	Grade = Integer.parseInt(grade);
	  		    }
	  		    
	  		    if(dependents == null) {
	  		    	Dependents = null;
	  		    } else {
	  		    	Dependents = dependents;
	  		    }
	  		    
	  		    if(address2 == null) {
	  		    	Address2 = null;
	  		    } else {
	  		    	Address2 = address2;
	  		    }
	  		    //Need to change if new registation
	  		    Integer id = 3;
	  		    		    
	  			//Make a statement
	  			Statement st = con.createStatement();
	  			String query = 
	  					"INSERT INTO schoolregistrationsystem.registrationuser "
	  					+ "(RegistrationId,Email, Password, FirstName, LastName, age, Address1, Address2, CityStateZip, Phone, UserType, Grade, dependents)"
	  					+ "VALUES('"+id+"','"
	  								+email+"','"
	  							    +password+"','"
	  					            +firstName+"','"
	  							    +lastName+"','"
	  					            +Age+"','"
	  							    +address1+"','"
	  					            +Address2+"','"
	  							    +CityStateZip+"','"
	  					            +phone+"','"
	  							    +userType+"','"
	  							    +Grade+"','"
	  							    +Dependents+"'"+
	  							");";
	  			//ResultSet
	  			int rs = st.executeUpdate(query);
	  		
	  			//query does not have a lot results
	  			st.close();
	  			con.close();
	  		}
	  		catch (SQLException e) {
	  			System.out.println(e.toString());
	  		} catch (Exception e) {
	  			System.out.println(e.toString());
	  		}
	  	
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String age = req.getParameter("age");
		String address1 = req.getParameter("address");
		String address2 = req.getParameter("address2");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");
		String phone = req.getParameter("phone");
		String userType = req.getParameter("userType");
		String grade = req.getParameter("grade");
		String dependents = req.getParameter("dependents");
		
		adduser(email, 
				password, 
				firstName, 
				lastName, 
				age, 
				address1, 
				address2, 
				city, 
				state, 
				zip, 
				phone, 
				userType, 
				grade, 
				dependents);

	}

}
