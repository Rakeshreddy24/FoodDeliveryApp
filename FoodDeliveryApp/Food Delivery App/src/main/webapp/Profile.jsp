<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 60px;
        }
        .navbar {
            background-color: #0c7e0e;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            padding: 10px 20px;
        }
        .navbar .navbar-brand {
            color: white;
        }
        .profile-container {
            margin-top: 80px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .profile-details {
            font-size: 18px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile-details input {
            border: none;
            background-color: #f8f9fa;
            padding: 5px;
            border-radius: 4px;
            flex: 2;
        }
        .edit-icon {
            cursor: pointer;
            color: #007bff;
        }
        .orders-container {
            margin-top: 30px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table {
            width: 100%;
            margin-top: 15px;
        }
        
         .navbar {
            background-color: #0c7e2e;
            padding: 10px;
        }

        .navbar .nav-link {
            color: white !important;
        }
        
    </style>
</head>
<body>
    <!-- Navbar -->
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">Foodie Delight</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="Home2.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Restaurant.jsp">Restaurants</a></li>
                <li class="nav-item"><a class="nav-link active" href="AboutUs.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Profile Content -->
    <div class="container profile-container">
        <h3 class="text-center" style="color:#66BB6A">Profile</h3>
        <%
            String username = (String) session.getAttribute("username");
            String phone = (String) session.getAttribute("phone");
            String email = (String) session.getAttribute("Email");
            String address = (String) session.getAttribute("address");
            Integer userId = (Integer) session.getAttribute("userId");
        %>
        <form action="UpdateProfileServlet" method="post">
            <div class="profile-details">
                <label for="username">Name:</label>
                <input type="text" id="username" name="username" value="<%= username != null ? username : "" %>" readonly>
                <span class="edit-icon" onclick="enableEditing('username')">&#9998;</span>
            </div>
            <div class="profile-details">
                <label for="phone">Phone:</label>
                <input type="text" id="phone" name="phone" value="<%= phone != null ? phone : "" %>" readonly>
                <span class="edit-icon" onclick="enableEditing('phone')">&#9998;</span>
            </div>
            <div class="profile-details">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= email != null ? email : "" %>" readonly>
                <span class="edit-icon" onclick="enableEditing('email')">&#9998;</span>
            </div>
            <div class="profile-details">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= address != null ? address : "" %>" readonly>
                <span class="edit-icon" onclick="enableEditing('address')">&#9998;</span>
            </div>
            <button type="submit" class="btn btn-success btn-block mt-3">Save Changes</button>
            <a href="Home2.jsp" class="btn btn-link btn-block">Go to Home</a>
        </form>
    </div>

    <!-- Order History Section -->
    <!-- Order History Section -->
<div class="container orders-container">
    <h3 class="text-center" style="color:#66BB6A">Your Orders</h3>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr>
                <th>Order ID</th>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Sasi@1919");

                    // Join ordershistory with menu table to get item name
                    String query = "SELECT o.orderId, m.Name AS itemName, o.quantity, o.totalAmount, o.orderDate " +
                                   "FROM ordershistory o " +
                                   "JOIN menu m ON o.MenuId = m.MenuId " +
                                   "WHERE o.userId=?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, userId);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("orderId") %></td>
                <td><%= rs.getString("itemName") %></td> <!-- Display Item Name -->
                <td><%= rs.getInt("quantity") %></td>
                <td>₹<%= rs.getInt("totalAmount") %></td>
                <td><%= rs.getDate("orderDate") %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </tbody>
    </table>
</div>
    

    <!-- JavaScript -->
    <script>
        function enableEditing(fieldId) {
            var inputField = document.getElementById(fieldId);
            inputField.removeAttribute('readonly');
            inputField.focus();
        }
    </script>
</body>
</html>
