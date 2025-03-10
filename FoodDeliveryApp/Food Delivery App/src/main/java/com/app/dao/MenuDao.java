package com.app.dao;

import java.util.List;

import com.app.models.Menu;


public interface MenuDao {
	
	void addMenu(Menu menu);
	Menu getMenu(int menuId);
	void updateMenu(Menu menu);
	void deleteMenu(int menuId);
	List<Menu> getAllMenu();
	List<Menu> getMenuByRestaurant(int restaurantId);
}
