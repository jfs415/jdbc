package com.jfs.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Project_Data_Connections {

    private Connection conn;
    private final String uri;
    private final String DRIVER;
    private final String user;
    private String password;

    Project_Data_Connections() {
        uri = "jdbc:mysql://localhost/iste330project";
        DRIVER = "com.mysql.cj.jdbc.Driver";
        user = "root";
    }

    /*
     * Method to set the connection password to access the db
     * @Param passwd: The local password given by the user
     */
    public void setPassword(String passwd) {
        password = passwd;
    }

    /*
     * Gets the password sent by the user
     * @return password: The password given by the user
     */
    public String getPassword() {
        return password;
    }

    /*
     * Open conn to the DB
     * @Return conn: The current connection used
     */
    public Connection getConn() {
        try {
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(uri, user, getPassword());
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    /*
     * Closes the connection to the DB
     * @return bool: Returns true if successful, false if failed or there is no connection to close
     */
    public boolean close() {
        try {
            conn.close();
        } catch (NullPointerException npe) {
            npe.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}