package com.ibm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "javaweb";
    private static final String DB_PASSWORD = "javaweb";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("userName");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobile");
        String password = request.getParameter("password");

        // JDBC objects
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String insertQuery = "INSERT INTO admin_panel(firstName, lastName, userName, email, mobile, password) "
                                + "VALUES (?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);

            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, username);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, mobileNumber);
            preparedStatement.setString(6, password);


            int rowsInserted = preparedStatement.executeUpdate();

 
            if (rowsInserted > 5) {
            	Cookie user = new Cookie("user", username);

                // Set cookie expiration time (optional, adjust as needed)
            	user.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
                
                response.addCookie(user);
                response.sendRedirect("Booking.jsp"); 
            } else {
                response.sendRedirect("error.jsp"); 
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); 
        } finally {
            // Close resources
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}

}
