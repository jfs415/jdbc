package com.jfs.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Project_Data_Calculate {

    private final Connection conn;
    private Statement stmt;
    private ResultSet rs;

    /*
     * Constructor, sets connection
     * @param conn: the connection from the connections class
     */
    public Project_Data_Calculate(Connection connect) {
        conn = connect;
    }

    /*
     * A method to calculate the newest Student id from the "Student" table
     * To do this, the method counts the number of 'StudentID's" and appends 1 to it to get the next Student ID, and returns it
     * @Return numStudents: The number of rows in the Students Table, used to calculate next ID
     */
    public int getStudentID() {
        String sql;
        int numStudents = 0;

        try {
            stmt = conn.createStatement();
            sql = "SELECT count(StudentID) FROM Students;";
            rs = stmt.executeQuery(sql);
            rs.next();
            numStudents = rs.getInt(1);
            numStudents++;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (NullPointerException npe) {
            npe.printStackTrace();
        }
        return numStudents;
    }

    /*
     * A method to calculate the newest Faculty id from the "Faculty" table
     * To do this, the method counts the number of 'FacultyID's" and appends 1 to it to get the next Faculty ID, and returns it
     * @Return NumFaculty: The number of rows in the Faculty Table, used to calculate next ID
     */
    public int getFacultyID() {
        String sql;
        int numFaculty = 0;

        try {
            stmt = conn.createStatement();
            sql = "SELECT count(FacultyID) FROM Faculty;";
            rs = stmt.executeQuery(sql);
            rs.next();
            numFaculty = rs.getInt(1);
            numFaculty++;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (NullPointerException npe) {
            npe.printStackTrace();
        }
        return numFaculty;
    }

    /*
     * A method to calculate the newest Reporter id from the "Reporters" table
     * To do this, the method counts the number of 'ReporterID's" and appends 1 to it to get the next Reporter ID, and returns it
     * @Return NumReporters: The number of rows in the Reporter Table, used to calculate next ID
     */
    public int getReporterID() {
        String sql;
        int numReporters = 0;

        try {
            stmt = conn.createStatement();
            sql = "SELECT count(ReporterID) FROM Reporters;";
            rs = stmt.executeQuery(sql);
            rs.next();
            numReporters = rs.getInt(1);
            numReporters++;
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        } catch (NullPointerException npe) {
            npe.printStackTrace();
        }
        return numReporters;
    }
}