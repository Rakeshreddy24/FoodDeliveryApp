<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import = "java.util.List , com.app.models.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickBites | Home</title>
    <link rel="icon" type="image/png" href="/fevicon.png">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Monoton&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
</head>
<body>
   <header>
        <a href="/index.html"><p><span style="color: #EB5B00;">Quick</span>Bites</p></a>
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" placeholder="Search for Restaurant or Dish">
        <div id="left">
            <a href="/Static/login.html" id="login-btn" class="poppins-font">Login</a>
            <a href="/Static/signup.html" id="signup-btn" class="poppins-font">Sign up</a>
        </div>
   </header>
   <div id="container">
        <div id="left">
            <h1 class="monoton-regular">HUNGRY?</h1>
            <p>Let us handle it !</p>
        </div>
        <div id="right">
            <img src="images/vecteezy_ai-generated-pork-teriyaki-japanese-food-on-a-transparent_36512714.png" alt="">
        </div>
   </div>
   <div id="main-body"  class=" poppins-font">
        <div id="section2">
            <h2 class="heading poppins-font">What's on your mind?</h2>
            <div id="the-container">
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Biryani.png" alt="">
                </a>
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_Salad-1.png" alt="">
                </a>
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_North%20Indian.png" alt="">
                </a>
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Pizzas.png" alt="">
                </a>
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_burger.png" alt="">
                </a>
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/8f508de7-e0ac-4ba8-b54d-def9db98959e_cake.png" alt="">
                </a>
                <a href="">
                    <img src="https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_288,h_360/MERCHANDISING_BANNERS/IMAGES/MERCH/2024/7/2/6ef07bda-b707-48ea-9b14-2594071593d1_Chinese.png" alt="">
                </a>
               
            </div>
        </div>
        <div id="section1">
            <h2 class="heading poppins-font">Top restaurants nearby</h2>
            <div id="box">
    
            
            	<%
            	
            	List<Restaurant> restaurants = (List<Restaurant>)request.getAttribute("restaurants");
            	
            	
            	for(Restaurant r : restaurants )
            	{
            
            	%>
                        
                <div class="box">
                	<a href="menu?RestaurantId=<%= r.getRestaurantId() %>" style="text-decoration: none;color:inherit;">
             			<div id="img-div">
                        	<img src="<%= r.getImagePath() %>" alt="">
                    	</div>
                    	<div id="details">
                        	<p><%= r.getName() %></p>
                        	<div class="rating">
                            	<i class="fa-regular fa-star"></i>
                            	<h4><%= r.getRating() %></h4>
                            	<h4>| <%= r.getDeliveryTime() %>min </h4>
                        	</div>
                        <h3><%= r.getCuisineType() %></h3>
                        <h3><%= r.getAddress() %></h3>
                    </div>
                	</a>
                </div>
                
                <%
                	} 
                %>

            </div>
        </div>
   </div>
   
   
   
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js" integrity="sha512-onMTRKJBKz8M1TnqqDuGBlowlH0ohFzMXYRNebz+yOcc5TQr/zAKsthzhuv0hiyUKEiQEQXEynnXCvNTOk50dg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="https://smtpjs.com/v3/smtp.js"></script>
   <script src="js/script.js"></script>
</body>
</html>