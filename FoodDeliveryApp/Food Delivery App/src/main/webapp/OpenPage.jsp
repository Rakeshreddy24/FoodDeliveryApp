<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .header {
            height: 70vh;
            position: relative;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://t3.ftcdn.net/jpg/11/19/46/32/360_F_1119463247_3m27F6Yeiv7oD4BYRIXTWrQZZTNBRvba.jpg') no-repeat center center;
            background-size: cover;
            filter: brightness(0.5);
            z-index: 1;
        }

        .header .top-bar {
            position: absolute;
            top: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            z-index: 2;
        }

        .header .top-bar .floating-text {
            font-size: 2em;
            font-weight: bold;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
            color: white;
        }

        .header .top-bar .actions {
            display: flex;
            gap: 10px;
        }

        .header .top-bar .actions button {
            padding: 10px 20px;
            background-color: white;
            border: none;
            color: #4CAF50;
            cursor: pointer;
            border-radius: 5px;
            font-size: 1em;
        }

        .header .top-bar .actions button:hover {
            background-color: #ddd;
        }

        .header .text-overlay {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            z-index: 2;
            text-align: center;
        }

        .header .text-overlay h1 {
            font-size: 3em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.8);
        }

        .header .text-overlay p {
            font-size: 1.5em;
            text-shadow: 1px 1px 5px rgba(0, 0, 0, 0.7);
        }

        /* Content Styles */
        .content {
            padding: 20px;
            text-align: center;
        }

        /* Footer Styles */
        .footer {
            background-color:#4CAF50;
            color: white;
            text-align: center;
            padding: 15px 0;
        }

        .footer a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Popup Modal Styles */
        .modal {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 10;
        }

        .modal.active {
            display: flex;
        }

        .modal .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 12px;
            border-radius: 8px;
            width: 350px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        .modal .form-container h2 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .modal .form-container .input-group {
            margin-bottom: 15px;
        }

        .modal .form-container label {
            display: block;
            margin-bottom: 5px;
            color: #4CAF50;
        }

        .modal .form-container input {
            width: 90%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        .modal .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #66BB6A;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .modal .form-container button:hover {
            background-color: #388E3C;
        }

        .modal .form-container p {
            margin-top: 15px;
            font-size: 14px;
        }

        .modal .form-container a {
            color: #4CAF50;
            text-decoration: none;
        }

        .modal .form-container a:hover {
            text-decoration: underline;
        }

        .modal .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 24px;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="top-bar">
            <div class="floating-text">Foodie Delight</div>
            <div class="actions">
                <button onclick="openModal('loginModal')">Sign In</button>
                <button onclick="openModal('registerModal')">Sign Up</button>
            </div>
        </div>
        <div class="text-overlay">
            <h1>Welcome to Foodie Delight</h1>
            <p>Good vibes & good food start with a simple login. Let's go! </p>
        </div>
    </div>

    <div class="content">
    <p>We believe good food brings people together. Join us in making every meal a celebration!</p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>
            <a href="AboutUs.jsp">About Us</a> |
            <a href="Contact.jsp">Contact</a> |
            <a href="#">Privacy Policy</a>
        </p>
    </div>

    <!-- Login Modal -->
    <div class="modal" id="loginModal">
        <button class="close-btn" onclick="closeModal('loginModal')">&times;</button>
        <div class="form-container">
            <h2>Login</h2>
            <form action="Login" method="POST">
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit">Login</button>
            </form>
            <p>New User? <a href="#" onclick="switchModal('loginModal', 'registerModal')">Sign Up Here</a></p>
        </div>
    </div>

    <!-- Register Modal -->
    <div class="modal" id="registerModal">
        <button class="close-btn" onclick="closeModal('registerModal')">&times;</button>
        <div class="form-container">
            <h2>Sign Up</h2>
            <form action="RegisterServlet" method="POST">
                <div class="input-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="input-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-group">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
                </div>
                <div class="input-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit">Sign Up</button>
            </form>
            <p>Already a User? <a href="#" onclick="switchModal('registerModal', 'loginModal')">Login Here</a></p>
        </div>
    </div>

    <script>
        function openModal(modalId) {
            document.getElementById(modalId).classList.add('active');
        }

        function closeModal(modalId) {
            document.getElementById(modalId).classList.remove('active');
        }

        function switchModal(closeModalId, openModalId) {
            closeModal(closeModalId);
            openModal(openModalId);
        }
    </script>
</body>
</html>
