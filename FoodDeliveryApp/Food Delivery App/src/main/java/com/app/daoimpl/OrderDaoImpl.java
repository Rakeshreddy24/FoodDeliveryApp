package com.app.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.app.dao.OrderDao;
import com.app.models.Order;
import com.app.utilities.DBconnection;

public class OrderDaoImpl implements OrderDao {

    @Override
    public void addOrder(Order order) {
        Connection connection = DBconnection.getConnection();
        String INSERT_ORDER = "INSERT INTO `orders`(`restaurantId`, `userId`, `orderDate`, `amount`, `status`, `paymentMode`) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = connection.prepareStatement(INSERT_ORDER)) {
            pstmt.setInt(1, order.getRestaurantId());
            pstmt.setInt(2, order.getUserId());
            pstmt.setTimestamp(3, new java.sql.Timestamp(order.getOrderDate().getTime())); // Convert Date to Timestamp
            pstmt.setDouble(4, order.getAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymentMode());

            int i = pstmt.executeUpdate();
            System.out.println(i + " order(s) added.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Order getOrder(int orderId) {
        Connection connection = DBconnection.getConnection();
        String GET_ORDER = "SELECT * FROM `orders` WHERE `orderId` = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(GET_ORDER)) {
            pstmt.setInt(1, orderId);
            ResultSet res = pstmt.executeQuery();
            if (res.next()) {
                return new Order(
                    res.getInt("orderId"),
                    res.getInt("restaurantId"),
                    res.getInt("userId"),
                    new Date(res.getTimestamp("orderDate").getTime()), // Convert Timestamp to Date
                    res.getDouble("amount"),
                    res.getString("status"),
                    res.getString("paymentMode")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateOrder(Order order) {
        Connection connection = DBconnection.getConnection();
        String UPDATE_ORDER = "UPDATE `orders` SET `restaurantId` = ?, `userId` = ?, `orderDate` = ?, `amount` = ?, `status` = ?, `paymentMode` = ? WHERE `orderId` = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_ORDER)) {
            pstmt.setInt(1, order.getRestaurantId());
            pstmt.setInt(2, order.getUserId());
            pstmt.setTimestamp(3, new java.sql.Timestamp(order.getOrderDate().getTime())); // Convert Date to Timestamp
            pstmt.setDouble(4, order.getAmount());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getPaymentMode());
            pstmt.setInt(7, order.getOrderId());

            int i = pstmt.executeUpdate();
            System.out.println(i + " order(s) updated.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int orderId) {
        Connection connection = DBconnection.getConnection();
        String DELETE_ORDER = "DELETE FROM `orders` WHERE `orderId` = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(DELETE_ORDER)) {
            pstmt.setInt(1, orderId);
            int i = pstmt.executeUpdate();
            System.out.println(i + " order(s) deleted.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        Connection connection = DBconnection.getConnection();
        String GET_ALL_ORDERS = "SELECT * FROM `orders`";

        try (PreparedStatement pstmt = connection.prepareStatement(GET_ALL_ORDERS);
             ResultSet res = pstmt.executeQuery()) {
            while (res.next()) {
                orders.add(new Order(
                    res.getInt("orderId"),
                    res.getInt("restaurantId"),
                    res.getInt("userId"),
                    new Date(res.getTimestamp("orderDate").getTime()), // Convert Timestamp to Date
                    res.getDouble("amount"),
                    res.getString("status"),
                    res.getString("paymentMode")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
