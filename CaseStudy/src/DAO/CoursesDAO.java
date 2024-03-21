/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTOs.Courses;
import DTOs.Departments;
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
public class CoursesDAO {

    public ObservableList<Courses> getCourses() throws SQLException {
        ObservableList<Courses> courses = FXCollections.observableArrayList();
        String sql = "select * from courses";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Courses course;

            while (rs.next()) {
                course = new Courses(rs.getInt("course_id"), rs.getString("course_name"), rs.getString("course_description"),
                        rs.getInt("department_id"), rs.getInt("course_credits"), rs.getInt("semester"), 0,0);

                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return courses;
    }

    public void insertCourse(Courses course) throws SQLException {
        String sql = "INSERT INTO Courses (COURSE_NAME, COURSE_DESCRIPTION, DEPARTMENT_ID, COURSE_CREDITS, SEMESTER) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, course.getCourse_name());
            stmt.setString(2, course.getCourse_description());
            stmt.setInt(3, course.getDepartment_id());
            stmt.setInt(4, course.getCourse_credits());
            stmt.setInt(5, course.getSemester());

            // Execute the insert statement
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error inserting student", e);
        }
    }

    public void deleteCourse(int courseId) throws SQLException {
        String sql = "DELETE FROM courses WHERE course_id = ?";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error deleting course", e);
        }
    }
}
