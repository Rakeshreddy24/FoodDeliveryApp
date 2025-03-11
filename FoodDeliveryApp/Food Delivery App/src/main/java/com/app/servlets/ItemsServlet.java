package com.tap.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ItemsServlet extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        List<Menu> menuItems = new ArrayList<>();
        
        HttpSession session=request.getSession();

        if (category != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Sasi@1919");

                
                String sql = "SELECT * FROM menu WHERE Name LIKE ?";

                // Prepare the statement and set the parameter for the LIKE query
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, "%" + category + "%");  // Add % around the category

                // Output the SQL query for debugging (optional)
                System.out.println("SQL Query: " + ps.toString());
                
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    Menu item = new Menu();
                    item.setMenuId(rs.getInt("MenuId"));
                    item.setRestaurantId(rs.getInt("RestaurantId"));
                    item.setName(rs.getString("Name"));
                    item.setDescription(rs.getString("Description"));
                    item.setPrice(rs.getInt("Price"));
                    item.setImagePath(rs.getString("ImagePath"));
                    item.setIsAvailable(rs.getByte("isAvailable"));
                    menuItems.add(item);
                }

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        
        System.out.println("Total items fetched: " + menuItems.size());  
        
        // Send the menuItems list to JSP
        session.setAttribute("menuItems", menuItems);
        session.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("MenuItems.jsp");
        dispatcher.forward(request, response);
    }
}
