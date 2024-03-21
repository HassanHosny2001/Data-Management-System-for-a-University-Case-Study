/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package casestudy;

import DAO.ReportDAO;
import DTOs.Courses;
import DTOs.Students;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.chart.Axis;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;

/**
 * FXML Controller class
 *
 * @author Hassan Hosny
 */
public class ReportController implements Initializable {

    @FXML
    private AnchorPane report;
    @FXML
    private TableView<Courses> avg_table;
    @FXML
    private TableView<Students> gpa_table;
    @FXML
    private TableColumn<Courses, Integer> course_id_col;
    @FXML
    private TableColumn<Courses, String> course_name_col;
    @FXML
    private TableColumn<Courses, Float> avg_grade_col;
    @FXML
    private TableColumn<Courses, Integer> no_of_students_col;
    @FXML
    private TableColumn<Students, Integer> student_id_col;
    @FXML
    private TableColumn<Students, String> student_name_col;
    @FXML
    private TableColumn<Students, Float> gpa_col;

    /**
     * Initializes the controller class.
     */
    private ObservableList<Courses> c;
    private ObservableList<Students> st;
    @FXML
    private BarChart<String, Number> chart;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        student_id_col.setCellValueFactory(new PropertyValueFactory<>("student_id"));
        student_name_col.setCellValueFactory(new PropertyValueFactory<>("fname"));
        gpa_col.setCellValueFactory(new PropertyValueFactory<>("gpa"));

        try {
            ReportDAO repo = new ReportDAO();
            st = repo.getStudentGPA();

            gpa_table.setItems(st);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        course_id_col.setCellValueFactory(new PropertyValueFactory<>("course_id"));
        course_name_col.setCellValueFactory(new PropertyValueFactory<>("Course_name"));
        avg_grade_col.setCellValueFactory(new PropertyValueFactory<>("avg_grade"));
        no_of_students_col.setCellValueFactory(new PropertyValueFactory<>("count"));

        try {
            ReportDAO repo = new ReportDAO();
            c = repo.getAvgGrades();

            avg_table.setItems(c);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        setupBarChart();

    }

    private void setupBarChart() {
        // Create a data series for the chart
        XYChart.Series<String, Number> series = new XYChart.Series<>();

        try {
            ReportDAO repo = new ReportDAO();
            st = repo.getTop10StudentCGPA();

            // Print data for debugging
            System.out.println("Top 10 Students' CGPA Data:");
            for (Students student : st) {
                System.out.println(student.getFname() + ": " + student.getGpa());
            }

            // Add data to the series
            for (Students student : st) {
                series.getData().add(new XYChart.Data<>(student.getFname(), student.getGpa()));
            }

            // Print data series for debugging
            System.out.println("Data Series for Chart: " + series.getData());

            // Set the data series to the chart
            chart.getData().clear();
            chart.getData().add(series);

            // Customize chart axes if needed
            CategoryAxis xAxis = (CategoryAxis) chart.getXAxis();
            xAxis.setLabel("Student Name");

            NumberAxis yAxis = (NumberAxis) chart.getYAxis();
            yAxis.setLabel("CGPA");

            // Additional debugging information
            System.out.println("Chart Data: " + chart.getData());

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
