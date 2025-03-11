package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.daoImpl.ProductDAOImpl;
import com.tap.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GetProducts extends HttpServlet 
{
	
	private List<Product> productList;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Cookie[] cookies=req.getCookies();
		
		if(req.getCookies()[0].getValue()!=null)
		{
			ProductDAOImpl pado=new ProductDAOImpl();
			
			productList=pado.getAllProducts();
			
			HttpSession session = req.getSession();
			
			session.setAttribute("productList", productList);
			
			resp.sendRedirect("Home1.jsp");
			
			
		}
		else
		{
			resp.sendRedirect("Login.html");
		}
	}

}
