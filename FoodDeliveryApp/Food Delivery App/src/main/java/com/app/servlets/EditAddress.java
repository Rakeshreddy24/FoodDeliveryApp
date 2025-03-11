package com.tap.servlets;

import java.io.IOException;

import com.tap.dao.UserDAO;
import com.tap.daoImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve the current session
		HttpSession session = request.getSession(false);

		// Check if the session exists and contains the userId attribute
		if (session == null || session.getAttribute("userId") == null) {
			// Redirect to the login page if the user is not authenticated
			response.sendRedirect("Cart.jsp");
			return;
		}

		// Retrieve user details from the form
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = request.getParameter("address");

		// Get the userId from the session
		int userId = (int) session.getAttribute("userId");

		// Print values for debugging
		System.out.println("Updating user: " + userId);
		System.out.println("New username: " + username);
		System.out.println("New email: " + email);
		System.out.println("New phone: " + phone);
		System.out.println("New address: " + address);

		// Create a User object with the updated details
		User updatedUser = new User(username, email, phone, address);
		updatedUser.setUserId(userId);

		// Update the user details in the database
		UserDAO userDAO = new UserDAOImpl();
		boolean isUpdated = userDAO.updateUser(updatedUser);

		if (isUpdated) {
			// Update session attributes
			session.setAttribute("username", username);
			session.setAttribute("phone", phone);
			session.setAttribute("Email", email);
			session.setAttribute("address", address);

			// Redirect to the profile page
			response.sendRedirect("Cart.jsp");
		} else {
			// Handle update failure (e.g., show an error message)
			response.getWriter().write("Error updating profile. Please try again.");
		}

	}
}
