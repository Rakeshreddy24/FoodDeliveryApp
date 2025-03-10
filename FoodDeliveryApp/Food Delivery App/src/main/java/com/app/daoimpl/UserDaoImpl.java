package com.app.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.UserDao;
import com.app.enums.Role;
import com.app.models.User;
import com.app.utilities.DBconnection;

public class UserDaoImpl implements UserDao {
	
	@Override
	public void addUser(User user) {
		
		Connection connection = DBconnection.getConnection();
		String INSERT_USER = "INSERT INTO `user`(`name`,`userName`,"
				+ "`password`,`email`,`phoneNumber`,`address`,`role`)"
				+ " values(?,?,?,?,?,?,?)";
		try {
			
			PreparedStatement pstmt = connection.prepareStatement(INSERT_USER);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUserName() );
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail() );
			pstmt.setString(5, user.getPhoneNumber());
			pstmt.setString(6, user.getAddress() );
			pstmt.setString(7, user.getRole().name());
			
			int i = pstmt.executeUpdate();
			System.out.println(i+" rows affected");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public User getUser(int userId) {
		
		Connection connection = DBconnection.getConnection();
		String GET_USER_BY_ID = "SELECT * from `user` WHERE `userId` = ? ";
		
		try {
			PreparedStatement pstmt = connection.prepareStatement(GET_USER_BY_ID);
			pstmt.setInt(1, userId);
			
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				int id = res.getInt(1);
				String name = res.getString(2);
				String userName = res.getString(3);
				String password = res.getString(4);
				String email = res.getString(5);
				String phoneNumber = res.getString(6);
				String address = res.getString(7);
				String r = res.getString(8);
				Role role = Role.valueOf(r);
				
				User user = new User();
	            user.setUserId(id);
	            user.setName(name);
	            user.setUserName(userName);
	            user.setPassword(password);
	            user.setEmail(email);
	            user.setPhoneNumber(phoneNumber);
	            user.setAddress(address);
	            user.setRole(role); 

	            return user; 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateUser(User user) {
		Connection connection = DBconnection.getConnection();
        String UPDATE_USER = "UPDATE `user` SET `name` = ?, `userName` = ?, `password` = ?, `email` = ?, `phoneNumber` = ?, `address` = ?, `role` = ? WHERE `userId` = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_USER)) {
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getUserName());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getPhoneNumber());
            pstmt.setString(6, user.getAddress());
            pstmt.setString(7, user.getRole().name());
            pstmt.setInt(8, user.getUserId());
            System.out.println("Updating user with ID: " + user.getUserId());
            int i = pstmt.executeUpdate();
            System.out.println(i + " rows updated");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

	@Override
	public void deleteUser(int userId) {
		
		Connection connection = DBconnection.getConnection();
        String DELETE_USER = "DELETE FROM `user` WHERE `userId` = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(DELETE_USER)) {
            pstmt.setInt(1, userId);
            int i = pstmt.executeUpdate();
            System.out.println(i + " rows deleted");
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}

	@Override
	public List<User> getAllUsers() {
		
		 	List<User> users = new ArrayList<User>();
		 	
	        Connection connection = DBconnection.getConnection();
	        String GET_ALL_USERS = "SELECT * FROM `user`";
	        
	        try (PreparedStatement pstmt = connection.prepareStatement(GET_ALL_USERS)) {
	            ResultSet res = pstmt.executeQuery();
	            
	            while (res.next()) {
	                int id = res.getInt(1);
	                String name = res.getString(2);
	                String userName = res.getString(3);
	                String password = res.getString(4);
	                String email = res.getString(5);
	                String phoneNumber = res.getString(6);
	                String address = res.getString(7);
	                String roleString = res.getString(8);
	                Role role = Role.valueOf(roleString); 
	                																										
	                User user = new User();
	                user.setUserId(id);
	                user.setName(name);
	                user.setUserName(userName);
	                user.setPassword(password);
	                user.setEmail(email);
	                user.setPhoneNumber(phoneNumber);
	                user.setAddress(address);
	                user.setRole(role);
	                
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return users;
	    }
		
	}
