package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.daoImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class GetAllRestaurants extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	@Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session object
        HttpSession session = request.getSession();

        // Retrieve the username from the session
        String username = (String) session.getAttribute("name");
        

        // Check if the restaurant list is already stored in the session
        List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("restaurantList");
        

        // If the list is not available in the session, fetch it from the database
        if (restaurantList == null) {
            try {
                // DAO instance
                RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
                
                // Fetch all restaurant data
                restaurantList = restaurantDAO.getAllRestaurants();
                
                // Store the restaurant list in the session
                session.setAttribute("restaurantList", restaurantList);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while fetching restaurants.");
                request.getRequestDispatcher("error.html").forward(request, response);
                return;
            }
        }

        // Set restaurants and username as request attributes
        request.setAttribute("restaurantList", restaurantList);
        request.setAttribute("username", username);
        
        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("Home2.jsp");
        dispatcher.forward(request, response);
}
}
//
//    public GetAllRestaurants() {
//        super();
//        restaurantDAO = new RestaurantDAOImpl(); // Initialize the DAO
//    }
    
    
//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
//    {
//    	if(req.getCookies()[0].getValue()!=null)
//    	{
//    		RestaurantList=restaurantDAO.getAllRestaurants();
//    		
//    		HttpSession session=req.getSession();
//    		
//    		session.setAttribute("RestaurantList", RestaurantList);
//    		    		
//    		resp.sendRedirect("Home1.jsp");
//    		
//    	}
//    	else
//    	{
//    		resp.sendRedirect("Login.html");
//    	}
//    	
//    	super.service(req, resp);
//    	
//    }
    
    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try 
//        {
//        	HttpSession session=request.getSession();
//        	
//        	RestaurantDAOImpl restaurantDAO=new RestaurantDAOImpl();
//        	
//            // Fetch all restaurants
//            @SuppressWarnings("unchecked")
//			ArrayList<Restaurant> restaurantList =(ArrayList<Restaurant>) session.getAttribute("restaurantList");
//            
//            System.out.println(restaurantList);
//            
//            session.getAttribute("name");
//            
//            if (restaurantList == null || restaurantList.isEmpty()) 
//            {
//                System.out.println("Restaurant list is empty or null!");
//                
//            } 
//            else
//            {
//                System.out.println("Found " + restaurantList.size() + " restaurants.");
//            }
//            
//            if (restaurantList != null && !restaurantList.isEmpty()) 
//            {
//            	 restaurantList=restaurantDAO.getAllRestaurants();
//                // Set the list as a request attribute
//                session.setAttribute("restaurantList", restaurantList);
//            } 
//            else
//            {
//                // Set an error message if no restaurants are found
//                request.setAttribute("errorMessage", "No restaurants found.");
//            }
//
//            // Forward to Home.jsp
//            RequestDispatcher dispatcher = request.getRequestDispatcher("Home3.jsp");
//            
//            dispatcher.forward(request, response);
//            
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace(); // Log the error
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch restaurant data.");
//        }
//    }    
//}




