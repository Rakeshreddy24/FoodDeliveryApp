<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="com.tap.main.Cart" %>
<%@ page import ="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .cart-container {
            max-width: 800px;
            margin: 20px auto;
        }
        .cart-item {
            margin-bottom: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #66BB6A;
            color: white;
            font-size: 1.2rem;
            font-weight: bold;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        .quantity-controls {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .quantity-controls button {
            width: 30px;
            height: 30px;
            border: none;
            background-color: #66BB6A;
            color: white;
            font-weight: bold;
            border-radius: 50%;
            margin: 0 5px;
        }
        .quantity-controls button:hover {
            background-color: #5a6268;
        }
        .total-price {
            font-size: 1.2rem;
            font-weight: bold;
            text-align: right;
        }
        .empty {
            text-align: center;
            margin-top: 50px;
        }
        .empty a {
            text-decoration: none;
        }
        .back-btn {
            margin-top: 20px;
            background-color: #66BB6A;
    
        }
        
    </style>
</head>
<body>
    <div class="container cart-container">
        <h1 class="text-center mb-4">Your Cart</h1>
        <div class="row">
            <%
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null || cart.getItems().isEmpty()) {
            %>
            <!-- If the cart is empty -->
            <div class="empty">
                <p class="text-muted">Your cart is empty.</p>
                <a href="GetAllRestaurants" class="btn btn-primary">Browse Menu</a>
            </div>
            <%
                } else {
                    int totalAmount = 0;
                    for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
                        CartItem item = entry.getValue();
                        totalAmount += item.getPrice() * item.getQuantity();
            %>
            <!-- Display cart items in cards -->
            <div class="col-12 cart-item">
                <div class="card">
                    <div class="card-header"><%= item.getName() %></div>
                    <div class="card-body">
                        <p><strong>Price:</strong> ₹<%= item.getPrice() %></p>
                        <p><strong>Total:</strong> ₹<%= item.getPrice() * item.getQuantity() %></p>
                        <div class="quantity-controls">
                            <form action="CartServlet"  style="display:inline-block;">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="MenuId" value="<%= item.getMenuId() %>">
                                <button type="submit" name="quantity" value="<%= item.getQuantity() - 1 %>">-</button>
                            </form>
                            <span class="mx-2"><%= item.getQuantity() %></span>
                            <form action="CartServlet"  style="display:inline-block;">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="MenuId" value="<%= item.getMenuId() %>">
                                <button type="submit" name="quantity" value="<%= item.getQuantity() + 1 %>">+</button>
                            </form>
                        </div>
                        <form action="CartServlet" class="mt-3">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="MenuId" value="<%= item.getMenuId() %>">
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
            %>
            <!-- Total Amount and Back to Menu Button -->
            <div class="col-12 mt-4">
                <div class="total-price">
                    Total Amount: ₹<%= totalAmount %>
                </div>
                <a href="GetAllRestaurants" class="btn btn-secondary back-btn">Browse Menu</a>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
