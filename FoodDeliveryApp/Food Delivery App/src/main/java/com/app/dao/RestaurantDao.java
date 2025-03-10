package com.app.dao;

import java.util.List;

import com.app.models.Restaurant;

public interface RestaurantDao {
	
	void addRestaurant(Restaurant Restaurant);
	Restaurant getRestaurant(int restaurantId);
	void updateRestaurant(Restaurant restaurant);
	void deleteRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurants();
}
