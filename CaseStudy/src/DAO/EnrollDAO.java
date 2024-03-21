/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTOs.Enroll;
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
public class EnrollDAO {

    public ObservableList<Enroll> getEnrolledStudents() throws SQLException {
        ObservableList<Enroll> enroll = FXCollections.observableArrayList();
        String sql = "SELECT  st.student_id,st.fname || ' ' || st.lname AS student_name, \n"
                + "       c.course_id,c.course_name, \n"
                + "       c.course_credits\n"
                + "FROM students st\n"
                + "JOIN enroll e ON e.student_id = st.student_id\n"
                + "JOIN courses c ON e.course_id = c.course_id";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Enroll e;

            while (rs.next()) {
                e = new Enroll(rs.getString("student_name"), rs.getString("course_name"), rs.getInt("course_credits"), rs.getInt("student_id"), rs.getInt("course_id"), null, 0, 0);
                enroll.add(e);
                System.out.println("Student Name: " + rs.getString("student_name") + ", Course Name: " + rs.getString("course_name") + ", Credits: " + rs.getInt("course_credits"));
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return enroll;
    }

    public ObservableList<Enroll> getEvaluationStudents() throws SQLException {
        ObservableList<Enroll> enroll = FXCollections.observableArrayList();
        String sql = "select st.fname||' '||st.lname student_name, c.course_name, c.course_credits, e.grade, e.points\n"
                + "from students st\n"
                + "join enroll e on e.student_id = st.student_id\n"
                + "join courses c on e.course_id = c.course_id";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Enroll e;

            while (rs.next()) {
                e = new Enroll(rs.getString("student_name"), rs.getString("course_name"), rs.getInt("course_credits"), 0, 0, rs.getString("grade"), rs.getFloat("points"), 0);
                enroll.add(e);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return enroll;
    }

    public void enrollStudentInCourse(int studentId, int courseId) throws SQLException {
        String sql = "INSERT INTO enroll (student_id, course_id) VALUES (?, ?)";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error enrolling student in course", e);
        }
    }

    public void deleteEnrollment(int studentId, int courseId) throws SQLException {
        // Implement the logic to delete an enrollment based on studentId and courseId
        String sql = "DELETE FROM enroll WHERE student_id = ? AND course_id = ?";
        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, courseId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error deleting enrollment", e);
        }
    }

    public void addGrade(int studentId, int courseId, String grade) throws SQLException {
        // Implement the logic to add a grade for a student in a course
        String sql = "UPDATE enroll SET grade = ? WHERE student_id = ? AND course_id = ?";
        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, grade);
            stmt.setInt(2, studentId);
            stmt.setInt(3, courseId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error adding grade", e);
        }
    }
}
