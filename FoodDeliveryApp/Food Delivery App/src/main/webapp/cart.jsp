<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, com.app.models.Cart, com.app.models.CartItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <a href="/Food_Delivery_App"><p><span style="color: #EB5B00;">Quick</span>Bites</p></a>
        <div class="cart-div">
            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
            <a href="#"><i class="fa-solid fa-user" style="color: #ffffff;"></i></a>
        </div>
    </header>

    <section class="cart poppins-font">
        <h2>Your Cart</h2>

        <%
            Cart cart = (Cart) session.getAttribute("cart");
            double totalPrice = 0;
            Integer restaurantId = (Integer) session.getAttribute("restaurantId"); // Get restaurantId

            if (cart != null && !cart.getCartItems().isEmpty()) {
                for (Map.Entry<Integer, CartItem> entry : cart.getCartItems().entrySet()) {
                    CartItem item = entry.getValue();
                    int itemId = item.getId();
                    String itemName = item.getName();
                    double price = item.getPrice();
                    int quantity = item.getQuantity();
                    totalPrice += (price * quantity);
        %>
        <div class="cart-item" style="display: flex; align-items: center; gap: 20px; margin-bottom: 15px;">
            <div class="item-details" style="display: flex; align-items: center; gap: 15px;">
                <img src="https://via.placeholder.com/100" alt="<%= itemName %>" style="width: 80px; height: 80px; border-radius: 10px;">
                <div class="item-info">
                    <h3 style="margin: 0; font-size: 18px;"><%= itemName %></h3>
                    <span style="color: #555;">$<%= String.format("%.2f", price) %></span>
                </div>
            </div>

            <!-- Quantity Controls -->
            <div style="display: flex; align-items: center; gap: 10px;">
                <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= itemId %>">
                    <button type="submit" name="quantity" value="<%= quantity - 1 %>">-</button>
                </form>

                <input type="number" class="quantity-input" value="<%= quantity %>" min="1" readonly>

                <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= itemId %>">
                    <button type="submit" name="quantity" value="<%= quantity + 1 %>">+</button>
                </form>
            </div>

            <form action="CartServlet" method="post">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="id" value="<%= itemId %>">
                <button type="submit" class="remove-item">Remove</button>
            </form>
        </div>
        <% 
                }
            } else { 
        %>
        <p>Your cart is empty.</p>
        <% } %>

        <div class="cart-summary">
            <p><strong>Total Price:</strong> $<%= String.format("%.2f", totalPrice) %></p>

            <form action="checkout.jsp" method="post">
                <button type="submit" class="checkout">Proceed to Checkout</button>
            </form>

            <%
                String menuPageUrl = (restaurantId != null) ? "menu.jsp?restaurantId=" + restaurantId : "menu.jsp";
            %>
            <a href="<%= menuPageUrl %>">
                <button class="add-more-items">Add More Items</button>
            </a>
        </div>
    </section>
</body>
</html>
