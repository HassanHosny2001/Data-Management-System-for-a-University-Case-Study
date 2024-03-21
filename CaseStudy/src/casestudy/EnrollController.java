/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package casestudy;

import DAO.EnrollDAO;
import DTOs.Enroll;
import com.sun.javafx.image.impl.IntArgb;
import java.net.URL;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;

/**
 * FXML Controller class
 *
 * @author Hassan Hosny
 */
public class EnrollController implements Initializable {

    @FXML
    private AnchorPane courses_form;
    @FXML
    private TableView<Enroll> enroll_table;
    @FXML
    private TableColumn<Enroll, String> name_col;
    @FXML
    private TableColumn<Enroll, String> course_name_col;
    @FXML
    private TableColumn<Enroll, Integer> course_credits_col;
    @FXML
    private TableColumn<Enroll, Integer> id_col2;
    @FXML
    private TableColumn<Enroll, Integer> course_id_col2;

    /**
     * Initializes the controller class.
     */
    @FXML
    private TableView<Enroll> evaluation_table1;
    @FXML
    private TableColumn<Enroll, String> name_col1;
    @FXML
    private TableColumn<Enroll, String> course_name_col1;
    @FXML
    private TableColumn<Enroll, Integer> course_credits_col1;
    @FXML
    private TableColumn<Enroll, String> grade_col;
    @FXML
    private TableColumn<Enroll, Float> points_col;

    private ObservableList<Enroll> enroll;
    private ObservableList<Enroll> enroll1;
    @FXML
    private Label label_enroll_student_id;
    @FXML
    private TextField student_id_enroll_txtfield;
    @FXML
    private Button enroll_add_btn;
    @FXML
    private Button enroll_delete_btn;
    @FXML
    private Label label_enroll;
    @FXML
    private Label label_enroll_course_id;
    @FXML
    private TextField course_id_enroll_txtfield;
    @FXML
    private Label label_grade;
    @FXML
    private TextField grade_txtfield;
    @FXML
    private Button grade_add_btn;
    @FXML
    private Label label_grade_student_id;
    @FXML
    private TextField student_id_grade_txtfield;
    @FXML
    private Label label_grade_course_id;
    @FXML
    private TextField course_id_grade_txtfield;

    @Override
    public void initialize(URL url, ResourceBundle rb) {

        id_col2.setCellValueFactory(new PropertyValueFactory<>("Student_id"));
        name_col.setCellValueFactory(new PropertyValueFactory<>("Student_name"));
        course_id_col2.setCellValueFactory(new PropertyValueFactory<>("Course_id"));
        course_name_col.setCellValueFactory(new PropertyValueFactory<>("Course_name"));
        course_credits_col.setCellValueFactory(new PropertyValueFactory<>("Course_credits"));

        try {
            EnrollDAO enrollDAO = new EnrollDAO();
            enroll = enrollDAO.getEnrolledStudents();

            for (Enroll e : enroll) {
                System.out.println("Student Name: " + e.getStudent_name() + ", Course Name: " + e.getCourse_name() + ", Credits: " + e.getCourse_credits());
            }

            enroll_table.setItems(enroll);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        name_col1.setCellValueFactory(new PropertyValueFactory<>("Student_name"));
        course_name_col1.setCellValueFactory(new PropertyValueFactory<>("Course_name"));
        course_credits_col1.setCellValueFactory(new PropertyValueFactory<>("Course_credits"));
        grade_col.setCellValueFactory(new PropertyValueFactory<>("grade"));
        points_col.setCellValueFactory(new PropertyValueFactory<>("points"));

        try {
            EnrollDAO enrollDAO1 = new EnrollDAO();
            enroll1 = enrollDAO1.getEvaluationStudents();

            evaluation_table1.setItems(enroll1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void enroll_addaction(ActionEvent event) {
        try {
            // Get values from the text fields
            int studentId = Integer.parseInt(student_id_enroll_txtfield.getText());
            int courseId = Integer.parseInt(course_id_enroll_txtfield.getText());

            // Validate if both studentId and courseId are positive integers
            if (studentId <= 0 || courseId <= 0) {
                // Show an alert for invalid input
                Alert alert = new Alert(AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Invalid Input");
                alert.setContentText("Please enter valid student and course IDs.");
                alert.showAndWait();
                return; // Exit the method without proceeding further
            }

            // Call the method in EnrollmentDAO to enroll the student in the course
            EnrollDAO enrollmentDAO = new EnrollDAO();
            enrollmentDAO.enrollStudentInCourse(studentId, courseId);

            // Optionally, you can clear the text fields after successful enrollment
            student_id_enroll_txtfield.clear();
            course_id_enroll_txtfield.clear();

            EnrollDAO enrollDAO = new EnrollDAO();
            enroll.clear();
            enroll.addAll(enrollDAO.getEnrolledStudents());
            enroll_table.setItems(enroll);

            EnrollDAO enrollDAO1 = new EnrollDAO();
            enroll1.clear();
            enroll1.addAll(enrollDAO1.getEvaluationStudents());
            evaluation_table1.setItems(enroll1);

            // Show a success message or update UI as needed
            Alert successAlert = new Alert(AlertType.INFORMATION);
            successAlert.setTitle("Success");
            successAlert.setHeaderText(null);
            successAlert.setContentText("Enrollment successful!");
            successAlert.showAndWait();
        } catch (NumberFormatException e) {
            // Handle the case where parsing studentId or courseId fails
            Alert alert = new Alert(AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Invalid Input");
            alert.setContentText("Please enter valid numeric values for student and course IDs.");
            alert.showAndWait();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or display the error message
            Alert errorAlert = new Alert(AlertType.ERROR);
            errorAlert.setTitle("Error");
            errorAlert.setHeaderText(null);
            errorAlert.setContentText("Error enrolling student in course. Please try again.");
            errorAlert.showAndWait();
        }
    }

    @FXML
    private void enroll_deleteaction(ActionEvent event) {
        // Get the selected enrollment from the table
        Enroll selectedEnrollment = enroll_table.getSelectionModel().getSelectedItem();

        if (selectedEnrollment == null) {
            // If no enrollment is selected, show an alert
            Alert alert = new Alert(AlertType.WARNING);
            alert.setTitle("Warning");
            alert.setHeaderText(null);
            alert.setContentText("Please select an enrollment to delete.");
            alert.showAndWait();
            return;
        }

        try {
            // Call the method in EnrollmentDAO to delete the selected enrollment
            EnrollDAO enrollmentDAO = new EnrollDAO();
            enrollmentDAO.deleteEnrollment(selectedEnrollment.getStudent_id(), selectedEnrollment.getCourse_id());

            // Refresh the enroll_table TableView after deleting the enrollment
            try {
                EnrollDAO enrollDAO = new EnrollDAO();
                enroll = enrollDAO.getEnrolledStudents();
                enroll_table.setItems(enroll);

                EnrollDAO enrollDAO1 = new EnrollDAO();
                enroll1.clear();
                enroll1.addAll(enrollDAO1.getEvaluationStudents());
                evaluation_table1.setItems(enroll1);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            // Show a success message or update UI as needed
            Alert successAlert = new Alert(AlertType.INFORMATION);
            successAlert.setTitle("Success");
            successAlert.setHeaderText(null);
            successAlert.setContentText("Enrollment deleted successfully!");
            successAlert.showAndWait();
        } catch (SQLException e) {
            // Handle the SQL exception appropriately
            Alert errorAlert = new Alert(AlertType.ERROR);
            errorAlert.setTitle("Error");
            errorAlert.setHeaderText(null);
            errorAlert.setContentText("Error deleting enrollment. Please try again.");
            errorAlert.showAndWait();
        }
    }

    @FXML
    private void grade_addaction(ActionEvent event) {
        try {
            // Get values from the text fields
            int studentId = Integer.parseInt(student_id_grade_txtfield.getText());
            int courseId = Integer.parseInt(course_id_grade_txtfield.getText());
            String grade = grade_txtfield.getText();

            // Call the method in EnrollmentDAO to add the grade
            EnrollDAO enrollmentDAO = new EnrollDAO();
            enrollmentDAO.addGrade(studentId, courseId, grade);

            // Optionally, you can clear the text fields after successful grade addition
            student_id_grade_txtfield.clear();
            course_id_grade_txtfield.clear();
            grade_txtfield.clear();

            // Refresh the evaluation_table1 TableView after adding a grade
            try {
                EnrollDAO enrollDAO1 = new EnrollDAO();
                enroll1 = enrollDAO1.getEvaluationStudents();
                evaluation_table1.setItems(enroll1);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            // Show a success message or update UI as needed
            Alert successAlert = new Alert(AlertType.INFORMATION);
            successAlert.setTitle("Success");
            successAlert.setHeaderText(null);
            successAlert.setContentText("Grade added successfully!");
            successAlert.showAndWait();
        } catch (NumberFormatException e) {
            // Handle the case where parsing studentId or courseId fails
            Alert alert = new Alert(AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Invalid Input");
            alert.setContentText("Please enter valid numeric values for student and course IDs.");
            alert.showAndWait();
        } catch (SQLException e) {
            // Handle the SQL exception appropriately
            Alert errorAlert = new Alert(AlertType.ERROR);
            errorAlert.setTitle("Error");
            errorAlert.setHeaderText(null);
            errorAlert.setContentText("Error adding grade. Please try again.");
            errorAlert.showAndWait();
        }
    }

}
