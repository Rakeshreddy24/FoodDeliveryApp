package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import com.tap.daoImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class CartServlet extends HttpServlet 
{
	//	@Override
	//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	//	{
	//		
	//		HttpSession session=req.getSession();
	//		Cart cart=(Cart) session.getAttribute("cart");
	//		
	//		if(cart==null)
	//		{
	//			cart=new Cart();
	//			session.setAttribute("cart", cart);
	//		}
	//		
	//		String action=req.getParameter("action");
	//		int MenuId=Integer.parseInt(req.getParameter("MenuId"));
	//		
	//		MenuDAO menudao=null;
	//		
	//		try
	//		{
	//			menudao=new MenuDAOImpl();
	//		}
	//		catch(Exception e)
	//		{
	//			e.printStackTrace();
	//		}
	//	
	//	try
	//	{
	//		if(action.equals("add"))
	//		{
	//			Menu menuItem=menudao.menuList(MenuId);
	////			System.out.println("Lets display menuId "+menuItem);
	//			
	//			if(menuItem!=null)
	//			{
	//				int quantity=ca;
	//				CartItem cartItem=new CartItem(
	//						menuItem.getMenuId(),
	//						menuItem.getRestaurantId(), 
	//						menuItem.getName(), 
	//						quantity,
	//						menuItem.getPrice()
	//						);
	//				cart.addItem(cartItem);
	//			}
	//			else
	//			{
	//				System.out.println("Menu Item not found for MenuId: "+MenuId);
	//			}
	//		}
	//		else if("update".equals(action))
	//		{
	//			int quantity=Integer.parseInt(req.getParameter("quantity"));
	//			cart.updateItem(MenuId, quantity);
	//		}
	//		else if("remove".equals(action))
	//		{
	//			cart.removeItem(MenuId);
	//		}
	//		
	//	}
	//	catch(NumberFormatException e)
	//	{
	//	e.printStackTrace();	
	//	}
	//	
	//	session.setAttribute("cart", cart);
	//	
	//	resp.sendRedirect("Cart1.jsp");	
	////	req.getRequestDispatcher("Cart1.jsp").forward(req, resp);
	//	
	//	}

	/*

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int menuId = Integer.parseInt(request.getParameter("menuId"));
		System.out.println(menuId);
		String action = request.getParameter("action");

//		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<>();
		}

		try {
			MenuDAOImpl menudao = new MenuDAOImpl();

			Menu menu = menudao.menuList(menuId);

			if (menu != null) {
				int currentQuantity = cart.getOrDefault(menuId, 0);

				if ("increase".equals(action)) {
					cart.put(menuId, currentQuantity + 1);
				} else if ("decrease".equals(action) && currentQuantity > 0) {
					if (currentQuantity == 1) {
						cart.remove(menuId); // Remove item if quantity becomes 0
					} else {
						cart.put(menuId, currentQuantity - 1);
					}
				}
			}

			// Set the updated cart back to session
			request.setAttribute("cart", cart);

			// Calculate the cart count by summing the quantities
			int cartCount = 0;
			for (int quantity : cart.values()) {
				cartCount += quantity;
			}

			// Store cart count in session so it can be accessed on any page
			request.setAttribute("cartCount", cartCount);

			// Update menuItems in session (if not already set)
			@SuppressWarnings("unchecked")
			List<Menu> menuItems = (List<Menu>) request.getAttribute("menuItems");
			if (menuItems == null) {
				menuItems = menudao.fetchAll();
				request.setAttribute("menuItems", menuItems);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// Redirect to the previous page
		String referer = request.getHeader("");
		response.sendRedirect("Cart1.jsp");
		request.getRequestDispatcher("Cart1.jsp").forward(request,response);
	} */


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<Menu> cart = (ArrayList<Menu>) session.getAttribute("cart");

		if (cart == null) {
			cart = new ArrayList<>();
			session.setAttribute("cart", cart);
		}

		String action = req.getParameter("action");

		if ("add".equals(action)) {
			addToCart(req, resp, cart);
		} else if ("remove".equals(action)) {
			removeFromCart(req, resp, cart);
		} else if ("view".equals(action)) {
			viewCart(req, resp);
		} else {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
		}
	}

	/*private void addToCart(HttpServletRequest req, HttpServletResponse resp, ArrayList<Menu> cart)
			throws ServletException, IOException {
		try {
			int menuId = Integer.parseInt(req.getParameter("MenuId"));
			MenuDAOImpl menuDao = new MenuDAOImpl();
			Menu menuItem = menuDao.menuItem(menuId);

			if (menuItem != null) {
				cart.add(menuItem);
				req.setAttribute("message", "Item added to cart.");
			} else {
				req.setAttribute("errorMessage", "Menu item not found.");
			}

		} catch (NumberFormatException e) {
			req.setAttribute("errorMessage", "Invalid menu ID.");
		}

		viewCart(req, resp);
	}
*/
	private void removeFromCart(HttpServletRequest req, HttpServletResponse resp, ArrayList<Menu> cart)
			throws ServletException, IOException {
		try {
			int menuId = Integer.parseInt(req.getParameter("MenuId"));
			Iterator<Menu> iterator = cart.iterator();

			boolean removed = false;
			while (iterator.hasNext()) {
				Menu menuItem = iterator.next();
				if (menuItem.getMenuId() == menuId) {
					iterator.remove();
					removed = true;
					break;
				}
			}

			if (removed) {
				req.setAttribute("message", "Item removed from cart.");
			} else {
				req.setAttribute("errorMessage", "Menu item not found in the cart.");
			}

		} catch (NumberFormatException e) {
			req.setAttribute("errorMessage", "Invalid menu ID.");
		}

		viewCart(req, resp);
	}
	private void addToCart(HttpServletRequest req, HttpServletResponse resp, ArrayList<Menu> cart)
	        throws ServletException, IOException {
	    String menuIdParam = req.getParameter("MenuId");

	    if (menuIdParam == null || menuIdParam.isEmpty()) {
	        req.setAttribute("errorMessage", "Menu ID is missing or invalid.");
	        viewCart(req, resp);
	        return;
	    }

	    try {
	        int menuId = Integer.parseInt(menuIdParam);
	        MenuDAOImpl menuDao = new MenuDAOImpl();
	        Menu menuItem = menuDao.menuItem(menuId);

	        if (menuItem != null) {
	            cart.add(menuItem);
	            req.setAttribute("message", "Item added to cart.");
	        } else {
	            req.setAttribute("errorMessage", "Menu item not found.");
	        }

	    } catch (NumberFormatException e) {
	        req.setAttribute("errorMessage", "Invalid menu ID format.");
	    }

	    viewCart(req, resp);
	}


	private void viewCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("Cart.jsp").forward(req, resp);
	}
	
	
}

