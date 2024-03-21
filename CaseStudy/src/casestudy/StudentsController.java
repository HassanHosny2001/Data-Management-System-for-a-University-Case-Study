/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package casestudy;

import DAO.CoursesDAO;
import DAO.StudentsDAO;
import DTOs.Courses;
import DTOs.Students;
import java.net.URL;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.DatePicker;
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
public class StudentsController implements Initializable {

    @FXML
    private AnchorPane students_form;
    @FXML
    private TableView<Students> students_tabel_view;
    @FXML
    private TableColumn<Students, Integer> studentview_student_id;
    @FXML
    private TableColumn<Students, String> studentview_first_name;
    @FXML
    private TableColumn<Students, String> studentview_last_name;
    @FXML
    private TableColumn<Students, String> studentview_phone;
    @FXML
    private TableColumn<Students, String> studentview_email;
    @FXML
    private TableColumn<Students, Date> studentview_dob;
    @FXML
    private TableColumn<Students, String> studentview_street;
    @FXML
    private TableColumn<Students, String> studentview_city;
    @FXML
    private TableColumn<Students, Integer> studentview_dept_id;
    @FXML
    private TableColumn<Students, Integer> studentview_semester;
    @FXML
    private Label studentview_first_name_label;
    @FXML
    private TextField studentview_first_name_txtfield;
    @FXML
    private Label studentview_last_name_label;
    @FXML
    private TextField studentview_last_name_txtfield;
    @FXML
    private Label studentview_date_label;
    @FXML
    private Label studentview_city_label;
    @FXML
    private Label studentview_semester_label;
    @FXML
    private TextField studentview_semester_txtfield;
    @FXML
    private DatePicker studentview_date_txtfield;
    @FXML
    private Button studentview_addbtn;
    @FXML
    private Button studentview_deletebtn;
    @FXML
    private TextField studentview_city_txtfield;
    @FXML
    private TextField studentview_email_txtfield;
    @FXML
    private Label studentview_student_email_label;
    @FXML
    private Label studentview_student_dept_id_label;
    @FXML
    private TextField studentview_dept_id_txtfield;
    @FXML
    private Label studentview_student_phone_label;
    @FXML
    private TextField studentview_phone_txtfield;
    @FXML
    private Label studentview_street_label;
    @FXML
    private TextField studentview_street_txtfield1;

    private ObservableList<Students> st;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        studentview_student_id.setCellValueFactory(new PropertyValueFactory<>("student_id"));
        studentview_first_name.setCellValueFactory(new PropertyValueFactory<>("fname"));
        studentview_last_name.setCellValueFactory(new PropertyValueFactory<>("lname"));
        studentview_phone.setCellValueFactory(new PropertyValueFactory<>("phone"));
        studentview_email.setCellValueFactory(new PropertyValueFactory<>("email"));
        studentview_dob.setCellValueFactory(new PropertyValueFactory<>("dob"));
        studentview_street.setCellValueFactory(new PropertyValueFactory<>("street"));
        studentview_city.setCellValueFactory(new PropertyValueFactory<>("city"));
        studentview_dept_id.setCellValueFactory(new PropertyValueFactory<>("department_id"));
        studentview_semester.setCellValueFactory(new PropertyValueFactory<>("semester"));

        try {
            StudentsDAO studentDAO = new StudentsDAO();
            st = studentDAO.getAllStudents();
            students_tabel_view.setItems(st);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void studentview_addaction(ActionEvent event) {
        // Get values from the text fields and date picker
        String firstName = studentview_first_name_txtfield.getText();
        String lastName = studentview_last_name_txtfield.getText();
        String phone = studentview_phone_txtfield.getText();
        String email = studentview_email_txtfield.getText();

        Date dob = null;
        if (studentview_date_txtfield.getValue() != null) {
            dob = Date.valueOf(studentview_date_txtfield.getValue());
        }
        String street = studentview_street_txtfield1.getText();
        String city = studentview_city_txtfield.getText();
        String deptIdText = studentview_dept_id_txtfield.getText();
        String semesterText = studentview_semester_txtfield.getText();

        // Check if any of the required fields is empty
        if (firstName.isEmpty() || lastName.isEmpty() || phone.isEmpty() || email.isEmpty()
                || dob == null || street.isEmpty() || city.isEmpty() || studentview_dept_id_txtfield.getText().isEmpty() || studentview_semester_txtfield.getText().isEmpty()) {
            // Display an alert if any of the required fields is empty
            Alert alert = new Alert(AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Missing Information");
            alert.setContentText("Please fill in All the Required fields.");
            alert.showAndWait();
            return; // Exit the method without proceeding further
        }

        int departmentId = Integer.parseInt(studentview_dept_id_txtfield.getText());
        int semester = Integer.parseInt(studentview_semester_txtfield.getText());

        // Create a new Students object with the entered values
        Students newStudent = new Students(0, firstName, lastName, phone, email, dob, street, city, 0, departmentId, semester);

        try {
            // Insert the new student using the DAO
            StudentsDAO studentDAO = new StudentsDAO();
            studentDAO.insertStudent(newStudent);

            // Refresh the table view after insertion
            st = studentDAO.getAllStudents();
            students_tabel_view.setItems(st);
            studentview_first_name_txtfield.clear();
            studentview_last_name_txtfield.clear();
            studentview_phone_txtfield.clear();
            studentview_email_txtfield.clear();
            studentview_date_txtfield.setValue(null);
            studentview_street_txtfield1.clear();
            studentview_city_txtfield.clear();
            studentview_dept_id_txtfield.clear();
            studentview_semester_txtfield.clear();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or show an error message if necessary
        }
    }

    @FXML
    private void studentview_deleteaction(ActionEvent event) {
        // Get the selected student from the table view
        Students selectedStudent = students_tabel_view.getSelectionModel().getSelectedItem();

        // Check if a student is selected
        if (selectedStudent == null) {
            // If no student is selected, show an alert
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("No Student Selected");
            alert.setHeaderText(null);
            alert.setContentText("Please select a student to delete.");
            alert.showAndWait();
            return;
        }

        // Confirm the deletion with a confirmation dialog
        Alert confirmAlert = new Alert(Alert.AlertType.CONFIRMATION);
        confirmAlert.setTitle("Confirm Deletion");
        confirmAlert.setHeaderText(null);
        confirmAlert.setContentText("Are you sure you want to delete this student?");

        // Show the confirmation dialog and wait for user response
        if (confirmAlert.showAndWait().orElse(ButtonType.CANCEL) == ButtonType.OK) {
            try {
                // Delete the selected student using the DAO
                StudentsDAO studentDAO = new StudentsDAO();
                studentDAO.deleteStudent(selectedStudent.getStudent_id());

                // Refresh the table view after deletion
                st = studentDAO.getAllStudents();
                students_tabel_view.setItems(st);
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle or show an error message if necessary
            }
        }
    }

}
