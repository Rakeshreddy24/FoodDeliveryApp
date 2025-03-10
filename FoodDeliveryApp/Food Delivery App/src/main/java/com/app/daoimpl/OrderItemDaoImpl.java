package com.app.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.OrderItemDao;
import com.app.models.OrderItem;
import com.app.utilities.DBconnection;

public class OrderItemDaoImpl implements OrderItemDao {

    @Override
    public void addOrderItem(OrderItem orderItem) {
        String query = "INSERT INTO orderitem (orderid, menuid, quantity, totalamount) VALUES (?, ?, ?, ?)";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getTotalAmount());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        String query = "SELECT * FROM orderitem WHERE orderitemid = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new OrderItem(
        
                        rs.getInt("orderid"),
                        rs.getInt("menuid"),
                        rs.getInt("quantity"),
                        rs.getDouble("totalamount")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        String query = "UPDATE orderitem SET orderid = ?, menuid = ?, quantity = ?, totalamount = ? WHERE orderitemid = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getTotalAmount());
            ps.setInt(5, orderItem.getOrderItemId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        String query = "DELETE FROM orderitem WHERE orderitemid = ?";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderItemId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> orderItems = new ArrayList<>();
        String query = "SELECT * FROM orderitem";
        try (Connection con = DBconnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                orderItems.add(new OrderItem(
                       
                        rs.getInt("orderid"),
                        rs.getInt("menuid"),
                        rs.getInt("quantity"),
                        rs.getDouble("totalamount")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderItems;
    }
}
