package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.daoImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddtoCartServlet")
public class AddtoCartServlet extends HttpServlet 
{
   /* protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the cart from the session or create a new one if it doesn't exist
        HttpSession session = request.getSession();
        List<Menu> cart = (List<Menu>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Get the menuId from the request
        String menuIdStr = request.getParameter("menuId");
        int menuId = Integer.parseInt(menuIdStr);  // Convert the menuId to integer

        // Fetch the menu item by its ID
        MenuDAOImpl menuDao = new MenuDAOImpl();
        Menu menuItem = menuDao.menuItem(menuId);  // Fetch the item from the database

        if (menuItem != null) {
            // Add the menu item to the cart
            cart.add(menuItem);
        }

        // Redirect back to the MenuList.jsp or any other page to show the updated cart
        response.sendRedirect("MenuItem.jsp");
    }
    */
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
		List<Menu> cart = (List<Menu>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        String menuIdStr = request.getParameter("menuId");
        int menuId = Integer.parseInt(menuIdStr);

        MenuDAOImpl menuDao = new MenuDAOImpl();
        Menu menuItem = menuDao.menuItem(menuId);

        if (menuItem != null) {
            cart.add(menuItem);
            System.out.println("Added to cart: " + menuItem); // Debug log
            System.out.println("Current cart: " + cart);      // Debug log
        } else {
            System.out.println("Menu item not found for ID: " + menuId); // Debug log
        }

     // Inside AddtoCartServlet.java
        String referer = request.getHeader("Referer");  // Get the referring page URL
        response.sendRedirect(referer);  // Redirect back to the referring page

//        response.sendRedirect("MenuItem.jsp");
    }

} 

/*
package com.tap.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.tap.daoImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddtoCartServlet")
public class AddtoCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Menu> cart = (List<Menu>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        String menuIdStr = request.getParameter("menuId");
        int menuId = Integer.parseInt(menuIdStr);

        MenuDAOImpl menuDao = new MenuDAOImpl();
        Menu menuItem = menuDao.menuItem(menuId);

        if (menuItem != null) {
            cart.add(menuItem);
        }

        response.sendRedirect("Cart.jsp"); // Redirect to cart page
    }
}
*/

