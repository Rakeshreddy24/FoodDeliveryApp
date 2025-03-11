<%@ page import="java.util.*"%>
<%@ page import="com.tap.model.Restaurant"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Menu Items</title>

<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500;700&display=swap" rel="stylesheet">
	
<style>
body {
	background-color: white;
	color: #333;
	font-family: Arial, sans-serif;
	margin: 0;
	padding-top: 60px;
}

.navbar {
            background-color: #0c7e0e;
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
            margin-bottom: px;
        }

        .navbar .nav-link {
            color: white !important;
            margin: 0 5px;
        }

        .navbar .nav-link:hover {
            color: #ffc107 !important;
        }

.cart, .profile {
	position: relative;
}

.cart-dropdown, .profile-popup {
	position: absolute;
	top: 100%;
	width:220%;
	right: 0;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	padding: 15px;
	display: none;
	z-index: 10;
	font-size:12px;
}
.container {
            margin-top: 21px;
            padding-left: 15px;
            padding-right: 15px;
        }


.search-container {
	display: flex;
	justify-content: center;
	margin-top: 15px; /* Adjust spacing from top */
}

.search-bar {
	border-radius: 20px;
	padding: 8px 12px;
	font-size: 14px;
}

.input-group {
	width: 50%;
	max-width: 400px;
}

.btn-success {
	border-radius: 20px;
	padding: 8px 12px;
}

.search-results {
	display: none;
	background: white;
	border: 1px solid #ddd;
	width: 45%;
	margin: auto;
	position: absolute;
	z-index: 100;
}

.search-results div {
	padding: 10px;
	cursor: pointer;
	border-bottom: 1px solid #eee;
}

.search-results div:hover {
	background: #f8f8f8;
}


/* Search Bar Styling */
.search-container {
	display: flex;
	justify-content: center;
	margin-top: 15px;
	margin-bottom: 10px;
}

.input-group {
	width: 100%;
	max-width: 350px; /* Adjusted width for better alignment */
}

.search-bar {
	border-radius: 20px;
	padding: 10px 25px;
	font-size: 14px;
	border: 1px solid #ccc;
}

.btn-success {
	border-radius: 20px;
	padding: 5px 10px;
	font-size: 14px;
	background-color: #28a745;
	border: none;
}

.btn-success:hover {
	background-color: #218838;
}

/* Card Styling */
.card {
	border: none;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	background-color: white;
	text-align: center;
	height: auto;
	padding-bottom: 1px;
	margin-bottom: 5px;
}

.card-img-top {
	height: 110px;
	object-fit: cover;
	border-radius: 10px 10px 0 0;
	width: 100%;
}

.card-body {
	padding: 10px;
}

.card-title {
	font-size: 15px;
	font-weight: bold;
	margin-bottom: 5px;
}

.card-text {
	font-size: 13px;
	color: #666;
	margin-bottom: 4px;
}

/* Footer */
footer {
	background-color: #0c7e2e;
	color: white;
	text-align: center;
	padding: 10px 0;
	margin-top: 30px;
	font-size: 14px;
}

.category-img {
    width: 90%;
    height: 80px;
    object-fit: cover;
    border-radius: 15px;
    transition: transform 0.3s ease-in-out;
}

.category-img:hover {
    transform: scale(1.1);
}

@import url('https://fonts.googleapis.com/css2?family=Dancing+Script:wght@500;700&display=swap');

.welcome-section {
    position: relative;
    width: 100%;
    height: 38vh;
    display: flex;
    align-items: center;
    justify-content: left; /* Align text to the left */
    padding-left: 6%;
    overflow: hidden; /* Prevents overflow */
}

/* Blurred background */
.welcome-section::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url('https://t4.ftcdn.net/jpg/07/63/44/33/360_F_763443374_gsffQp1PSnF8wGkPsTLfGdUwx6rj9mab.jpg') 
                no-repeat center center/cover;
    filter: blur(1px); /* Adjust blur intensity */
    z-index: -1; /* Send background behind content */
}

/* Text styling */
.welcome-text {
    font-family: 'Dancing Script', cursive;
    font-size: 25px;
    font-weight: 800;
    background: linear-gradient(to right, white 45%,  white 20%, white);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    text-shadow: 12px 12px 12px rgba(0, 0, 0, 0.6);
    position: relative;
    z-index: 1; /* Keeps text above the background */
}

</style>
</head>

<body>
<!-- Welcome Section -->
    <div class="welcome-section">
    <div class="welcome-text">
        <% 
            String userName = (String) session.getAttribute("name");
            if (userName != null) {
                out.print("Welcome back, " + userName + "!<br>");
                out.println("🍽️ Let’s satisfy your cravings!");
            } else {
                out.print("Welcome back, foodie! 🍽️ Let’s satisfy your cravings!");
            }
        %>
    </div>
</div>
    
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<!-- Welcome Section -->
			<div class="text-left">
				<h4>Foodie Delight</h4>
				<% 
                    String userName1 = (String) session.getAttribute("name");
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
				<a class="nav-link d-inline" href="Home2.jsp">Home</a> <a
					class="nav-link d-inline" href="Restaurant.jsp">Restaurants</a> <a
					class="nav-link d-inline" href="AboutUs.jsp">About Us</a> <a
					class="nav-link d-inline" href="Contact.jsp">Contact</a>
			</div>

			<!-- Right Section -->
			<div class="d-flex">

				<!-- Cart in Navbar -->
				<div class="cart">
					<a class="nav-link" href="Cart.jsp" style="position: relative;">
						<img
						src="https://img.icons8.com/ios-filled/24/ffffff/shopping-cart.png"
						alt="Cart"> Cart <span id="cart-count"
						style="position: absolute; top: -5px; right: -10px; background: red; color: white; font-size: 12px; padding: 2px 6px; border-radius: 50%;">
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
					<a class="nav-link"href="javascript:void(0);" onclick="toggleProfilePopup()"> <img
						src="https://img.icons8.com/material-outlined/24/ffffff/user.png"
						alt="Profile"> Profile
					</a>
					<div class="profile-popup" id="profile-popup" >
						<p>
							<strong>User Details</strong>
						</p>
						<p>
							<strong>Name:</strong>
							<% out.print(userName != null ? userName : "Guest"); %>
						</p>
						<p>
							<strong>Address:</strong>
							<% out.print(Address != null ? Address : "Guest"); %>
						</p>
						<a href="Profile.jsp" class="btn btn-danger btn-sm">ViewProfile</a>
						<a href="LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="container mt-4">
    <h4 class="text-center" style="color:#66BB6A">Explore Food Categories</h4>
    <div class="row justify-content-center">
        <div class="col-md-2">
            <a href="ItemsServlet?category=Biryani">
                <img src="https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDI0LTAxL3Jhd3BpeGVsX29mZmljZV80OF9waG90b19vZl9jaGlja2VuX2JpcnlhbmlfcmVhbGlzdGljX3NpbXBsZV9pc19jMzljOTY5Yy1mODdmLTQ3MjMtYjkxYi0xNmE0MWNmN2U4ZGQucG5n.png" class="category-img" alt="Biryani">
            </a>
            <p class="text-center">Biryani</p>
        </div>
        <div class="col-md-2">
            <a href="ItemsServlet?category=Pizza">
                <img src="https://w7.pngwing.com/pngs/549/677/png-transparent-pizza-illustration-pizza-margherita-vegetarian-cuisine-paneer-tikka-vegetable-pizza-food-recipe-cheese-thumbnail.png" class="category-img" alt="Pizza">
            </a>
            <p class="text-center">Pizza</p>
        </div>
        <div class="col-md-2">
            <a href="ItemsServlet?category=Burger">
                <img src="https://w7.pngwing.com/pngs/201/77/png-transparent-hamburger-veggie-burger-take-out-fast-food-kebab-delicious-beef-burger-burger-with-lettuce-tomato-and-cheese-food-beef-recipe.png" class="category-img" alt="Curry">
            </a>
            <p class="text-center">Burger</p>
        </div>
        <div class="col-md-2">
            <a href="ItemsServlet?category=chicken">
                <img src="https://www.andy-cooks.com/cdn/shop/articles/20231121022916-andy-20cooks-20-20chicken-20lollipops.jpg?v=1701226253" class="category-img" alt="Dosa">
            </a>
            <p class="text-center">Chicken</p>
        </div>
        <div class="col-md-2">
            <a href="ItemsServlet?category=shake">
                <img src="https://w7.pngwing.com/pngs/547/938/png-transparent-several-assorted-flavor-sherbets-ice-cream-milkshake-juice-milkshake-cream-food-frozen-dessert.png" class="category-img" alt="shakes">
            </a>
            <p class="text-center">Shakes</p>
        </div>
    </div>
</div>

	<!-- Search Section -->
	<div class="search-container">
		<div class="input-group justify-content-center">
			<input type="text" id="menuSearch" class="form-control search-bar"
				placeholder="Search for Restaurants"
				onkeyup="searchRestaurants()">
			<div class="input-group-append">
				<button class="btn btn-success" onclick="searchRestaurants()">🔍</button>
			</div>
		</div>
	</div>

	<!-- Row to display restaurants -->
	<div class="container">
	<h4 class="text-center" style="color:#66BB6A">Discover best restaurants</h4>
		<div class="row" id="restaurantList">
			<% 
                ArrayList<Restaurant> RestaurantList = (ArrayList<Restaurant>) session.getAttribute("restaurantList");
                if (RestaurantList != null) {
                    for (Restaurant restaurant : RestaurantList) {
            %>
			<div class="col-md-3 restaurant-card">
				<div class="card">
					<a href="Menu?RestaurantId=<%= restaurant.getRestaurantId() %>">
						<img src="<%= restaurant.getImagePath() %>" class="card-img-top"
						alt="<%= restaurant.getName() %>">
					</a>
					<div class="card-body">
						<h5 class="card-title"><%= restaurant.getName() %></h5>
						<p class="card-text ratings">
							<strong>⭐ <%= restaurant.getRatings() %></strong>
						</p>
						<p class="card-text">
							<strong>⏱ <%= restaurant.getDeliveryTime() %> mins
							</strong>
						</p>
						<p class="card-text cuisine">
							<strong><%= restaurant.getCuisineType() %></strong>
						</p>
						<p class="card-text address">
							<strong><%= restaurant.getAddress() %></strong>
						</p>
					</div>
				</div>
			</div>
			<% 
                    }
                } else {
            %>
			<div class="col-12">
				<p class="text-center text-danger">No restaurants available at
					the moment.</p>
			</div>
			<% } %>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<p>&copy; 2025 Foodie Delight. All Rights Reserved.</p>
	</footer>

	<!-- JavaScript for Search -->
	<script>
        function searchRestaurants() {
            const input = document.getElementById('menuSearch').value.toLowerCase();
            const restaurantCards = document.getElementsByClassName('restaurant-card');
            let found = false;

            for (let i = 0; i < restaurantCards.length; i++) {
                const restaurantName = restaurantCards[i].getElementsByClassName('card-title')[0].innerText.toLowerCase();
                if (restaurantName.includes(input)) {
                    restaurantCards[i].style.display = 'block';
                    found = true;
                } else {
                    restaurantCards[i].style.display = 'none';
                }
            }

            // If no matches, show message
            const restaurantList = document.getElementById('restaurantList');
            if (!found) {
                restaurantList.innerHTML = '<div class="col-12"><p class="text-center text-danger">No restaurants found.</p></div>';
            }
        }
    </script>
    
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
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
