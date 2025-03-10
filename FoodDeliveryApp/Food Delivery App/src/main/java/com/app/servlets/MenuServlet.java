package com.app.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.app.daoimpl.MenuDaoImpl;
import com.app.models.Menu;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		MenuDaoImpl daoImpl = new MenuDaoImpl();
		
		List<Menu> menuList = daoImpl.getMenuByRestaurant(Integer.parseInt(request.getParameter("RestaurantId")));
		request.setAttribute("menus", menuList);
		RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
		rd.forward(request, response);
		
	}

	

}
