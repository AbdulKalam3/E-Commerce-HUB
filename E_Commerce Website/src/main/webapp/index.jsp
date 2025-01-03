<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="icon" type="image/png" href="images/icon.png"/>
    <link rel="Stylesheet" href="CSS/index-style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<title>E-Commerce HUB</title>
</head>
<body>
<header>
	<div class="container header">
		<div class="row title">
			<div class="col">
				<img src="images/icon.png">
			</div>
			<div class="col">
				<h1>E-Commerce HUB</h1>
			</div>
			<div class="col">
				<ul class="navlist">
					<li>
						<a href="#home"><i class='bx bx-home-alt-2'></i>Home</a>
					</li>
					<li>
						<a href="cart.jsp"><i class='bx bx-cart-alt'></i>Cart</a>
					</li>
					<li>
						<a href=wishlist.jsp><i class='bx bx-heart'></i>Wishlist</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>

<section id="home">
    <section class="banner">
        <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000">
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>

            <!-- Slides -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="images/banner1.jpg" class="d-block w-100" alt="Banner 1">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Exclusive Deals</h5>
                        <p>Get the best discounts on top brands</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/banner2.jpg" class="d-block w-100" alt="Banner 2">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Shop with Confidence</h5>
                        <p>100% secure shopping experience</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/banner3.jpg" class="d-block w-100" alt="Banner 3">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Fast Delivery</h5>
                        <p>Order now and get your items in no time</p>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div> 
    </section>  
 
    <!-- content -->
    <section>
    <div class="container content">
        <div class="row">
            <h2>Top Deals</h2>
            <div class="col categories">
                <!-- T-Shirt for girls -->
                <div class="items">
                    <img src="https://images.pexels.com/photos/7432210/pexels-photo-7432210.jpeg?auto=compress&cs=tinysrgb&w=800" alt="T-Shirt for girls">
                    <h5>T-Shirt for girls</h5>
                    <h5>Price: 399/-</h5>
                    <form action="AddToCartServlet" method="POST" class="item-actions">
                        <input type="hidden" name="product_name" value="T-Shirt for girls">
                        <input type="hidden" name="price" value="399">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/7432210/pexels-photo-7432210.jpeg?auto=compress&cs=tinysrgb&w=800">
                        <button type="submit" class="add">Add to cart</button>
                    </form>
                    <form action="AddToWishlistServlet" method="POST" class="wishlist-actions">
                        <input type="hidden" name="product_name" value="T-Shirt for girls">
                        <input type="hidden" name="price" value="399">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/7432210/pexels-photo-7432210.jpeg?auto=compress&cs=tinysrgb&w=800">
                        <button type="submit" class="wishlist">
                            <span>&#9825;</span>
                        </button>
                    </form>
                </div>

                <!-- Womens blazer -->
                <div class="items">
                    <img src="https://images.pexels.com/photos/19109151/pexels-photo-19109151/free-photo-of-elegant-blazer-on-display.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" alt="Womens blazer">
                    <h5>Womens blazer</h5>
                    <h5>Price: 1889/-</h5>
                    <form action="AddToCartServlet" method="POST" class="item-actions">
                        <input type="hidden" name="product_name" value="Womens blazer">
                        <input type="hidden" name="price" value="1889">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/19109151/pexels-photo-19109151/free-photo-of-elegant-blazer-on-display.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="add">Add to cart</button>
                    </form>
                    <form action="AddToWishlistServlet" method="POST" class="wishlist-actions">
                        <input type="hidden" name="product_name" value="Womens blazer">
                        <input type="hidden" name="price" value="1889">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/19109151/pexels-photo-19109151/free-photo-of-elegant-blazer-on-display.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="wishlist">
                            <span>&#9825;</span>
                        </button>
                    </form>
                </div>

                <!-- Mens blazer -->
                <div class="items">
                    <img src="https://images.pexels.com/photos/13532890/pexels-photo-13532890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" alt="Mens blazer">
                    <h5>Mens blazer</h5>
                    <h5>Price: 1547/-</h5>
                    <form action="AddToCartServlet" method="POST" class="item-actions">
                        <input type="hidden" name="product_name" value="Mens blazer">
                        <input type="hidden" name="price" value="1547">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/13532890/pexels-photo-13532890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="add">Add to cart</button>
                    </form>
                    <form action="AddToWishlistServlet" method="POST" class="wishlist-actions">
                        <input type="hidden" name="product_name" value="Mens blazer">
                        <input type="hidden" name="price" value="1547">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/13532890/pexels-photo-13532890.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="wishlist">
                            <span>&#9825;</span>
                        </button>
                    </form>
                </div>

                <!-- Top -->
                <div class="items">
                    <img src="https://images.pexels.com/photos/8619007/pexels-photo-8619007.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" alt="Top">
                    <h5>Top</h5>
                    <h5>Price: 399/-</h5>
                    <form action="AddToCartServlet" method="POST" class="item-actions">
                        <input type="hidden" name="product_name" value="Top">
                        <input type="hidden" name="price" value="399">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/8619007/pexels-photo-8619007.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="add">Add to cart</button>
                    </form>
                    <form action="AddToWishlistServlet" method="POST" class="wishlist-actions">
                        <input type="hidden" name="product_name" value="Top">
                        <input type="hidden" name="price" value="399">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/8619007/pexels-photo-8619007.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="wishlist">
                            <span>&#9825;</span>
                        </button>
                    </form>
                </div>

                <!-- Kids T-shirts -->
                <div class="items">
                    <img src="https://images.pexels.com/photos/26614516/pexels-photo-26614516/free-photo-of-mannequins-of-children-in-clothes.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load" alt="Kids T-shirts">
                    <h5>Kids T-shirts</h5>
                    <h5>Price: 789/-</h5>
                    <form action="AddToCartServlet" method="POST" class="item-actions">
                        <input type="hidden" name="product_name" value="Kids T-shirts">
                        <input type="hidden" name="price" value="789">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/26614516/pexels-photo-26614516/free-photo-of-mannequins-of-children-in-clothes.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load">
                        <button type="submit" class="add">Add to cart</button>
                    </form>
                    <form action="AddToWishlistServlet" method="POST" class="wishlist-actions">
                        <input type="hidden" name="product_name" value="Kids T-shirts">
                        <input type="hidden" name="price" value="789">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/26614516/pexels-photo-26614516/free-photo-of-mannequins-of-children-in-clothes.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load">
                        <button type="submit" class="wishlist">
                            <span>&#9825;</span>
                        </button>
                    </form>
                </div>

                <!-- Unisex T-Shirt -->
                <div class="items">
                    <img src="https://images.pexels.com/photos/15404590/pexels-photo-15404590/free-photo-of-rack-with-choice-of-sweaters.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" alt="Unisex T-Shirt">
                    <h5>Unisex T-Shirt</h5>
                    <h5>Price: 799/-</h5>
                    <form action="AddToCartServlet" method="POST" class="item-actions">
                        <input type="hidden" name="product_name" value="Unisex T-Shirt">
                        <input type="hidden" name="price" value="799">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/15404590/pexels-photo-15404590/free-photo-of-rack-with-choice-of-sweaters.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="add">Add to cart</button>
                    </form>
                    <form action="AddToWishlistServlet" method="POST" class="item-actions wishlist-actions">
                        <input type="hidden" name="product_name" value="Unisex T-Shirt">
                        <input type="hidden" name="price" value="799">
                        <input type="hidden" name="image_url" value="https://images.pexels.com/photos/15404590/pexels-photo-15404590/free-photo-of-rack-with-choice-of-sweaters.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2">
                        <button type="submit" class="wishlist">
                            <span>&#9825;</span>
                        </button>
                    </form>
                </div>

    			</div>
    			<div class="col adv">
    				<img src="images/adv2.jpg">
    			</div>
    		</div>
    	</div>
    </section>  

</section>
	<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col">
                <p>&copy; 2024 E-Commerce HUB. All Rights Reserved.</p>
                <ul class="links">
                    <li><a href="#"><i class="bx bxl-facebook"></i>E-Commerce HUB</a></li>
                    <li><a href="#"><i class="bx bxl-twitter"></i>E-Commerce HUB</a></li>
                    <li><a href="#"><i class="bx bxl-instagram"></i>E-Commerce HUB</a></li>
                    <li><a href="#"><i class="bx bxl-linkedin"></i>E-Commerce HUB</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
	
<script type="text/javascript">
    window.onload = function() {
        if(sessionStorage.getItem("scrollPos") != null) {
            window.scrollTo(0, sessionStorage.getItem("scrollPos"));
        }
    };

    window.onbeforeunload = function() {
        sessionStorage.setItem("scrollPos", window.scrollY);
    };
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>