package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.tap.daoImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RestaurantServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			HttpSession session=request.getSession();

			RestaurantDAOImpl restaurantDAO=new RestaurantDAOImpl();
			// Fetch all restaurants
			ArrayList<Restaurant> restaurantList =(ArrayList<Restaurant>) session.getAttribute("restaurantList");


			String name=(String) session.getAttribute("name");

			if (restaurantList != null && !restaurantList.isEmpty()) 
			{
				restaurantList=restaurantDAO.getAllRestaurants();
				
				System.out.println("Restaurants......");
				// Set the list as a request attribute
				session.setAttribute("restaurantList", restaurantList);
			} 
			else
			{
				// Set an error message if no restaurants are found
				request.setAttribute("errorMessage", "No restaurants found.");
			}

			// Forward to Home.jsp
			RequestDispatcher dispatcher = request.getRequestDispatcher("Home3.jsp");

			dispatcher.forward(request, response);

		}
		catch (Exception e)
		{
			e.printStackTrace(); // Log the error
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch restaurant data.");
		}
	}    

}