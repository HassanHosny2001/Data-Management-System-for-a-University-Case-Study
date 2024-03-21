/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTOs.Courses;
import DTOs.Students;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

/**
 *
 * @author Hassan Hosny
 */
public class StudentsDAO {

    public ObservableList<Students> getAllStudents() throws SQLException {
        ObservableList<Students> st = FXCollections.observableArrayList();
        String sql = "select * from students";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Students student;

            while (rs.next()) {
                student = new Students(rs.getInt("student_id"), rs.getString("fname"), rs.getString("lname"),
                        rs.getString("phone"), rs.getString("email"), rs.getDate("dob"),
                        rs.getString("street"), rs.getString("city"), rs.getFloat("gpa"),
                        rs.getInt("department_id"), rs.getInt("semester"));
                st.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return st;
    }

    public void insertStudent(Students student) throws SQLException {
        String sql = "INSERT INTO Students (fname, lname, phone, email, DOB, street, city, department_id, semester) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, student.getFname());
            stmt.setString(2, student.getLname());
            stmt.setString(3, student.getPhone());
            stmt.setString(4, student.getEmail());
            stmt.setDate(5, student.getDob());
            stmt.setString(6, student.getStreet());
            stmt.setString(7, student.getCity());
            stmt.setInt(8, student.getDepartment_id());
            stmt.setInt(9, student.getSemester());

            // Execute the insert statement
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error inserting student", e);
        }
    }
    
     public void deleteStudent(int studentId) throws SQLException {
        String sql = "DELETE FROM students WHERE student_id = ?";

        try (Connection conn = DAO.conndb();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set the parameter for the student_id in the WHERE clause
            stmt.setInt(1, studentId);

            // Execute the DELETE statement
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected == 0) {
                // If no rows were affected, the student with the given ID was not found
                throw new SQLException("No student found with ID: " + studentId);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error deleting student with ID: " + studentId, e);
        }
    }

}
