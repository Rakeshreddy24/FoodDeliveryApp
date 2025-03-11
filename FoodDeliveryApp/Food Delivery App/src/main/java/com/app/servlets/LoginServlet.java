package com.tap.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tap.daoImpl.UserDAOImpl;
import com.tap.encrypt.Mydecrypt;
import com.tap.encrypt.Myencrypt;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet 
{
	private Connection con;
	
	private String checkEmail="select * from user where email=? ";
	private PreparedStatement pstmt;
	private ResultSet res;
	
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

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException 
	{

		HttpSession session=req.getSession();
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
			try 
			{
			pstmt=con.prepareStatement(checkEmail);
			pstmt.setString(1,email);
			res=pstmt.executeQuery();
			
			if(res.next())
			{
				if(password.equals(res.getString("password")) && email.equals(res.getString("email")))
				{
					int userId=res.getInt("userId");
					String name=res.getString("username");
					String Email=res.getString("email");
					String phone=res.getString("phone");
					String Address=res.getString("address");
					
					Cookie ck=new Cookie("email",email);
					
					resp.addCookie(ck);
					
					session.setAttribute("userId",userId);
					session.setAttribute("name", name);
					session.setAttribute("Email", email);
					session.setAttribute("phone", phone);
					session.setAttribute("address", Address);
					
//					req.getRequestDispatcher("Home.jsp").forward(req, resp)
					
					System.out.println("Login with userId"+userId);
					
					req.getRequestDispatcher("GetAllRestaurants").forward(req, resp);
				}
					
//					resp.sendRedirect("LoginSuccess.html");				}
				else
				{
					resp.sendRedirect("PasswordMismatch.html");
				}
			}
			else
			{
				resp.sendRedirect("InvalidUser.html");
			}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
	}
	
	
	
//	UserDAOImpl udao=new UserDAOImpl();;
//	
//	
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) 
//			throws ServletException, IOException 
//	{
//		
//		String email=req.getParameter("email");
//		String password=req.getParameter("password");
//		
//		
//		try
//		{
//			boolean valid=udao.search(email, password);
//			
//			if(valid)
//			{
//			resp.sendRedirect("LoginSuccess.html");
//			resp.getWriter().println("Helloo"+rs.getString("username"));
//				
//			}
//			else
//			{
//				resp.sendRedirect("PasswordMismatch.html");
//			}
//		} 
//		catch (Exception e) 
//		{
//			e.printStackTrace();
//		}
				
			
/*	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException 
	{
			
		String email=req.getParameter("email");
		String password=Mydecrypt.decrypt(req.getParameter("password"));
		
			try 
			{
			pstmt=con.prepareStatement(checkEmail);
			pstmt.setString(1,email);
//			pstmt.setString(2, password);
			res=pstmt.executeQuery();
			
			if(res.next())
			{
				if(password.equals(res.getString("password")))
				{
//					resp.sendRedirect("LoginSuccess.html");
//					resp.getWriter().println("Helloo  "+res.getString("username"));
					
					String name=Myencrypt.encrypt(res.getString("username"));
					String Email=Myencrypt.encrypt(res.getString("email"));
					String phone=Myencrypt.encrypt(res.getString("phone"));
					String Address=Myencrypt.encrypt(res.getString("address"));
					
//					HttpSession session = req.getSession();
					
					Cookie ck1=new Cookie("username",name);
					Cookie ck2=new Cookie("email",email);
					Cookie ck3=new Cookie("phone",phone);
					Cookie ck4=new Cookie("address",Address);
					
					ck1.setMaxAge(40);
					ck2.setMaxAge(50);
					ck3.setMaxAge(60);
					ck4.setMaxAge(70);
					
					
					resp.addCookie(ck1);
					resp.addCookie(ck2);
					resp.addCookie(ck3);
					resp.addCookie(ck4);
					
					
					req.setAttribute("name", Mydecrypt.decrypt(name));
					req.setAttribute("Email", Mydecrypt.decrypt(email));
					req.setAttribute("phone",Mydecrypt.decrypt( phone));
					req.setAttribute("address", Mydecrypt.decrypt(Address));
					
					
					
//					resp.sendRedirect("Home.jsp");
					
					 req.getRequestDispatcher("Home.jsp").forward(req, resp);;
				}
				else
				{
					resp.sendRedirect("PasswordMismatch.html");
				}
			}
			
			else
			{
				resp.sendRedirect("InvalidUser.html");
			}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
	}
	
	*/
	
	@Override
	public void destroy() {
		try 
		{
			con.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		super.destroy();
	}

}
