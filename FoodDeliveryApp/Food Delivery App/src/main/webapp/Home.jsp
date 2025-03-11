<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RestaurantHome</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 <style>
        .card {
            margin: 10px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .card-body {
            text-align: center;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .card-text {
            font-size: 1rem;
            color: #666;
        }
        .ratings {
            color: gold;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Restaurant Listings</h2>
    <div class="row">
        <!-- Loop through the list of restaurants and display each in a card -->
        <c:forEach var="restaurant" items="${restaurantList}">
            <div class="col-md-4">
                <div class="card">
                    <img class="card-img-top" src="${restaurant.ImagePath}" alt="${restaurant.Name}">
                    <div class="card-body">
                        <h5 class="card-title">${restaurant.Name}</h5>
                        <p class="card-text">${restaurant.CuisineType}</p>
                        <p class="card-text">Delivery Time: ${restaurant.DeliveryTime} minutes</p>
                        <p class="card-text">Address: ${restaurant.Address}</p>
                        <p class="card-text">
                            <span class="ratings">
                                <i class="fas fa-star"></i> ${restaurant.Ratings}
                            </span>
                        </p>
                        <a href="#" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

	<!--  <h1>
		HELLO
		<%
		out.println(request.getAttribute("name"));
	%>
	</h1>
	
	<table border="1px Green">
	<tr><td>Email: </td>
	<td><%out.println(request.getAttribute("Email"));%></td><tr>
	
	<tr><td>Address:</td>
	<td><%out.println(request.getAttribute("address"));%></td></tr>
	
	<tr><td>Mobile:</td>
	<td><%out.println(request.getAttribute("phone"));%></td></tr>

	</table> -->
	
</html>