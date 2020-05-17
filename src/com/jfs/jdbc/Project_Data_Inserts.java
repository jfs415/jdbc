package com.jfs.jdbc;

import javax.swing.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class Project_Data_Inserts {

    Project_Data_Query query;
    private final Connection conn;

    /*
     * Constructor
     * @Param connect: The established connection from the connect class
     */
    public Project_Data_Inserts(Connection connect) {
        conn = connect;
        query = new Project_Data_Query(conn);
    }

    /*
     * A method that takes in the following paramaters and sends them through a prepared statement to a stored procedure
     * There the data is verified against the backend db and inserted or changed accordingly
     * @Param studentID: The id of the student
     * @Param studentName: The string name of the student
     * @Param majName: The string name of the students major
     * @Param email: The email address of the student
     * @Param gpa: The gpa of the student
     * @Param interest: The string value of the students interest
     * @Param phone: The phone number of the student
     * @Param type: The type of phone
     */
    public void addStudent(int studentID, String studentName, String majName, String email, String gpa, String interest, String phone, String type) {
        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call addStudent(?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, studentID);
            cs.setString(2, studentName);
            cs.setString(3, majName);
            cs.setString(4, email);
            cs.setString(5, gpa);
            cs.setString(6, interest);
            cs.setString(7, phone);
            cs.setString(8, type);

            cs.execute();

            query.getStudentInfo();
        } catch (SQLIntegrityConstraintViolationException sqli) {
            try{
                conn.rollback(); // rollback
            }catch(SQLException ne){
                ne.printStackTrace();
            }
            JOptionPane.showMessageDialog(null, "Error, missing 1 or more required fields", "Error", JOptionPane.ERROR_MESSAGE);
            sqli.printStackTrace();
        } catch (SQLException sqle) {
            try{
                conn.rollback(); // rollback
            }catch(SQLException ne){
                ne.printStackTrace();
            }
            JOptionPane.showMessageDialog(null, "Exception occurred", "Error", JOptionPane.ERROR_MESSAGE);
            sqle.printStackTrace();
        }
    }

    /*
     * A method that takes in the following paramaters and sends them through a prepared statement to a stored procedure
     * There the data is verified against the backend db and inserted or changed accordingly
     * @Param facID: The id of the faculty member
     * @Param ftName: The string name of the faculty member
     * @Param deptName: The string name of the facultys dept
     * @Param email: The email address of the faculty member
     * @Param interest: The string value of the faculty members interest
     * @Param phone: The phone number of the faculty member
     * @Param type: The type of phone
     */
    public void addFaculty(int facID, String fName, String deptName, String email, String fInterest, String phone, String ptype) {
        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call addFaculty(?, ?, ?, ?, ?, ?, ?)}"); //Prepare call
            cs.setInt(1, facID);
            cs.setString(2, fName);
            cs.setString(3, deptName);
            cs.setString(4, email);
            cs.setString(5, fInterest);
            cs.setString(6, phone);
            cs.setString(7, ptype);

            cs.execute();

            query.getFacultyInfo();
        } catch (SQLIntegrityConstraintViolationException sqli) {
            try{
                conn.rollback(); // rollback
            }catch(SQLException ne){
                ne.printStackTrace();
            }
            JOptionPane.showMessageDialog(null, "Error, missing 1 or more required fields", "Error", JOptionPane.ERROR_MESSAGE);
            sqli.printStackTrace();
        } catch (SQLException sqle) {
            try{
                conn.rollback(); // rollback
            }catch(SQLException ne){
                ne.printStackTrace();
            }
            JOptionPane.showMessageDialog(null, "Exception occurred", "Error", JOptionPane.ERROR_MESSAGE);
            sqle.printStackTrace();
        }
    }

    /*
     * A method that takes in the following paramaters and sends them through a prepared statement to a stored procedure
     * There the data is verified against the backend db and inserted or changed accordingly
     * @Param repID: The id of the reporter
     * @Param repName: The string name of the reporter
     * @Param compName: The string name of the reporters company
     * @Param email: The email address of the reporter
     * @Param phone: The phone number of the reporter
     * @Param type: The type of phone
     */
    public void addReporter(int repID, String repName, String compName, String email, String phone, String ptype) {
        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call addReporter(?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, repID);
            cs.setString(2, repName);
            cs.setString(3, compName);
            cs.setString(4, email);
            cs.setString(5, phone);
            cs.setString(6, ptype);

            cs.execute();

            query.getReporterInfo();
        } catch (SQLIntegrityConstraintViolationException sqli) {
            try{
                conn.rollback(); // rollback
            }catch(SQLException ne){
                ne.printStackTrace();
            }
            JOptionPane.showMessageDialog(null, "Error, missing 1 or more required fields", "Error", JOptionPane.ERROR_MESSAGE);
            sqli.printStackTrace();
        } catch (SQLException sqle) {
            try{
                conn.rollback(); // rollback
            }catch(SQLException ne){
                ne.printStackTrace();
            }
            JOptionPane.showMessageDialog(null, "Exception occurred", "Error", JOptionPane.ERROR_MESSAGE);
            sqle.printStackTrace();
        }
    }
}
