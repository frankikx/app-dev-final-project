package com.appdevfinalproject.common;

import java.sql.Connection;
import java.sql.DriverManager;

import static com.appdevfinalproject.common.Constants.*;

public class DatabaseConnection {

    static public Connection con = null;

    public static Connection getCon() throws Exception{
        if(con == null){
            Class.forName(MYSQL_DRIVER);
            String url = MYSQL_URL;
            String dbUsername = MYSQL_UN;
            String dbPassword = MYSQL_PASS;
            con = DriverManager.getConnection(url, dbUsername, dbPassword);
        }

        return con;
    }
}
