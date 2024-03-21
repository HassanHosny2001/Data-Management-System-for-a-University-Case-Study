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
public class ReportDAO {

    public ObservableList<Courses> getAvgGrades() throws SQLException {
        ObservableList<Courses> course = FXCollections.observableArrayList();
        String sql = "select e.course_id, c.course_name, count(student_id), round(avg(points), 4) average_grade\n"
                + "from enroll e\n"
                + "join courses c on c.course_id = e.course_id\n"
                + "group by e.course_id, c.course_name\n"
                + "order by course_id";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Courses c;

            while (rs.next()) {
                c = new Courses(
                        rs.getInt("course_id"),
                        rs.getString("course_name"),
                        null,
                        0,
                        0,
                        0,
                        rs.getFloat("average_grade"),
                        rs.getInt("count(student_id)")
                );

                course.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return course;
    }

    public ObservableList<Students> getStudentGPA() throws SQLException {
        ObservableList<Students> st = FXCollections.observableArrayList();
        String sql = "select student_id, fname||' '||lname fname, gpa\n"
                + "from students";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Students student;

            while (rs.next()) {
                student = new Students(rs.getInt("student_id"), rs.getString("fname"), rs.getFloat("gpa"));
                st.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return st;
    }

    public ObservableList<Students> getTop10StudentCGPA() throws SQLException {
        ObservableList<Students> st = FXCollections.observableArrayList();
        String sql = "SELECT * \n"
                + "FROM (\n"
                + "SELECT student_id, fname || ' ' || lname AS full_name, gpa \n"
                + "FROM students\n"
                + "ORDER BY gpa DESC\n"
                + ") \n"
                + "WHERE ROWNUM <= 10";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Students student = new Students(rs.getInt("student_id"), rs.getString("full_name"), rs.getFloat("gpa"));
                st.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error retrieving top 10 students by CGPA", e);
        }

        return st;
    }

}
