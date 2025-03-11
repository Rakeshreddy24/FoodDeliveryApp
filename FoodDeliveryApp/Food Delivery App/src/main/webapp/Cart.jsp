<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Menu" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            font-size: 14px;
            padding: 0;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #66BB6A;
        }
        table {
            width: 60%;
            margin: 10px auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        img.food-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 10px;
        }
        .button {
            padding: 10px 20px;
            margin: 10px;
            text-decoration: none;
            border: none;
            color: white;
            background-color: #66BB6A;
            border-radius: 4px;
            cursor: pointer;
            font-size: 12px;
        }
        .button:hover {
            background-color: #218838;
        }
        .button:disabled {
            background-color: gray;
            cursor: not-allowed;
        }
        .remove {
            background-color: #dc3563;
        }
        .remove:hover {
            background-color: #c82333;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
         
          #address-section, #payment-section {
            margin: 15px auto;
            padding: 8px;
            background: white;
            width: 60%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }
        #address-section h3, #payment-section h3 {
            color: #66BB6A;
        }
        .profile-details {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
        }
        .profile-details label {
            width: 30%;
        }
        .profile-details input {
            width: 65%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f9fa;
            transition: background-color 0.3s;
        }
        .profile-details input:focus {
            background-color: #e9ecef;
        }
        .payment-option {
            margin: 1px 0;
            display: block;
        }
        .payment-option input {
            margin-right: 10px;
        }
        .button {
            margin-top: 20px;
        }
        .edit-icon {
            cursor: pointer;
            color: #007bff;
        }
        .upi-input {
            margin-top: 10px;
            display: none;
        }
        
    </style>
</head>
<body>
    <h1>Your Cart</h1>
    <%
        List<Menu> cart = (List<Menu>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
        <p style="text-align: center;">Your cart is empty!</p>
        <div class="container">
            <center><img src="https://cdn3.iconfinder.com/data/icons/shopping-and-ecommerce-29/90/empty_cart-1024.png" width=180px></center>
            <a href="MenuItem.jsp" class="button">Continue Shopping</a>
        </div>
    <%
        } else {
    %>
        <table>
            <tr>
                <th></th>
                <th>Item Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
            <%
                double totalPrice = 0;
                for (Menu item : cart) {
                    double itemTotal = item.getPrice() * item.getQuantity();
                    totalPrice += itemTotal;
            %>
            <tr>
                <td><img src="<%= item.getImagePath() %>" class="food-img" alt="Food Image"></td>
                <td><%= item.getName() %></td>
                <td>₹<%= item.getPrice() %></td>
                <td>
                    <div class="quantity-controls">
                        <form action="UpdateCartServlet" method="post" style="display: inline;">
                            <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                            <input type="hidden" name="action" value="decrease">
                            <button type="submit">-</button>
                        </form>
                        <%= item.getQuantity() %>
                        <form action="UpdateCartServlet" method="post" style="display: inline;">
                            <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                            <input type="hidden" name="action" value="increase">
                            <button type="submit">+</button>
                        </form>
                    </div>
                </td>
                <td>₹<%= itemTotal %></td>
                <td>
                    <form action="UpdateCartServlet" method="post" style="display: inline;">
                        <input type="hidden" name="menuId" value="<%= item.getMenuId() %>">
                        <input type="hidden" name="action" value="remove">
                        <button type="submit" class="remove">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="4"><strong>Total</strong></td>
                <td colspan="2"><strong>₹<%= totalPrice %></strong></td>
            </tr>
        </table>

        <div class="container">
            <a href="MenuItem.jsp" class="button">Add More Items</a>
        </div>

        <!-- Address Section -->
        <!-- Existing JSP code above remains unchanged -->

<!-- Address Section -->
		<div id="address-section">
            <h3>Delivery Address</h3>
            <%
            String userName = (String) session.getAttribute("username");
            String phone = (String) session.getAttribute("phone");
            String email = (String) session.getAttribute("Email");
            String address = (String) session.getAttribute("address");
            String photoUrl = (String) session.getAttribute("photoUrl"); // URL to the user's photo
        %>
            <form action="EditAddress" method="post">
                <div class="profile-details">
                    <label for="username">Name:</label>
                    <input type="text" id="username" name="username" value="<%= userName != null ? userName : "" %>" readonly>
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
                 <button type="submit" class="save-button">Save Address</button>
            </form>
        </div>

        <!-- Payment Section -->
        <div id="payment-section">
            <h3>Select Payment Method</h3>
            <form id="payment-form" action="PaymentServlet" method="post">
                <input type="hidden" name="totalAmount" value="<%= totalPrice %>">
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="PhonePe" required> PhonePe
                </label><br>
                <div id="phonepe-upi" class="upi-input">
                    <label for="phonepe-upi-id">Enter UPI ID:</label>
                    <input type="text" id="phonepe-upi-id" name="phonepeUpiId" placeholder="Your UPI ID">
                </div>
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="GPay"> GPay
                </label><br>
                <div id="gpay-upi" class="upi-input">
                    <label for="gpay-upi-id">Enter UPI ID:</label>
                    <input type="text" id="gpay-upi-id" name="gpayUpiId" placeholder="Your UPI ID">
                </div>
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="Paytm"> Paytm
                </label><br>
                <div id="paytm-upi" class="upi-input">
                    <label for="paytm-upi-id">Enter UPI ID:</label>
                    <input type="text" id="paytm-upi-id" name="paytmUpiId" placeholder="Your UPI ID">
                </div>
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="Card"> Card
                </label><br>
                <label class="payment-option">
                    <input type="radio" name="paymentMethod" value="COD"> Cash on Delivery
                </label><br><br>
                <strong>Total Amount to Pay: ₹<%= totalPrice %></strong>
                <br><br>
                <button type="submit" class="button">Pay</button>
            </form>
        </div>
    <% } %>

    <script>
        function enableEditing(fieldId) {
            var inputField = document.getElementById(fieldId);
            inputField.removeAttribute('readonly');
            inputField.focus();
        }
    </script>
    <script>
        document.querySelectorAll('input[name="paymentMethod"]').forEach(function(element) {
            element.addEventListener('change', function() {
                document.querySelectorAll('.upi-input').forEach(function(input) {
                    input.style.display = 'none';
                });

                var selectedPaymentMethod = document.querySelector('input[name="paymentMethod"]:checked');
                if (selectedPaymentMethod) {
                    var paymentMethod = selectedPaymentMethod.value;
                    if (paymentMethod === 'PhonePe') {
                        document.getElementById('phonepe-upi').style.display = 'block';
                    } else if (paymentMethod === 'GPay') {
                        document.getElementById('gpay-upi').style.display = 'block';
                    } else if (paymentMethod === 'Paytm') {
                        document.getElementById('paytm-upi').style.display = 'block';
                    }
                }
            });
        });
    </script>

</body>
</html>
