package com.Db;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConn() {                   //update/insert/login/delete/editregister we need to call in our project
		
		try {
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb","root","");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
