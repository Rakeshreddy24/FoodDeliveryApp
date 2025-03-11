package com.tap.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // Retrieve the current session, if it exists
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            // Invalidate the session to clear all attributes, including the shopping cart
	            session.invalidate();
	        }
	        // Redirect the user to the login page or homepage after logout
	        response.sendRedirect("OpenPage.jsp");
	    }

  

}
