<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Foodie Delight</title>
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

        .contact-section {
            padding: 60px 0;
            background-color: #ffffff;
        }

        .contact-section h1 {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }

        .contact-section p {
            font-size: 18px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .contact-form .form-group label {
            font-weight: bold;
            color: #333;
        }

        .contact-form .form-control {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .contact-form button {
            background-color: #66BB6A;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            width: 100%;
            transition: background-color 0.3s;
        }

        .contact-form button:hover {
            background-color: #57a25d;
        }

        .contact-details {
            background-color: #f1f1f1;
            padding: 40px 20px;
            border-radius: 8px;
            margin-top: 40px;
            text-align: center;
        }

        .contact-details h4 {
            font-size: 24px;
            margin-bottom: 15px;
        }

        .contact-details p {
            font-size: 16px;
            color: #555;
        }

        footer {
            background-color: #0c7e2e;
            color: white;
            text-align: center;
            padding: 20px 0;
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
                <li class="nav-item"><a class="nav-link" href="AboutUs.jsp">About Us</a></li>
                <li class="nav-item"><a class="nav-link active" href="Contact.jsp">Contact</a></li>
            </ul>
        </div>
    </nav>

    <!-- Contact Us Section -->
    <div class="contact-section">
        <div class="container">
            <h1>Contact Us</h1>
            <p>If you have any questions or feedback, feel free to reach out to us. We would love to hear from you!</p>

            <!-- Contact Form -->
            <div class="contact-form">
                <form action="SubmitContactServlet" method="post">
                    <div class="form-group">
                        <label for="name">Your Name</label>
                        <input type="text" class="form-control" id="name" name="name" required placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <label for="email">Your Email</label>
                        <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                    </div>
                    <div class="form-group">
                        <label for="message">Your Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required placeholder="Write your message here..."></textarea>
                    </div>
                    <button type="submit">Submit</button>
                </form>
            </div>

            <!-- Contact Details Section -->
            <div class="contact-details">
                <h4>Our Contact Information</h4>
                <p><strong>Email:</strong> support@foodiedelight.com</p>
                <p><strong>Phone:</strong> +1 123 456 7890</p>
                <p><strong>Address:</strong> 123 Foodie Street, Food City, 12345</p>
                <p><strong>Working Hours:</strong> Mon-Sun, 10 AM - 8 PM</p>
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
