package commerce;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddToCartServlet")
public class AddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productName = request.getParameter("product_name");
        String price = request.getParameter("price");
        String imageUrl = request.getParameter("image_url");

        try {
            // Load the JDBC driver
            Class.forName(DB_DRIVER);
            
            // Establish the database connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                
                // Check if the product already exists in the cart
                String checkExistenceSql = "SELECT quantity FROM cart WHERE product_name = ?";
                PreparedStatement checkStmt = conn.prepareStatement(checkExistenceSql);
                checkStmt.setString(1, productName);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    // If product exists, update the quantity
                    int currentQuantity = rs.getInt("quantity");
                    String updateSql = "UPDATE cart SET quantity = ? WHERE product_name = ?";
                    PreparedStatement updateStmt = conn.prepareStatement(updateSql);
                    updateStmt.setInt(1, currentQuantity + 1); // Increase quantity by 1
                    updateStmt.setString(2, productName);
                    updateStmt.executeUpdate();
                } else {
                    // If product doesn't exist, insert a new product into the cart
                    String insertSql = "INSERT INTO cart (product_name, price, image_url, quantity) VALUES (?, ?, ?, ?)";
                    PreparedStatement insertStmt = conn.prepareStatement(insertSql);
                    insertStmt.setString(1, productName);
                    insertStmt.setString(2, price);
                    insertStmt.setString(3, imageUrl);
                    insertStmt.setInt(4, 1); // Initialize quantity to 1
                    insertStmt.executeUpdate();
                }

                // Redirect to the cart page (or wherever appropriate)
                response.sendRedirect("index.jsp");

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().write("MySQL JDBC Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Error adding product to cart: " + e.getMessage());
        }
    }
}
