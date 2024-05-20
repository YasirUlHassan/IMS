package com.ims.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAOServiceImpl implements DAOService{

	Statement stmnt = null;
	@Override
	public void connectDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imsdb","root","root");
			stmnt = con.createStatement();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean verifyLogin(String email, String password) {
		try {
			ResultSet res = stmnt.executeQuery("Select * from login Where email = '"+email+"' and password = '"+password+"'");
			return res.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void addInquiry(String name, String email, String mobile, String course) {
		try {
			stmnt.executeUpdate("Insert Into student Values ('"+name+"','"+email+"','"+mobile+"','"+course+"')");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteInquiry(String email) {
		try {
			stmnt.executeUpdate("Delete from student Where email= '"+email+"'");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateInquiry(String email, String mobile) {
		try {
			stmnt.executeUpdate("Update student Set mobile = '"+mobile+"' Where email= '"+email+"'");
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void closeDB() {
		// TODO Auto-generated method stub
		
	}

	public ResultSet getAllInquiries() {
		try {
			ResultSet res = stmnt.executeQuery("select * from student");
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
