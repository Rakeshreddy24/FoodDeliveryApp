package com.tap.servlets;



import java.io.IOException;
import java.util.List;

import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet 
{protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    List<Menu> cart = (List<Menu>) session.getAttribute("cart");

    if (cart == null) {
        response.sendRedirect("Cart.jsp");
        return;
    }

    int menuId = Integer.parseInt(request.getParameter("menuId"));
    String action = request.getParameter("action");

    // Find the item in the cart
    Menu itemToUpdate = null;
    for (Menu item : cart) {
        if (item.getMenuId() == menuId) {
            itemToUpdate = item;
            break;
        }
    }

    if (itemToUpdate != null) {
        switch (action) {
            case "increase":
                itemToUpdate.setQuantity(itemToUpdate.getQuantity() + 1);
                break;
            case "decrease":
                if (itemToUpdate.getQuantity() > 1) 
                {
                    itemToUpdate.setQuantity(itemToUpdate.getQuantity() - 1);
                } else {
                    cart.remove(itemToUpdate);
                }
                break;
            case "remove":
                cart.remove(itemToUpdate);
                break;
        }
    }

    session.setAttribute("cart", cart);
    response.sendRedirect("Cart.jsp");
}
	
	/*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Menu> cart = (List<Menu>) session.getAttribute("cart");

		if (cart == null) {
			response.sendRedirect("MenuItem.jsp");
			return;
		}

		int menuId = Integer.parseInt(request.getParameter("menuId"));
		
		System.out.println(menuId);
		
		String action = request.getParameter("action");

		for (Menu item : cart) {
			if (item.getMenuId() == menuId) {
				if ("increment".equals(action)) {
					item.setQuantity(item.getQuantity() + 1);
				} else if ("decrement".equals(action)) {
					item.setQuantity(item.getQuantity() - 1);
					if (item.getQuantity() <= 0) {
						cart.remove(item);
					}
				}
				break;
			}
		}

		// Update total price
		int totalPrice = 0;
		for (Menu item : cart) {
			totalPrice += item.getPrice() * item.getQuantity();
		}
		
		System.out.println(totalPrice);
		session.setAttribute("totalPrice", totalPrice);

		// Redirect back to the cart page
		response.sendRedirect("Cart.jsp");
	}*/
}
