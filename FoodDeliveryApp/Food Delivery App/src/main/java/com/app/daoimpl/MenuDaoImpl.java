package com.app.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.MenuDao;
import com.app.models.Menu;
import com.app.utilities.DBconnection;

public class MenuDaoImpl implements MenuDao {

    @Override
    public void addMenu(Menu menu) {
        String query = "INSERT INTO Menu (restaurantId, itemName, description, price, isAvailable, ratings, imagePath) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setBoolean(5, menu.isAvailable());
            ps.setDouble(6, menu.getRatings());
            ps.setString(7, menu.getImagePath());
            
            ps.executeUpdate();
            System.out.println("Menu added successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {
        String query = "SELECT * FROM Menu WHERE menuId = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return new Menu(
                    rs.getInt("menuId"),
                    rs.getInt("restaurantId"),
                    rs.getString("itemName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getBoolean("isAvailable"),
                    rs.getDouble("ratings"),
                    rs.getString("imagePath")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    @Override
    public void updateMenu(Menu menu) {
        String query = "UPDATE Menu SET restaurantId = ?, itemName = ?, description = ?, price = ?, isAvailable = ?, ratings = ?, imagePath = ? WHERE menuId = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setBoolean(5, menu.isAvailable());
            ps.setDouble(6, menu.getRatings());
            ps.setString(7, menu.getImagePath());
            ps.setInt(8, menu.getMenuId());
            
            ps.executeUpdate();
            System.out.println("Menu updated successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @Override
    public void deleteMenu(int menuId) {
        String query = "DELETE FROM Menu WHERE menuId = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, menuId);
            ps.executeUpdate();
            System.out.println("Menu deleted successfully!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public List<Menu> getAllMenu() {
        List<Menu> menuList = new ArrayList<>();
        String query = "SELECT * FROM Menu";
        try (Connection con = DBconnection.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Menu menu = new Menu(
                    rs.getInt("menuId"),
                    rs.getInt("restaurantId"),
                    rs.getString("itemName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getBoolean("isAvailable"),
                    rs.getDouble("ratings"),
                    rs.getString("imagePath")
                );
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    @Override
    public List<Menu> getMenuByRestaurant(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();
        String query = "SELECT * FROM Menu WHERE restaurantId = ?";

        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            
            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Menu menu = new Menu(
                    rs.getInt("menuId"),
                    rs.getInt("restaurantId"),
                    rs.getString("itemName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getBoolean("isAvailable"),
                    rs.getDouble("ratings"),
                    rs.getString("imagePath")
                );
                menuList.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
}
