package com.tap.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.tap.daoImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{
	private Connection con;
	private PreparedStatement pstmt;
	private int res;
	private User user;

	@Override
	public void init() throws ServletException {
	try
	{
	String url="jdbc:mysql://localhost:3306/project";
	String dbUn="root";
	String dbPsd="Sasi@1919";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection(url,dbUn,dbPsd);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	}
	
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
//			throws ServletException, IOException 
//	{
//		String username=req.getParameter("username");
//		String email=req.getParameter("email");
//		String password=req.getParameter("password");
//		String address=req.getParameter("address");
//		
//		String insert="Insert into user(username,password,email,address)values(?,?,?,?)";
//		
//		try
//		{
//			pstmt=con.prepareStatement(insert);
//			pstmt.setString(1,"username");
//			pstmt.setString(2, "password");
//			pstmt.setString(3, "email");
//			pstmt.setString(4, "address");
//			
//			res=pstmt.executeUpdate();
//			
//			if(res!=0)
//			{
////				resp.sendRedirect("Insert");
//				resp.getWriter().println("Inserted");
//			}
//			else
//			{
//				resp.getWriter().println("Not Inserted Data");
//			}
//			
//		}
//		catch(Exception e)
//		{
//			e.printStackTrace();
//		}
//	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		UserDAOImpl udao=new UserDAOImpl();
		
		String username=req.getParameter("username");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String password=req.getParameter("password");
		String address=req.getParameter("address");
		
		int x=udao.insert(new User(username, email,phone,password,address));
		
		
		try
		{
			if(x==1)
			{
//				resp.getWriter().println("Inserted");
				resp.sendRedirect("Login1.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
