package com.ibm;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddStation extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "javaweb";
    private static final String DB_PASSWORD = "javaweb";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        String code = request.getParameter("code");
        String stationName = request.getParameter("stationName");
        String state = request.getParameter("state");

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String insertQuery = "INSERT INTO station(code, name, state) " + "VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);

            preparedStatement.setString(1, code);
            preparedStatement.setString(2, stationName);
            preparedStatement.setString(3, state);

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("AddStations.jsp");
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
