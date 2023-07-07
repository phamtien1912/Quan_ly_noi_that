package dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    protected Connection connection;
    private final String url = "jdbc:mysql://localhost:3306/web";
    private final String userName = "root";
    private final String password = "1234";

    public Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(url, userName, password);
        System.out.println("getConnection: " + connection);
        return connection;
    }
}