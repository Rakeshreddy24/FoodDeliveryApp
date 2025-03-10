package com.app.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.app.daoimpl.RestaurantDaoImpl;
import com.app.models.Restaurant;


@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		RestaurantDaoImpl restaurantDaoImpl = new RestaurantDaoImpl();
		
		List<Restaurant> allRestaurants = restaurantDaoImpl.getAllRestaurants();
		
		request.setAttribute("restaurants", allRestaurants);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
		
		
	}
}
