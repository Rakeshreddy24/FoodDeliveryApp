package com.tap.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class CollectData extends HttpServlet 
{
	private Connection con;
	private PreparedStatement pstmt;


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		String name=req.getParameter("name");
//		String email=req.getParameter("email");
//		String phone=req.getParameter("phone");
//		String password=req.getParameter("password");
//		String address=req.getParameter("address");
		

		System.out.println();

		String username=encrypt(req.getParameter("username"));
		String email=encrypt(req.getParameter("email"));
		String phone=encrypt(req.getParameter("phone"));
		String password=encrypt(req.getParameter("password"));
		String address =encrypt(req.getParameter("address"));
		
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Sasi@1919");
			
			String sql="insert into user(username,email,phone,password,address) values(?,?,?,?,?) ";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1,username);
			pstmt.setString(2,email);
			pstmt.setString(3,phone);
			pstmt.setString(4,password);
			pstmt.setString(5,address);
			
			if(pstmt.executeUpdate()==1)
			{
				resp.sendRedirect("Success.jsp");
			}
			else
			{
				resp.sendRedirect("Fail.jsp");
			}
			
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

//		resp.getWriter().println(name+" "+email);
//
//		StringBuffer decryptName=decrypt(name);
//		StringBuffer decryptEmail=decrypt(email);
//		StringBuffer decryptPhone=decrypt(phone);
//		StringBuffer decryptPassword=decrypt(password);
//		StringBuffer decryptAddress=decrypt(address);
//
//		resp.getWriter().println(decryptName+" "+decryptEmail);
	}
	
	

	static String encrypt(String str)
	{
		StringBuffer sb=new StringBuffer();

		for(int i=0;i<str.length();i++)
		{

			sb.append((char)(str.charAt(i)+2));

		}

		return sb.toString();
	}

	
	String decrypt(StringBuffer str)
	{
		StringBuffer sb=new StringBuffer();

		for(int i=0;i<str.length();i++)
		{

			sb.append((char)(str.charAt(i)-2));

		}

		return sb.toString();
	}

}
