package com.jfs.jdbc;

import javax.swing.*;
import java.awt.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

public class Project_Data_Query {

    private final Connection conn;
    private ResultSet rs;
    private ResultSetMetaData rsmd;
    private final Font outputFont;

    /*
     * Constructor
     * @Param connection: The current connection from the connections class
     */
    public Project_Data_Query(Connection connection) {
        conn = connection;
        outputFont = new Font("Courier", Font.PLAIN, 20);
    }

    /*
     * A method to call the getCommonInterests prepared statement
     * @Param interest: A string to represent the interest keyword being searched for
     */
    public void getCommonInterests(String interest) {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getCommonInterests(?)}");
            cs.setString(1, interest);

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg = "";
            String output = "";
            output += "Data below is from the common interests stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null); //display output
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getCommonInterests prepared statement
     */
    public void getCompanyInfo() {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getCompanyInfo()}");
            cs.execute();
            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getCompanyInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getCommonInterests prepared statement
     */
    public void getDepartmentInfo() {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getDepartmentInfo()}");

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getDepartmentInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);
            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null); //display output
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getFacultyContactInfo prepared statement
     * @Param facID: An integer parameter used to find the faculty member who's contact info is being requested
     */
    public void getFacultyContactInfo(String facName) {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getFacultyContactInfo(?)}");
            cs.setString(1, facName);

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg = "";
            String output = "";
            output += "Data below is from the getFacultyContactInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getFacultyInfo prepared statement
     */
    public void getFacultyInfo() {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getFacultyInfo()}");

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getFacultyInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getReporterContactInfo prepared statement
     * @Param repID: An integer parameter used to find the reporter whos contact info is being requested
     */
    public void getReporterContactInfo(String repName) {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getReporterContactInfo(?)}");
            cs.setString(1, repName);

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getReporterContactInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getReporterInfo prepared statement
     */
    public void getReporterInfo() {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getReporterInfo()}");

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getReporterInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getStudentContactInfo prepared statement
     * @Param studentID: An integer used to find the student whos contact info is being requested
     */
    public void getStudentContactInfo(String studName) {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getStudentContactInfo(?)}");
            cs.setString(1, studName);

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getStudentContactInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /*
     * A method to call the getStudentInfo prepared statement
     */
    public void getStudentInfo() {
        ArrayList<ArrayList<String>> retval = new ArrayList<ArrayList<String>>();
        ArrayList<String> colName = new ArrayList<String>();

        try {
            CallableStatement cs;
            cs = conn.prepareCall("{call getStudentInfo()}");

            cs.execute();

            rs = cs.getResultSet();
            rsmd = rs.getMetaData();
            int arrayColumn = rsmd.getColumnCount();

            int j = 0;
            while (j <= arrayColumn) {
                j++;
                colName = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    colName.add(rsmd.getColumnName(i));
            }
            retval.add(colName);

            while (rs.next()) {
                ArrayList<String> row = new ArrayList<String>();
                for (int i = 1; i <= arrayColumn; i++)
                    row.add(rs.getString(i));

                retval.add(row);
            }

            String msg;
            String output = "";
            output += "Data below is from the getStudentInfo stored procedure\n\n";

            for (ArrayList<String> record : retval) {
                msg = "";
                for (String attribute : record)
                    msg += String.format("%-23s", attribute);

                output += msg + "\n";
            }

            JTextArea outputArea = new JTextArea(output);
            outputArea.setFont(outputFont);
            outputArea.setForeground(Color.BLUE);

            JScrollPane jsp = new JScrollPane();
            jsp = new JScrollPane(outputArea);
            jsp.setPreferredSize(new java.awt.Dimension(750, 400));

            JOptionPane.showMessageDialog(null, jsp, "SQL output", JOptionPane.INFORMATION_MESSAGE, null);
            cs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}