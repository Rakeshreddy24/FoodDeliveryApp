package com.tap.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.tap.dbutil.DBConnection;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PaymentServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the userId from the session
		Integer userId = (Integer) request.getSession().getAttribute("userId");

		// Check if the userId is null
		if (userId == null) {
			// If userId is null, redirect the user to the login page or show an error
			response.sendRedirect("login.jsp");  // Or show an error message
			return;
		}

		// Get cart items from session
		List<Menu> cart = (List<Menu>) request.getSession().getAttribute("cart");
		String paymentMethod = request.getParameter("paymentMethod");
		double totalAmount = 0;
		
		

		// Database connection variables
		Connection conn = null;
		PreparedStatement stmt = null;

		if (cart != null && !cart.isEmpty()) {
			try {
				// Get a database connection
				conn = DBConnection.connect();

				// Prepare SQL to insert order details into 'orderhistory'
				String sql = "INSERT INTO ordershistory (userId, MenuId, quantity, totalAmount, paymentMethod) VALUES (?, ?, ?, ?, ?)";

				// Loop through the cart and insert each item into the order history
				for (Menu item : cart) {
					totalAmount += item.getPrice() * item.getQuantity();

					stmt = conn.prepareStatement(sql);
					stmt.setInt(1, userId);  // Set the userId to the session userId
					stmt.setInt(2, item.getMenuId());  // MenuId
					stmt.setInt(3, item.getQuantity());  // Quantity
					stmt.setDouble(4, item.getPrice() * item.getQuantity());  // Total amount for this item
					stmt.setString(5, paymentMethod);  // Payment method

					stmt.executeUpdate();  // Execute the insertion
				}

				// After inserting into orderhistory, clear the cart from session
				request.getSession().removeAttribute("cart");

				// Redirect to ordersuccess.jsp after successful insertion
				response.sendRedirect("OrderPlaced.jsp");

			} catch (SQLException e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing payment");
			} finally {
				try {
					if (stmt != null) stmt.close();
					if (conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
			// If cart is empty, redirect to the menu page
			response.sendRedirect("MenuItem.jsp");
		}
	}
}


