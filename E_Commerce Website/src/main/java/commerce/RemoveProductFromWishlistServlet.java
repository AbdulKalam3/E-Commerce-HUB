package commerce;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/removeproductfromwishlist")
public class RemoveProductFromWishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("product_id"));

        removeProductFromWishlist(productId);

        response.sendRedirect("wishlist.jsp"); // Redirect to the wishlist page after removal
    }

    private void removeProductFromWishlist(int productId) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "DELETE FROM wishlist WHERE id = ?";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, productId);

                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("Product removed from wishlist successfully.");
                } else {
                    System.out.println("Product with ID " + productId + " not found in wishlist.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
