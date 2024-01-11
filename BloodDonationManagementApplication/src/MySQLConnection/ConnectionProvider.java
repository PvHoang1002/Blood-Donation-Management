/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MySQLConnection;

import java.sql.*;

/**
 *
 * @author Phạm Việt Hoàng
 */
public class ConnectionProvider {
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonation", "root", "mypassword");
            return con;
        } catch (Exception e) {
            System.out.println("Failed to connect to database");
            return null;
        }
    }
}
