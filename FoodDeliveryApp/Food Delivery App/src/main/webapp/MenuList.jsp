<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Items</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: white;
            color: #333;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background-color: #66BB6A;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: white;
            margin: 0 15px;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card-img-top {
            height: 150px;
            object-fit: cover;
            border-radius: 8px 8px 0 0;
        }

        .card-body {
            padding: 15px;
        }

        .btn-primary {
            background-color: #66BB6A;
            border: none;
        }

        .btn-primary:hover {
            background-color: #d81b60;
        }

        .footer {
            background-color: #66BB6A;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 30px;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="Home">Foodie Delight</a>
        </div>
    </nav>

    <div class="container">
        <h1 class="text-center mb-4">Menu Items</h1>

        <div class="row">
            <%
                List<Menu> menuItems = (List<Menu>) request.getAttribute("menuItems");
                String errorMessage = (String) request.getAttribute("errorMessage");

                if (menuItems != null && !menuItems.isEmpty()) {
                    for (Menu menu : menuItems) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="<%= menu.getImagePath() %>" class="card-img-top" alt="<%= menu.getName() %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= menu.getName() %></h5>
                        <p class="card-text"><strong>Price:</strong> ₹<%= menu.getPrice() %></p>
                        <p class="card-text"><%= menu.getDescription() %></p>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="menuid" value="<%= menu.getMenuId() %>">
                            <button type="submit" name="action" value="increase" class="btn btn-primary">Add to Cart</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                    }
                } else if (errorMessage != null) {
            %>
            <div class="col-12">
                <p class="text-center text-danger"><%= errorMessage %></p>
            </div>
            <%
                } else {
            %>
            <div class="col-12">
                <p class="text-center text-danger">No menu items available.</p>
            </div>
            <%
                }
            %>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2025 Foodie Delight. All Rights Reserved.</p>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
