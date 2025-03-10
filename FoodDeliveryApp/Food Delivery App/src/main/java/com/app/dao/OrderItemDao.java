package com.app.dao;

import java.util.List;

import com.app.models.OrderItem;

public interface OrderItemDao {	
	
	void addOrderItem(OrderItem orderItem);
	OrderItem getOrderItem(int orderItemId);
	void updateOrderItem(OrderItem orderItem);
	void deleteOrderItem(int orderItemId);
	List<OrderItem> getAllOrderItems();

}
