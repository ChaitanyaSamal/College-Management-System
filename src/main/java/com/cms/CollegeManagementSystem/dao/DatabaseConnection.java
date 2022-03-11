package com.cms.CollegeManagementSystem.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import org.springframework.stereotype.Component;

@Component
public class DatabaseConnection {
	
	public Connection getConnection() {
		Connection con=null;
		try {
			
//			PreparedStatement ps=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/collegeManagement", "Chaitanya", "Chay@1298");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
		return con;
			
			
			
			
		
		
	}

}
