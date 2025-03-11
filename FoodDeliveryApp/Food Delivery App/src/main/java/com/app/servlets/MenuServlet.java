/*package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.tap.daoImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class MenuServlet extends HttpServlet
{
	private Menu menu;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int restaurantId=Integer.parseInt(req.getParameter("RestaurantId"));
	
		System.out.println("Lets display menu  "+restaurantId);	
		
		try {

            // Fetch menu item using DAO
            MenuDAOImpl menuDao = new MenuDAOImpl();
//            Menu menuItem = menuDao.menuItem(restaurantId);
            ArrayList<Menu> allMenuItems = menuDao.MenuList();
            
            ArrayList<Menu> filteredMenuItems = new ArrayList<>();
            
            for (Menu menu : allMenuItems) 
            {
                if (menu.getRestaurantId() == restaurantId) 
                {
                    filteredMenuItems.add(menu);
                }
            }

            // If no menu items are found, set an error message
            if (filteredMenuItems.isEmpty()) 
            {
                req.setAttribute("errorMessage", "No menu items found for Restaurant ID: " + restaurantId);
            } 
            else 
            {
                req.setAttribute("menuItems", filteredMenuItems);
            }

            // Forward to MenuItem.jsp
            RequestDispatcher dispatcher = req.getRequestDispatcher("MenuItem.jsp");
            dispatcher.forward(req, resp);

        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid Menu ID");
            req.getRequestDispatcher("MenuItem.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
		

		
//		 MenuDAOImpl menuDao = new MenuDAOImpl();
//		 
//	     Menu menuList = menuDao.menuList(restaurantId);
//
//	        // Filter menu items specific to the RestaurantId
//	        ArrayList<Menu> menuList1 = new ArrayList<>();
//	        for (Menu menu : menuList1) 
//	        {
//	            if (menu.getRestaurantId() == restaurantId) 
//	            {
//	            	menuList1.add(menu);
//	            }
//
//	        // Set the menu list in the request scope
//	        req.setAttribute("menuList", menuList);
//	            }
//
//	        // Forward to MenuList.jsp
//	        req.getRequestDispatcher("MenuList.jsp").forward(req, resp);
	    		
//		MenuDAOImpl mdao=new MenuDAOImpl();
//		
//		Menu menu=mdao.menuItem(restaurantId);
//		
//		req.setAttribute("menu", menu);
//		
//		 RequestDispatcher dispatcher = req.getRequestDispatcher("MenuList.jsp");
//         
//         dispatcher.forward(req, resp);	
	}
}

*/

package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.tap.dao.MenuDAO;
import com.tap.daoImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MenuDAOImpl menuDAO;

	@Override
	public void init() throws ServletException {
		super.init();
		menuDAO = new MenuDAOImpl();
	}

/*	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<Integer, Integer> cart = (Map<Integer, Integer>)session.getAttribute("cart");
		if (cart == null) 
		{
			cart = new HashMap<>();
			session.setAttribute("cart", cart);
		}

		String action = request.getParameter("action");
		String menuIdParam = request.getParameter("menuid");

		if (menuIdParam != null && action != null) {
			int menuId = Integer.parseInt(menuIdParam);

			synchronized (cart) 
			{
				switch (action) {
				case "increase":
					cart.put(menuId, cart.getOrDefault(menuId, 0) + 1);

					break;
				case "decrease":
					cart.put(menuId, cart.getOrDefault(menuId, 1) - 1);
					if (cart.get(menuId) <= 0) {
						cart.remove(menuId);
					}
					break;
				default:
					response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
					return;
				}
			}
		}

		response.setContentType("text/plain");
		response.getWriter().write("Cart updated.");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String restaurantIdParam = request.getParameter("RestaurantId");
		if (restaurantIdParam != null) {
			int restaurantId = Integer.parseInt(restaurantIdParam);
			HttpSession session = request.getSession();
			request.setAttribute("restaurantId", restaurantId);
			try {

				ArrayList<Menu> menuItems = menuDAO.fetchAll();
				request.setAttribute("menuItems",menuItems);

			} catch (Exception e) {
				e.printStackTrace();
			}

			request.getRequestDispatcher("MenuItem.jsp").forward(request, response);
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Restaurant ID is missing.");
		}
	}
}

*/
  
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String restaurantIdParam = req.getParameter("RestaurantId");

        if (restaurantIdParam == null || restaurantIdParam.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Restaurant ID is missing.");
            req.getRequestDispatcher("MenuItem.jsp").forward(req, resp);
            return;
        }

        try {
            int restaurantId = Integer.parseInt(restaurantIdParam);

            System.out.println("Displaying menu for Restaurant ID: " + restaurantId);

            // Fetch all menu items using DAO
            MenuDAOImpl menuDao = new MenuDAOImpl();
            ArrayList<Menu> allMenuItems = menuDao.MenuList();

            // Filter menu items by RestaurantId
            ArrayList<Menu> filteredMenuItems = new ArrayList<>();
            for (Menu menu : allMenuItems) {
                if (menu.getRestaurantId() == restaurantId) {
                    filteredMenuItems.add(menu);
                }
            }
            
            HttpSession session=req.getSession();
            // Handle cases where no menu items are found
            if (filteredMenuItems.isEmpty())
            {
                req.setAttribute("errorMessage", "No menu items found for Restaurant ID: " + restaurantId);
            } 
            else 
            {
                session.setAttribute("menuItems", filteredMenuItems);
            }

            // Forward to MenuItem.jsp
            RequestDispatcher dispatcher = req.getRequestDispatcher("MenuItem.jsp");
            dispatcher.forward(req, resp);

        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "Invalid Restaurant ID format.");
            req.getRequestDispatcher("MenuItem.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
        }
    }
}
