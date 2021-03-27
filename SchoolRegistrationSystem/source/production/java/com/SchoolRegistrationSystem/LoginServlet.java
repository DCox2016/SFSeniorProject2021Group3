package com.SchoolRegistrationSystem;

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
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
	
	public boolean login(String name, String password) {
		try {
			//Connection to db
			Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			//Make a statement
			Statement st = con.createStatement();
			String query = "select * from users where email='" + name + "' and password='" + password + "'";
			//ResultSet
			ResultSet rs = st.executeQuery(query);
			//query has a lot results
			if (rs.next()) {
				//close
				rs.close();
				st.close();
				con.close();
				return true;
			}
			//query does not have a lot results
			rs.close();
			st.close();
			con.close();
			return false;
		}
		catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return false;
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String email = req.getParameter("username");
		String password = req.getParameter("password");
		//if password or email is empty send to login page
		if (email.isEmpty() || password.isEmpty()) {
			res.sendRedirect("login.jsp");
		} else {
			//Check email and password exist in query
			if (login(email, password)) {
				//if so send to userwelcome
				res.sendRedirect("userwelcome.jsp?user="+email);
			} else {
				//else back to login
				res.sendRedirect("login.jsp");
			}
			
		}
		
	}
}


