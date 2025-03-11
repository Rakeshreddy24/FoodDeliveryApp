<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Foodie Delight</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .navbar {
            background-color: #0c7e2e;
            padding: 10px;
        }

        .navbar .nav-link {
            color: white !important;
        }

        .about-section {
            padding: 60px 0;
            text-align: center;
            background-color: #ffffff;
        }

        .about-section h1 {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }

        .about-section p {
            font-size: 18px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .about-section .feature {
            display: flex;
            justify-content: space-around;
            margin-top: 30px;
        }

        .feature .feature-item {
    text-align: center;
    background-color: #f1f1f1;
    border-radius: 8px;
    padding: 20px;
    width: 30%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;  /* Smooth transition */
}

.feature .feature-item:hover {
    background-color: #66BB6A; /* Green color on hover */
    color: white; /* Text color changes to white */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Deeper shadow on hover */
}

.feature .feature-item h4 {
    font-size: 22px;
    color: #333;
    margin-bottom: 10px;
}

.feature .feature-item p {
    color: #666;
}

.feature .feature-item:hover h4,
.feature .feature-item:hover p {
    color: white; /* Text color becomes white on hover */
}
        

        footer {
            background-color: #0c7e2e;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .about-image {
            max-width: 100%;
            border-radius: 10px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#" style="color:white">Foodie Delight</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="Home2.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Restaurant.jsp">Restaurants</a></li>
                <li class="nav-item"><a class="nav-link active" href="AboutUs.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- About Us Section -->
    <div class="about-section">
        <h1>Welcome to Foodie Delight</h1>
        <p>At Foodie Delight, we bring together food lovers from all over the world. Our goal is to provide you with a seamless, delightful food ordering experience. Whether you're craving a hot pizza, fresh salad, or spicy biryani, we have it all!</p>

        <p>Our platform connects you with top restaurants and lets you explore a wide variety of cuisines, all in one place. We value quality, customer satisfaction, and convenience, ensuring that you enjoy your meal from the moment you browse our menu to the first bite.</p>

        <img src="data:image/jpeg;base64,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" width=150px alt="Foodie Delight" class="about-image">

        <div class="feature">
            <div class="feature-item">
                <img src="https://img.icons8.com/ios-filled/50/000000/restaurant.png" alt="Feature Icon">
                <h4>Wide Variety of Cuisines</h4>
                <p>Explore our extensive menu, with options for every taste – from Indian, Italian, Chinese, and more!</p>
            </div>
            <div class="feature-item">
                <img src="https://img.icons8.com/ios-filled/50/000000/shopping-cart.png" alt="Feature Icon">
                <h4>Easy Ordering</h4>
                <p>Place your order with just a few clicks, and enjoy hassle-free delivery to your doorstep.</p>
            </div>
            <div class="feature-item">
                <img src="https://img.icons8.com/ios-filled/50/000000/star.png" alt="Feature Icon">
                <h4>Top-Quality Food</h4>
                <p>We partner with the best restaurants to ensure that you get the freshest and most delicious meals.</p>
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
