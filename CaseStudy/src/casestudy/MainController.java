/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package casestudy;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Hyperlink;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Hassan Hosny
 */
public class MainController implements Initializable {

    @FXML
    private AnchorPane mainScene;

    private Parent root;
    private Stage stage;
    private Scene scene;
    @FXML
    private AnchorPane switchview;
    @FXML
    private BorderPane main;
    @FXML
    private Button student_btn;
    @FXML
    private Button enroll_btn;
    @FXML
    private Button dept_course_btn;
    @FXML
    private Button report_btn;
    @FXML
    private Hyperlink Logout_hyperlink;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    @FXML
    private void loadstudents(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("students.fxml"));
        Parent root = fxmlLoader.load();
        main.setCenter(root);
    }

    @FXML
    private void loadenroll(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("enroll.fxml"));
        Parent root = fxmlLoader.load();
        main.setCenter(root);
    }

    @FXML
    private void load_dept_course(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("departmentsCourses.fxml"));
        Parent root = fxmlLoader.load();
        main.setCenter(root);
    }

    @FXML
    private void loadreport(ActionEvent event) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader();
        fxmlLoader.setLocation(getClass().getResource("report.fxml"));
        Parent root = fxmlLoader.load();
        main.setCenter(root);
    }

    @FXML
    private void logoutSwitch(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("login.fxml"));
        root = loader.load();
        stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

}
