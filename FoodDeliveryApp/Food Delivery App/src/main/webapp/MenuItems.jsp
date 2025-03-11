<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Items</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: white;
            color: #333;
            font-family: Arial, sans-serif;
            margin: 0;
            padding-top: 60px; /* Adjusted to reduce space below navbar */
        }

        .navbar {
            background-color: #0c7e2e;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 1000;
            padding: 0px 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .text-left {
            color: white;
            text-align: left;
        }

        .navbar .text-left h4 {
            margin-bottom: 0;
        }

        .navbar .nav-link {
            color: white !important;
            margin: 0 5px;
        }

        .navbar .nav-link:hover {
            color: #ffc107 !important;
        }

        .cart,
        .profile {
            position: relative;
        }

        .cart-dropdown,
        .profile-popup {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            padding: 20px;
            display: none;
            z-index: 10;
            width:220%;
            font-size:13px;
        }

        

        .container {
            margin-top: 20px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            height: 280px; /* Adjusted height */
            text-align: center;
            margin-bottom: 15px;
        }

        .card-img-top {
            height: 150px; /* Adjusted image height */
            object-fit: cover;
            border-radius: 8px 8px 0 0;
            width: 100%;
        }

        .card-body {
            font-size: 16px;
            padding: 0px;
        }

        .card-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 4px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .card-text {
            margin: 3px 0;
            font-size: 14px;
        }

        .ratings,
        .cuisine,
        .address {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .btn-primary {
            background-color: #66BB6A;
            border: none;
            font-size: 15px;
            padding: 3px 10px;
        }

        .btn-primary:hover {
            background-color: #57a25d;
        }

        footer {
            background-color: #0c7e2e;
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
        <div class="container">
            <!-- Welcome Section -->
            <div class="text-left">
                <h4>Foodie Delight</h4>
                <% 
                    String userName = (String) session.getAttribute("name");
                    String phone = (String) session.getAttribute("phone");
                    String email = (String) session.getAttribute("Email");
                    String Address = (String) session.getAttribute("address");

                    String restaurantName = (String) session.getAttribute("restaurantName");  // Get the restaurant name
                    if (restaurantName != null) {
                        out.print("Restaurant: " + restaurantName + " | ");
                    }
                 
                %>
            </div>

            <!-- Navigation Links -->
            <div>
                <a class="nav-link d-inline" href="Home2.jsp">Home</a>
                <a class="nav-link d-inline" href="Restaurant.jsp">Restaurants</a>
                <a class="nav-link d-inline" href="AboutUs.jsp">About Us</a>
                <a class="nav-link d-inline" href="Contact.jsp">Contact</a>
            </div>

            <!-- Right Section -->
            <div class="d-flex">
            
                <!-- Cart in Navbar -->
<div class="cart">
    <a class="nav-link" href="Cart.jsp" style="position: relative;">
        <img src="https://img.icons8.com/ios-filled/24/ffffff/shopping-cart.png" alt="Cart"> Cart
        <span id="cart-count" style="position: absolute; top: -5px; right: -10px; background: red; color: white; font-size: 12px; padding: 2px 6px; border-radius: 50%;">
            <%
                List<com.tap.model.Menu> cart = (List<com.tap.model.Menu>) session.getAttribute("cart");
                int itemCount = 0;
                if (cart != null) {
                    for (com.tap.model.Menu item : cart) {
                        itemCount += item.getQuantity(); // Count total quantity
                    }
                }
                out.print(itemCount);
            %>
        </span>
    </a>
</div>

                <!-- Profile -->
                <div class="profile">
                    <a class="nav-link" href="javascript:void(0);" onclick="toggleProfilePopup()">
                        <img src="https://img.icons8.com/material-outlined/24/ffffff/user.png" alt="Profile"> Profile
                    </a>
                    <div class="profile-popup" id="profile-popup">
                        <p><strong>User Details</strong></p>
                        <p><strong>Name:</strong> <% out.print(userName != null ? userName : "Guest"); %></p>
                        <p><strong>Address:</strong> <% out.print(Address != null ? Address : "Guest"); %></p>
                        <a href="Profile.jsp" class="btn btn-danger btn-sm">ViewProfile</a>
                        <a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

   <%
    List<Menu> menuItems = (List<Menu>) session.getAttribute("menuItems");
    String category = (String) session.getAttribute("category");
%>

<div class="container mt-4">
    <h4 class="text-center">Showing results for <%= category %></h4>
    <div class="row">
        <% if (menuItems != null && !menuItems.isEmpty()) { %>
            <% for (Menu item : menuItems) { %>
                <div class="col-md-3">
                    <div class="card">
                        <img src="<%= item.getImagePath() %>" class="card-img-top"  alt="<%= item.getName() %>">
                        <div class="card-body">
                            <h5 class="card-title"><%= item.getName() %></h5>
                            <p class="card-text"><%= item.getDescription() %></p>
                            <p class="card-text"><strong>₹<%= item.getPrice() %></strong></p>
                            
                        <form action="AddtoCartServlet" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                            <button type="submit" class="btn btn-success">Add to Cart</button>
                        </form>
                        
                        </div>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <p class="text-center text-danger">No items available for this category.</p>
        <% } %>
    </div>
</div>
   
    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Foodie Delight. All Rights Reserved.</p>
    </footer>

<script>
    function toggleProfilePopup() {
        var popup = document.getElementById("profile-popup");
        popup.style.display = (popup.style.display === "block") ? "none" : "block";
    }

    // Hide profile popup when clicking outside
    document.addEventListener("click", function (event) {
        var popup = document.getElementById("profile-popup");
        var profileIcon = document.querySelector(".profile a");

        if (popup.style.display === "block" && !popup.contains(event.target) && !profileIcon.contains(event.target)) {
            popup.style.display = "none";
        }
    });
</script>
    
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>