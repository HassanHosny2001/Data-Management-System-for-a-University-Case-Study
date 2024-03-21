package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import DTOs.Departments;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class DepartmentDAO {

    public ObservableList<Departments> getDepartments() throws SQLException {
        ObservableList<Departments> departments = FXCollections.observableArrayList();
        String sql = "select * from departments order by department_id";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery()) {
            Departments dept;

            while (rs.next()) {
                dept = new Departments(rs.getInt("department_id"),
                        rs.getString("department_name"));
                departments.add(dept);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error retrieving departments", e);
        }

        return departments;
    }

    public void addDepartment(String departmentName) throws SQLException {
        String sql = "INSERT INTO departments (department_name) VALUES (?)";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, departmentName);

            // Execute the query
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error adding a new department", e);
        }
    }

    public void deleteDepartment(int departmentId) throws SQLException {
        String sql = "DELETE FROM departments WHERE department_id = ?";

        try (Connection conn = DAO.conndb();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, departmentId);

            // Execute the query
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Handle or log the exception appropriately
            throw new SQLException("Error deleting the department", e);
        }
    }
}
