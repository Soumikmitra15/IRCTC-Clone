package com.ibm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Login extends HttpServlet {
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "javaweb";
    private static final String DB_PASSWORD = "javaweb";
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // JDBC objects
        Connection connection = null;
        PreparedStatement preparedStatement = null;
            
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String selectQuery = "SELECT USERNAME FROM ADMIN_PANEL WHERE EMAIL=? AND PASSWORD=?";
            preparedStatement = connection.prepareStatement(selectQuery);

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            ResultSet rs = preparedStatement.executeQuery();
                
            if (rs.next()) {
                String username = rs.getString("USERNAME");
                Cookie user = new Cookie("user", username);

                // Set cookie expiration time (optional, adjust as needed)
            	user.setMaxAge(60 * 60 * 24 * 30); // 30 days (in seconds)
                
                response.addCookie(user);
                RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
                rd.forward(request, response);
            } else {
                // User not found or incorrect credentials
                String errorMessage = "Incorrect username or password!";
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);
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

