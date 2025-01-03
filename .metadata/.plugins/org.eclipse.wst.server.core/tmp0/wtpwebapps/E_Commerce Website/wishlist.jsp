<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <link rel="icon" type="image/png" href="images/icon.png"/>
    <link rel="stylesheet" href="CSS/wishlist-style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Wishlist</title>
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
                        <a href="index.jsp"><i class='bx bx-home-alt-2'></i>Home</a>
                    </li>
                    <li>
                        <a href="cart.jsp"><i class='bx bx-cart-alt'></i>Cart</a>
                    </li>
                    <li>
                        <a href="#wishlist"><i class='bx bx-heart'></i>Wishlist</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>

<section id="wishlist">
	<div class="container wishlist">
		<div class="row">
				<%
                String DB_URL = "jdbc:mysql://localhost:3306/Ecommerce";
                String DB_USER = "root";
                String DB_PASSWORD = "mysql";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                double totalPrice = 0.0;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM wishlist";
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        String productName = rs.getString("product_name");
                        double price = rs.getDouble("price"); 
                        String imageUrl = rs.getString("image_url");

                        totalPrice += price; 
            %>
                       <div class="col">
						    <div class="items">
						        <img src="<%= imageUrl %>" alt="Product Image">
						        <div class="items-body">
						            <p><%= productName %></p>
						            <p><%= String.format("₹%.2f", price) %></p> 
						            <form action="removeproductfromwishlist" method="post" class="btn1">
						                <input type="hidden" name="product_id" value="<%= rs.getInt("id") %>">
						                <button type="submit" class="btn btn-danger">Remove</button>
						            </form>
						            <form action="wishlistTocart" method="post" class="btn2">
						            	<input type="hidden" name="product_id" value="<%= rs.getInt("id") %>">
						            	<button type="submit" class="btn btn-danger">Add to Cart</button>
						            </form>
						        </div>
						    </div>
						</div>

            <%
                    }
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                    out.println("<div class='col-12 text-center'><p>Error fetching cart items: " + e.getMessage() + "</p></div>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignored) {}
                    if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
                }
            %>
		</div>
	</div>
</section>
</body>
</html>