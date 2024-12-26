package commerce;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

@WebServlet("/wishlistTocart")
public class WishlistToCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId;
        try {
            productId = Integer.parseInt(request.getParameter("product_id"));
        } catch (NumberFormatException e) {
            response.sendRedirect("wishlist.jsp?error=Invalid product ID");
            return;
        }

        try {
            // Load JDBC Driver
            Class.forName(DB_DRIVER);

            // Establish database connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Fetch product details from the wishlist
                String getProductSql = "SELECT product_name, price, image_url FROM wishlist WHERE id = ?";
                try (PreparedStatement pstGetProduct = conn.prepareStatement(getProductSql)) {
                    pstGetProduct.setInt(1, productId);
                    try (ResultSet rsProduct = pstGetProduct.executeQuery()) {
                        if (rsProduct.next()) {
                            String productName = rsProduct.getString("product_name");
                            double price = rsProduct.getDouble("price");
                            String imageUrl = rsProduct.getString("image_url");

                            // Check if the product already exists in the cart
                            String checkCartSql = "SELECT quantity FROM cart WHERE product_name = ?";
                            try (PreparedStatement pstCheckCart = conn.prepareStatement(checkCartSql)) {
                                pstCheckCart.setString(1, productName);
                                try (ResultSet rsCart = pstCheckCart.executeQuery()) {
                                    if (rsCart.next()) {
                                        // Update quantity if product exists in the cart
                                        int currentQuantity = rsCart.getInt("quantity");
                                        String updateCartSql = "UPDATE cart SET quantity = ? WHERE product_name = ?";
                                        try (PreparedStatement pstUpdateCart = conn.prepareStatement(updateCartSql)) {
                                            pstUpdateCart.setInt(1, currentQuantity + 1); // Increment quantity by 1
                                            pstUpdateCart.setString(2, productName);
                                            pstUpdateCart.executeUpdate();
                                        }
                                    } else {
                                        // Insert new product into the cart
                                        String insertCartSql = "INSERT INTO cart (product_name, price, image_url, quantity) VALUES (?, ?, ?, ?)";
                                        try (PreparedStatement pstInsertCart = conn.prepareStatement(insertCartSql)) {
                                            pstInsertCart.setString(1, productName);
                                            pstInsertCart.setDouble(2, price);
                                            pstInsertCart.setString(3, imageUrl);
                                            pstInsertCart.setInt(4, 1); // Quantity = 1
                                            pstInsertCart.executeUpdate();
                                        }
                                    }
                                }
                            }

                            // Remove the product from the wishlist
                            String removeWishlistSql = "DELETE FROM wishlist WHERE id = ?";
                            try (PreparedStatement pstRemoveWishlist = conn.prepareStatement(removeWishlistSql)) {
                                pstRemoveWishlist.setInt(1, productId);
                                pstRemoveWishlist.executeUpdate();
                            }

                            // Redirect to cart page
                            response.sendRedirect("cart.jsp");
                        } else {
                            response.sendRedirect("wishlist.jsp?error=Product not found in wishlist");
                        }
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("JDBC Driver error: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
