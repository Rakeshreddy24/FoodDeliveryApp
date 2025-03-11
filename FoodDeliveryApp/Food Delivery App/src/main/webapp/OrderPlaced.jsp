<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body 
        {
            background-color: white;
            text-align: center;
            padding: 20px;
        }
        .order-success {
            text-align: center;
            padding: 2px;
        }
        .order-success img {
            width: 150px;
            height: 150px;
            object-fit: contain;
        }
        .delivery-container {
            position: relative;
            width: 100%;
            height: 200px;
            overflow: hidden;
        }
        .delivery-bike {
            position: center;
            bottom: 30px;
            width: 300px;
            height:250px;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <div class="order-success">
            <h2>Order Placed Successfully!</h2>
            <img src="https://i.gifer.com/7efs.gif" alt="Order Success">
            <p>Your order is confirmed. Estimated delivery time is 30-45 minutes.</p>
        </div>
        
        <!-- Delivery Animation -->
        <div class="delivery-container">
            <img src="https://media1.giphy.com/media/cmCHuk53AiTmOwBXlw/giphy.gif?cid=6c09b952qpah58v18812891m28r3l8mv5qbvm42mxy72zxmi&ep=v1_internal_gif_by_id&rid=giphy.gif&ct=g" class="delivery-bike" alt="Delivery Partner on Bike">
        </div>

        <a href="Home2.jsp" class="btn btn-primary" style="background-color:#0c992e">Go to Home</a>
    </div>
</body>
</html>