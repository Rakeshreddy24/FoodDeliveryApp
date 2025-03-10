package com.app.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	
	private static final String URL = "jdbc:mysql://localhost:3306/foodapp";
	private static final String PASSWORD = "root";
	private static final String USERNAME = "root";

	static Connection connection = null;
	
	public static Connection getConnection(){
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
}
