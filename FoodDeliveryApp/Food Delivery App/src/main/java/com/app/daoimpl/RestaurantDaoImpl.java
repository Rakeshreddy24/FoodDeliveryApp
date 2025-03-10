package com.app.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.RestaurantDao;
import com.app.models.Restaurant;
import com.app.utilities.DBconnection;

public class RestaurantDaoImpl implements RestaurantDao {

    @Override
    public void addRestaurant(Restaurant restaurant) {
        String query = "INSERT INTO restaurant (name, address, phoneNumber, cuisineType, deliveryTime, adminUserId, rating, isActive, imagePath) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {

            statement.setString(1, restaurant.getName());
            statement.setString(2, restaurant.getAddress());
            statement.setString(3, restaurant.getPhoneNumber());
            statement.setString(4, restaurant.getCuisineType());
            statement.setInt(5, restaurant.getDeliveryTime());
            statement.setInt(6, restaurant.getAdminUserId());
            statement.setInt(7, restaurant.getRating());
            statement.setBoolean(8, restaurant.isActive());
            statement.setString(9, restaurant.getImagePath());

            int affectedRows = statement.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int generatedId = generatedKeys.getInt(1);
                    restaurant.setRestaurantId(generatedId);
                    System.out.println("Restaurant added successfully with ID: " + generatedId);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {
        String query = "SELECT * FROM restaurant WHERE restaurantId = ?";
        Restaurant restaurant = null;

        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, restaurantId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                restaurant = new Restaurant(
                        resultSet.getInt("restaurantId"),
                        resultSet.getString("name"),
                        resultSet.getString("address"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("cuisineType"),
                        resultSet.getInt("deliveryTime"),
                        resultSet.getInt("adminUserId"),
                        resultSet.getInt("rating"),
                        resultSet.getBoolean("isActive"),
                        resultSet.getString("imagePath")
                );
                System.out.println("Debug: Retrieved Restaurant ID: " + restaurant.getRestaurantId());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    @Override
    public void updateRestaurant(Restaurant restaurant) {
        String query = "UPDATE restaurant SET name = ?, address = ?, phoneNumber = ?, cuisineType = ?, deliveryTime = ?, " +
                       "adminUserId = ?, rating = ?, isActive = ?, imagePath = ? WHERE restaurantId = ?";

        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, restaurant.getName());
            statement.setString(2, restaurant.getAddress());
            statement.setString(3, restaurant.getPhoneNumber());
            statement.setString(4, restaurant.getCuisineType());
            statement.setInt(5, restaurant.getDeliveryTime());
            statement.setInt(6, restaurant.getAdminUserId());
            statement.setInt(7, restaurant.getRating());
            statement.setBoolean(8, restaurant.isActive());
            statement.setString(9, restaurant.getImagePath());
            statement.setInt(10, restaurant.getRestaurantId());

            statement.executeUpdate();
            System.out.println("Restaurant updated successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int restaurantId) {
        String query = "DELETE FROM restaurant WHERE restaurantId = ?";

        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, restaurantId);
            statement.executeUpdate();
            System.out.println("Restaurant deleted successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        String query = "SELECT * FROM restaurant";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection connection = DBconnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Restaurant restaurant = new Restaurant(
                        resultSet.getInt("restaurantId"),
                        resultSet.getString("name"),
                        resultSet.getString("address"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("cuisineType"),
                        resultSet.getInt("deliveryTime"),
                        resultSet.getInt("adminUserId"),
                        resultSet.getInt("rating"),
                        resultSet.getBoolean("isActive"),
                        resultSet.getString("imagePath")
                );
                restaurants.add(restaurant);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurants;
    }
}
