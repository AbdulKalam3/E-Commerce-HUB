package commerce;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/updatequantity")
public class UpdateQuantityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("product_id");
        String action = request.getParameter("action");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce", "root", "mysql");

            // Update quantity based on action
            if ("increase".equals(action)) {
                quantity++;
            } else if ("decrease".equals(action) && quantity > 0) {
                quantity--;
            }

            // Update the database
            String updateQuery = "UPDATE cart SET quantity = ? WHERE id = ?";
            pstmt = conn.prepareStatement(updateQuery);
            pstmt.setInt(1, quantity);
            pstmt.setInt(2, Integer.parseInt(productId));
            pstmt.executeUpdate();

            // Redirect to the product list or refresh the current page
            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the quantity.");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
