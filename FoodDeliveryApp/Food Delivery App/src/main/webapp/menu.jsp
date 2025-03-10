<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.app.models.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Menu</title>
    <link rel="stylesheet" href="css/menu.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
    <header>
        <a href="home.html"><p><span style="color: #EB5B00;">Quick</span>Bites</p></a>
        <div class="cart-div">
            <a href="cart.jsp"><i class="fa-solid fa-cart-shopping" style="color: #ffffff;"></i></a>
        </div>
    </header>

    <section class="menu poppins-font">
        <h1>MENU</h1>
        
        <% 
        // ✅ Get restaurantId from request parameter
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        List<Menu> menuList = (List<Menu>) request.getAttribute("menus");

        if (menuList != null && !menuList.isEmpty()) {
            for(Menu m : menuList) {
        %>
        
        <div class="menu-item">
            <div class="menu-details">
                <h3><%= m.getItemName() %></h3>
                <p><%= m.getDescription() %></p>
                <span>$<%= m.getPrice() %></span>
            </div>
            <div class="menu-image">
                <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/a0908b7d05406a9170b7a30ac20210b5" alt="Food Item">
                
                <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="<%= m.getMenuId() %>">
                    <input type="hidden" name="name" value="<%= m.getItemName() %>">
                    <input type="hidden" name="price" value="<%= m.getPrice() %>">
                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>"> <!-- ✅ Ensure restaurant ID is passed -->
                    <input type="number" name="quantity" value="1" min="1">
                    <button type="submit" class="add-to-cart poppins-font">Add to Cart</button>
                </form>
            </div>
        </div>
    
        <% 
            } 
        } else {
        %>
            <p style="color:white;">No items available in the menu.</p>
        <% 
        } 
        %>
    </section>
</body>
</html>
