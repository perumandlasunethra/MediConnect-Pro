package com.example.mediconnect.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String host = System.getenv("DB_HOST");
        String port = System.getenv("DB_PORT");
        String database = System.getenv("DB_NAME");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASSWORD");

        String url =
            "jdbc:mysql://" + host + ":" + port + "/" + database +
            "?sslMode=REQUIRED&serverTimezone=UTC";

        return DriverManager.getConnection(
            url,
            user,
            password
        );
    }
}

