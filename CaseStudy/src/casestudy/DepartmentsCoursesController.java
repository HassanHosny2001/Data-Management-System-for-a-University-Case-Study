/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package casestudy;

import DAO.CoursesDAO;
import DAO.DepartmentDAO;
import DTOs.Courses;
import DTOs.Departments;
import java.net.URL;
import java.sql.SQLException;
import java.util.Optional;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonBar.ButtonData;
import javafx.scene.control.ButtonType;
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
public class DepartmentsCoursesController implements Initializable {

    @FXML
    private AnchorPane departement_form;
    @FXML
    private TableView<Departments> dept_tabel_view;
    @FXML
    private TableColumn<Departments, Integer> deptview_dept_id_col;
    @FXML
    private TableColumn<Departments, String> deptview_dept_name_col;
    @FXML
    private Label deptview_dept_id_label;
    @FXML
    private Button deptview_add_btn;
    @FXML
    private Button deptview_delete_btn;
    @FXML
    private TableView<Courses> courses_tabel_view;
    @FXML
    private TableColumn<Courses, Integer> courseview_course_id_col;
    @FXML
    private TableColumn<Courses, String> courseview_course_name_col;
    @FXML
    private TableColumn<Courses, Integer> courseview_credit_col;
    @FXML
    private TableColumn<Courses, String> courseview_description_col;
    @FXML
    private TableColumn<Courses, Integer> courseview_department_id_col;
    @FXML
    private TableColumn<Courses, Integer> courseview_semester_col;
    @FXML
    private Label courseview_course_name_label;
    @FXML
    private TextField courseview_course_name_txtfield;
    @FXML
    private Label courseview_credit_label;
    @FXML
    private Label courseview_course_id_label1;
    @FXML
    private Label courseview_credit_label1;
    @FXML
    private Button courseview_add_btn;
    @FXML
    private Button courseview_delete_btn;
    @FXML
    private Label deptview_dept_id_label1;
    @FXML
    private Label deptview_dept_id_label11;

    /**
     * Initializes the controller class.
     */
    private ObservableList<Departments> departments;
    private ObservableList<Courses> course;

    @FXML
    private TextField deptview_dept_name_txtfield;
    @FXML
    private TextField courseview_description_txtfield;
    @FXML
    private TextField courseview_dept_id_txtfield2;
    @FXML
    private TextField courseview_course_credits_txtfield1;
    @FXML
    private Label courseview_credit_label11;
    @FXML
    private TextField courseview_semester_txtfield11;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        deptview_dept_id_col.setCellValueFactory(new PropertyValueFactory<>("department_id"));
        deptview_dept_name_col.setCellValueFactory(new PropertyValueFactory<>("department_name"));

        try {
            DepartmentDAO departmentDAO = new DepartmentDAO();
            departments = departmentDAO.getDepartments();
            dept_tabel_view.setItems(departments);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        courseview_course_id_col.setCellValueFactory(new PropertyValueFactory<>("course_id"));
        courseview_course_name_col.setCellValueFactory(new PropertyValueFactory<>("course_name"));
        courseview_description_col.setCellValueFactory(new PropertyValueFactory<>("course_description"));
        courseview_department_id_col.setCellValueFactory(new PropertyValueFactory<>("department_id"));
        courseview_credit_col.setCellValueFactory(new PropertyValueFactory<>("course_credits"));
        courseview_semester_col.setCellValueFactory(new PropertyValueFactory<>("semester"));

        try {
            CoursesDAO coursesDAO = new CoursesDAO();
            course = coursesDAO.getCourses();
            courses_tabel_view.setItems(course);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @FXML
    private void deptview_addaction(ActionEvent event) {
        try {
            String departmentName = deptview_dept_name_txtfield.getText().trim();

            // Check if the department name is empty
            if (departmentName.isEmpty()) {
                // Show an alert for empty department name
                Alert alert = new Alert(AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Missing Information");
                alert.setContentText("Please enter a department name.");
                alert.showAndWait();
                return; // Exit the method without proceeding further
            }

            DepartmentDAO departmentDAO = new DepartmentDAO();
            departmentDAO.addDepartment(departmentName);

            // Refresh the departments TableView after adding a new department
            departments.clear();
            departments.addAll(departmentDAO.getDepartments());
            deptview_dept_name_txtfield.clear();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or display the error message
        }
    }

    @FXML
    private void deptview_deleteaction(ActionEvent event) {
        try {
            Departments selectedDepartment = dept_tabel_view.getSelectionModel().getSelectedItem();

            if (selectedDepartment != null) {
                // Create a confirmation alert
                Alert confirmAlert = new Alert(AlertType.CONFIRMATION);
                confirmAlert.setTitle("Confirmation");
                confirmAlert.setHeaderText("Delete Department");
                confirmAlert.setContentText("Are you sure you want to delete this department?\n"
                        + "This action will delete all related courses and students.");

                // Customize the buttons
                ButtonType buttonTypeYes = new ButtonType("Yes", ButtonData.OK_DONE);
                ButtonType buttonTypeNo = new ButtonType("No", ButtonData.CANCEL_CLOSE);
                confirmAlert.getButtonTypes().setAll(buttonTypeYes, buttonTypeNo);

                // Show the confirmation dialog and wait for user input
                Optional<ButtonType> result = confirmAlert.showAndWait();

                // Check if the user clicked "Yes"
                if (result.orElse(buttonTypeNo) == buttonTypeYes) {
                    int departmentId = selectedDepartment.getDepartment_id();

                    DepartmentDAO departmentDAO = new DepartmentDAO();
                    departmentDAO.deleteDepartment(departmentId);

                    // Refresh the departments TableView after deleting a department
                    departments.clear();
                    departments.addAll(departmentDAO.getDepartments());
                }
            } else {
                // Show an alert when nothing is selected for deletion
                Alert alert = new Alert(AlertType.INFORMATION);
                alert.setTitle("Information");
                alert.setHeaderText(null);
                alert.setContentText("Please select a department to delete.");

                alert.showAndWait();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or display the error message
        }
    }

    @FXML
    private void courseview_addaction(ActionEvent event) {
        try {
            // Get values from the text fields
            String courseName = courseview_course_name_txtfield.getText().trim();
            String courseDescription = courseview_description_txtfield.getText().trim();

            // Check if any of the required fields is empty
            if (courseName.isEmpty() || courseDescription.isEmpty() || courseview_dept_id_txtfield2.getText().trim().isEmpty() || courseview_course_credits_txtfield1.getText().trim().isEmpty() || courseview_semester_txtfield11.getText().trim().isEmpty()) {
                // Display an alert if any of the required fields is empty
                Alert alert = new Alert(AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Missing Information");
                alert.setContentText("Please fill in all the required fields.");
                alert.showAndWait();
                return; // Exit the method without proceeding further
            }

            int departmentId, courseCredits, courseSemester;
            try {
                // Validate and parse integers
                departmentId = Integer.parseInt(courseview_dept_id_txtfield2.getText().trim());
                courseCredits = Integer.parseInt(courseview_course_credits_txtfield1.getText().trim());
                courseSemester = Integer.parseInt(courseview_semester_txtfield11.getText().trim());
            } catch (NumberFormatException e) {
                // Handle invalid input (non-integer)
                Alert alert = new Alert(AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Invalid Input");
                alert.setContentText("Please enter valid integers for Department ID and Course Credits.");
                alert.showAndWait();
                return;
            }

            // Create a new Courses object with the entered values
            Courses newCourse = new Courses(0, courseName, courseDescription, departmentId, courseCredits, courseSemester, 0,0);

            // Insert the new course using the DAO
            CoursesDAO coursesDAO = new CoursesDAO();
            coursesDAO.insertCourse(newCourse);

            // Refresh the courses TableView after adding a new course
            course.clear();
            course.addAll(coursesDAO.getCourses());
            courses_tabel_view.setItems(course);

            // Clear all text fields
            courseview_course_name_txtfield.clear();
            courseview_description_txtfield.clear();
            courseview_dept_id_txtfield2.clear();
            courseview_course_credits_txtfield1.clear();
            courseview_semester_txtfield11.clear();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or show an error message if necessary
            Alert alert = new Alert(AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Database Error");
            alert.setContentText("An error occurred while inserting the course. Please try again.");
            alert.showAndWait();
        }
    }

    @FXML
    private void courseview_deleteaction(ActionEvent event) {
        try {
            Courses selectedCourse = courses_tabel_view.getSelectionModel().getSelectedItem();

            if (selectedCourse != null) {
                // Create a confirmation alert
                Alert confirmAlert = new Alert(AlertType.CONFIRMATION);
                confirmAlert.setTitle("Confirmation");
                confirmAlert.setHeaderText("Delete Course");
                confirmAlert.setContentText("Are you sure you want to delete this course?");

                // Customize the buttons
                ButtonType buttonTypeYes = new ButtonType("Yes", ButtonData.OK_DONE);
                ButtonType buttonTypeNo = new ButtonType("No", ButtonData.CANCEL_CLOSE);
                confirmAlert.getButtonTypes().setAll(buttonTypeYes, buttonTypeNo);

                // Show the confirmation dialog and wait for user input
                Optional<ButtonType> result = confirmAlert.showAndWait();

                // Check if the user clicked "Yes"
                if (result.orElse(buttonTypeNo) == buttonTypeYes) {
                    int courseId = selectedCourse.getCourse_id();

                    CoursesDAO coursesDAO = new CoursesDAO();
                    coursesDAO.deleteCourse(courseId);

                    // Refresh the courses TableView after deleting a course
                    course.clear();
                    course.addAll(coursesDAO.getCourses());
                    courses_tabel_view.setItems(course);
                }
            } else {
                // Show an alert when nothing is selected for deletion
                Alert alert = new Alert(AlertType.INFORMATION);
                alert.setTitle("Information");
                alert.setHeaderText(null);
                alert.setContentText("Please select a course to delete.");

                alert.showAndWait();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or display the error message
        }
    }

}
