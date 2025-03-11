<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.*,com.tap.model.Restaurant" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>HELLO<% out.println(request.getAttribute("name")); %></h1>

<% List<Restaurant> RestaurantList=(List<Restaurant>)request.getAttribute("RestaurantList"); %>

<table>
<th>
<tr>
	<td>RestaurantId</td>
	<td>RestaurantName</td>
	<td>CuisineType</td>
	<td>DeliveryTime</td>
	<td>Address</td>
	<td>Ratings</td>
	<td>isActive</td>
	<td>ImagePath</td>
</tr>
</th>

<% 
 for(Restaurant r:RestaurantList)
	{
	%>
	<tr>
		<td><% out.println(r.getRestaurantId());%></td>
		<td><%= r.getName() %></td>
		<td><%= r.getCuisineType()%></td>
		<td><%= r. getDeliveryTime() %></td>
		<td><%= r.getAddress() %></td>
		<td><%= r. getRatings() %></td>
		<td><%= r.getImagePath()%></td>
	</tr>
	<% 
	
	}
	%>
	
</table>
</body>
</html>