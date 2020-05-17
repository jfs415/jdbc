package com.jfs.jdbc;

import javax.swing.*;
import java.awt.*;

public class Project_Presentation extends JFrame {

    private JButton jbExit;
    private JButton jbStudentInfo;
    private JButton jbFacultyInfo;
    private JButton jbReporterInfo;
    private JButton jbDeptInfo;
    private JButton jbCompanyInfo;
    private JButton jbStudentContact;
    private JButton jbFacultyContact;
    private JButton jbReporterContact;
    private JButton jbCommonInterests;
    private JButton jbAddStudent;
    private JButton jbAddFaculty;
    private JButton jbAddReporter;
    private String name;
    private String compName;
    private String email;
    private String phone;
    private String type;
    private String interest;

    public String password;
    Project_Data_Connections dataConn;
    Project_Data_Query query;
    Project_Data_Calculate calc;
    Project_Data_Inserts insert;

    /*
     * Constructor
     * JFrame settings are established and JButtons are created
     * Action listeners are created in the actionListener method, this is to ensure they are using the correct connection
     */
    public Project_Presentation() {
        super("ISTE330 Project");
        name = "";
        compName = "";
        email = "";
        phone = "";
        type = "";
        interest = "";

        setSize(600, 500);
        setLocation(700, 50);

        JPanel jpCenter = new JPanel();
        jpCenter.setLayout(new GridLayout(0, 3));

        dataConn = new Project_Data_Connections();

        JButton jbConnect = new JButton("Connect to DB");
        jpCenter.add(jbConnect);
        jbConnect.addActionListener(ae -> {
            password = JOptionPane.showInputDialog(null, "Please enter your password");
            dataConn.setPassword(password);

            if (dataConn.getConn() != null) {
                JOptionPane.showMessageDialog(null, "Connected");
                jbExit.setEnabled(true);
                jbStudentInfo.setEnabled(true);
                jbFacultyInfo.setEnabled(true);
                jbReporterInfo.setEnabled(true);
                jbDeptInfo.setEnabled(true);
                jbCompanyInfo.setEnabled(true);
                jbStudentContact.setEnabled(true);
                jbFacultyContact.setEnabled(true);
                jbReporterContact.setEnabled(true);
                jbCommonInterests.setEnabled(true);
                jbAddStudent.setEnabled(true);
                jbAddFaculty.setEnabled(true);
                jbAddReporter.setEnabled(true);
                addActions();
            } else {
                JOptionPane.showMessageDialog(null, "Failed to connect", null, JOptionPane.ERROR_MESSAGE);
            }
        });

        JButton jbBlank = new JButton("");
        jbBlank.setEnabled(false);
        jpCenter.add(jbBlank);

        jbExit = new JButton("Close connection");
        jbExit.setEnabled(false);
        jpCenter.add(jbExit);

        jbExit.addActionListener(ae -> {
            if (dataConn.getConn() != null) {
                JOptionPane.showMessageDialog(null, "Disconnected. Bye");
                System.exit(0);
            } else {
                JOptionPane.showMessageDialog(null, "Failed to connect", "Error", JOptionPane.ERROR_MESSAGE);
            }
        });

        jbStudentInfo = new JButton("Get Student Info");
        jbStudentInfo.setEnabled(false);
        jpCenter.add(jbStudentInfo);

        jbFacultyInfo = new JButton("Get Faculty Info");
        jbFacultyInfo.setEnabled(false);
        jpCenter.add(jbFacultyInfo);

        jbReporterInfo = new JButton("Get Reporter Info");
        jbReporterInfo.setEnabled(false);
        jpCenter.add(jbReporterInfo);

        jbDeptInfo = new JButton("Get Department Info");
        jbDeptInfo.setEnabled(false);
        jpCenter.add(jbDeptInfo);

        jbCompanyInfo = new JButton("Get Company Info");
        jbCompanyInfo.setEnabled(false);
        jpCenter.add(jbCompanyInfo);

        jbStudentContact = new JButton("Get Student Contact Info");
        jbStudentContact.setEnabled(false);
        jpCenter.add(jbStudentContact);

        jbFacultyContact = new JButton("Get Faculty Contact Info");
        jbFacultyContact.setEnabled(false);
        jpCenter.add(jbFacultyContact);

        jbReporterContact = new JButton("Get Reporter Contact Info");
        jbReporterContact.setEnabled(false);
        jpCenter.add(jbReporterContact);

        jbCommonInterests = new JButton("Get Common Interests");
        jbCommonInterests.setEnabled(false);
        jpCenter.add(jbCommonInterests);

        jbAddStudent = new JButton("Add Student");
        jbAddStudent.setEnabled(false);
        jpCenter.add(jbAddStudent);

        jbAddFaculty = new JButton("Add Faculty");
        jbAddFaculty.setEnabled(false);
        jpCenter.add(jbAddFaculty);

        jbAddReporter = new JButton("Add Reporter");
        jbAddReporter.setEnabled(false);
        jpCenter.add(jbAddReporter);

        add(jpCenter);

        setVisible(true);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    /*
     * This method created the actionListener methods to handle what happens when a button is clicked
     */
    public void addActions() {
        query = new Project_Data_Query(dataConn.getConn());
        calc = new Project_Data_Calculate(dataConn.getConn());
        insert = new Project_Data_Inserts(dataConn.getConn());

        jbStudentInfo.addActionListener(ae -> query.getStudentInfo());

        jbFacultyInfo.addActionListener(ae -> query.getFacultyInfo());

        jbReporterInfo.addActionListener(ae -> query.getReporterInfo());

        jbDeptInfo.addActionListener(ae -> query.getDepartmentInfo());

        jbCompanyInfo.addActionListener(ae -> query.getDepartmentInfo());

        jbStudentContact.addActionListener(ae -> {
            String studName;
            while (true) {
                try {
                    studName = JOptionPane.showInputDialog("Please enter the name of the student you're trying to contact:");
                    if (studName.equals("") || studName.equals(" ")) {
                        JOptionPane.showMessageDialog(null, "Please enter a student name.", "Error", JOptionPane.ERROR_MESSAGE);
                    } else {
                        break;
                    }
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Error encountered, please try again.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
            query.getStudentContactInfo(studName);
        });

        jbFacultyContact.addActionListener(ae -> {
            String facName;
            while (true) {
                try {
                    facName = JOptionPane.showInputDialog("Please enter the name of the Faculty member you're trying to contact:");
                    if (facName.equals("") || facName.equals(" ")) {
                        JOptionPane.showMessageDialog(null, "Please enter a name", "Error", JOptionPane.ERROR_MESSAGE);
                    } else {
                        break;
                    }
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Error encountered, please try again.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
            query.getFacultyContactInfo(facName);
        });

        jbReporterContact.addActionListener(ae -> {
            String repName;
            while (true) {
                try {
                    repName = JOptionPane.showInputDialog("Please enter the name of the reporter you're trying to contact:");
                    if (repName.equals("") || repName.equals(" ")) { //Id was 0 or less, tell the user and have them try again
                        JOptionPane.showMessageDialog(null, "Please enter a reporter name.", "Error", JOptionPane.ERROR_MESSAGE);
                    } else {
                        break;
                    }
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Error encountered, please try again.", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
            query.getReporterContactInfo(repName);
        });

        jbCommonInterests.addActionListener(ae -> {
            String interest = "";
            while (true) {
                interest = JOptionPane.showInputDialog("Please enter the shared interest you're searching for:");
                if (interest == null || interest.equals("") || interest.equals(" ")) {
                    JOptionPane.showMessageDialog(null, "Please enter a shared interest to search for", "Error", JOptionPane.ERROR_MESSAGE);
                } else {
                    break;
                }
            }
            query.getCommonInterests(interest);
        });

        jbAddStudent.addActionListener(ae -> {
            int studID = calc.getStudentID();
            String majName = "";
            String gpa = "";

            name = JOptionPane.showInputDialog("Please enter the full student name (First Last):");
            majName = JOptionPane.showInputDialog("Please enter the major name:");
            email = JOptionPane.showInputDialog("Please enter the student email address:");
            gpa = JOptionPane.showInputDialog("Please enter the student GPA:");
            interest = JOptionPane.showInputDialog("Please enter the interest keyword:");
            phone = JOptionPane.showInputDialog("Please enter the student phone number:");
            type = JOptionPane.showInputDialog("Please enter the student phone type:");
            insert.addStudent(studID, name, majName, email, gpa, interest, phone, type);
        });

        jbAddFaculty.addActionListener(ae -> {
            int facID = calc.getFacultyID();
            String deptName = "";

            name = JOptionPane.showInputDialog("Please enter the full faculty name (First Last):");
            deptName = JOptionPane.showInputDialog("Please enter the department name:");
            email = JOptionPane.showInputDialog("Please enter the faculty email address:");
            interest = JOptionPane.showInputDialog("Please enter the interest keyword:");
            phone = JOptionPane.showInputDialog("Please enter the faculty phone number:");
            type = JOptionPane.showInputDialog("Please enter the faculty phone type:");
            insert.addFaculty(facID, name, deptName, email, interest, phone, type);
        });

        jbAddReporter.addActionListener(ae -> {
            int repID = calc.getReporterID();

            name = JOptionPane.showInputDialog("Please enter the full reporter name (First Last):");
            compName = JOptionPane.showInputDialog("Please enter the company name:");
            email = JOptionPane.showInputDialog("Please enter the reporter email address:");
            phone = JOptionPane.showInputDialog("Please enter the reporter phone number:");
            type = JOptionPane.showInputDialog("Please enter the reporter phone type:");
            insert.addReporter(repID, name, compName, email, phone, type);
        });
    }

    public static void main(String[] args) {
        new Project_Presentation();
    }
}