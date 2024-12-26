package commerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddToWishlistServlet")
public class AddToWishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("product_name");
        String price = request.getParameter("price");
        String imageUrl = request.getParameter("image_url");

        try {
            Class.forName(DB_DRIVER);

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String checkSql = "SELECT COUNT(*) FROM wishlist WHERE product_name = ?";
                try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                    checkStmt.setString(1, productName);
                    ResultSet rs = checkStmt.executeQuery();
                    rs.next();

                    if (rs.getInt(1) > 0) {
                        response.setContentType("text/html");
                        response.getWriter().println(
                            "<script>" +
                            "alert('Product already exists in the wishlist.');" +
                            "window.location.href='index.jsp';" +
                            "</script>"
                        );
                    } else {
                        String insertSql = "INSERT INTO wishlist (product_name, price, image_url) VALUES (?, ?, ?)";
                        try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                            insertStmt.setString(1, productName);
                            insertStmt.setString(2, price);
                            insertStmt.setString(3, imageUrl);

                            insertStmt.executeUpdate();
                            response.setContentType("text/html");
                            response.getWriter().println(
                                "<script>" +
                                "alert('Product added to wishlist successfully.');" +
                                "window.location.href='index.jsp';" +
                                "</script>"
                            );
                        }
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println(
                "<script>" +
                "alert('MySQL JDBC Driver not found: " + e.getMessage() + "');" +
                "window.location.href='index.jsp';" +
                "</script>"
            );
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println(
                "<script>" +
                "alert('Error adding product to wishlist: " + e.getMessage() + "');" +
                "window.location.href='index.jsp';" +
                "</script>"
            );
        }
    }
}
