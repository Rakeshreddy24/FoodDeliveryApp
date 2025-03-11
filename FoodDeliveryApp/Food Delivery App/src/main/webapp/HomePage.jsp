<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foodie Delight - Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: white;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding-top: 70px;
        }

        .navbar {
            background-color: #66BB6A;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            padding: 5px 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-title {
            font-size: 28px;
            font-weight: bold;
            color: white;
            text-align: center;
        }

        .nav-link {
            color: white !important;
            margin: 0 5px;
        }

        .nav-link:hover {
            color: #ffc107 !important;
        }

        .search-bar {
            margin: 20px 0;
        }

        .offer-section {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .food-items img {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }

        footer {
            background-color: #66BB6A;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 30px;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container d-flex justify-content-between align-items-center">
            <!-- Left Section -->
            <div class="text-white text-left">
                <% 
                    String userName = (String) session.getAttribute("name");
                    if (userName != null) {
                        out.print("Welcome, " + userName + "<br><span class='navbar-title'>Foodie Delight</span>");
                    } else {
                        out.print("Welcome, Guest<br><span class='navbar-title'>Foodie Delight</span>");
                    }
                %>
            </div>

            <!-- Centered Navigation Links -->
            <div>
                <a class="nav-link d-inline" href="Home3.jsp">Home</a>
                <a class="nav-link d-inline" href="Home3.jsp">Restaurants</a>
                <a class="nav-link d-inline" href="AboutUs">About Us</a>
                <a class="nav-link d-inline" href="Contact">Contact</a>
            </div>

            <!-- Right Section -->
            <div class="d-flex">
                <!-- Cart -->
                <div class="cart">
                    <a class="nav-link" href="#">
                        <img src="https://img.icons8.com/ios-filled/24/ffffff/shopping-cart.png" alt="Cart"> Cart
                    </a>
                </div>

                <!-- Profile -->
                <div class="profile">
                    <a class="nav-link" href="#">
                        <img src="https://img.icons8.com/material-outlined/24/ffffff/user.png" alt="Profile"> Profile
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Search Bar -->
        <div class="search-bar text-center">
            <input type="text" class="form-control w-50 d-inline-block" placeholder="Search for restaurants or dishes...">
            <button class="btn btn-success">Search</button>
        </div>

        <!-- Offers Section -->
        <div class="offer-section text-center">
            <h2>Special Offers</h2>
            <p>Check out the best deals and discounts available today!</p>
            <div class="row">
                <div class="col-md-4">
                    <img src="https://via.placeholder.com/150" class="img-fluid rounded" alt="Offer 1">
                    <p>50% off on Italian Cuisine</p>
                </div>
                <div class="col-md-4">
                    <img src="https://via.placeholder.com/150" class="img-fluid rounded" alt="Offer 2">
                    <p>Buy 1 Get 1 Free on Pizzas</p>
                </div>
                <div class="col-md-4">
                    <img src="https://via.placeholder.com/150" class="img-fluid rounded" alt="Offer 3">
                    <p>Free Delivery on Orders Above $20</p>
                </div>
            </div>
        </div>

        <!-- Food Items Section -->
        <div class="food-items">
            <h2>Popular Food Items</h2>
            <div class="d-flex align-items-center mb-3">
                <img src="https://via.placeholder.com/80" alt="Food Item 1">
                <p><strong>Margherita Pizza</strong> - A classic Italian delight.</p>
            </div>
            <div class="d-flex align-items-center mb-3">
                <img src="https://via.placeholder.com/80" alt="Food Item 2">
                <p><strong>Sushi Platter</strong> - Fresh and delicious sushi rolls.</p>
            </div>
            <div class="d-flex align-items-center mb-3">
                <img src="https://via.placeholder.com/80" alt="Food Item 3">
                <p><strong>Cheeseburger</strong> - Juicy and cheesy perfection.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Foodie Delight. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
