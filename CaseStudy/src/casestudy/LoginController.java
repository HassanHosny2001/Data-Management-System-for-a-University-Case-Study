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
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.text.Text;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Hassan Hosny
 */
public class LoginController implements Initializable {

    @FXML
    private BorderPane borderlogin;
    @FXML
    private AnchorPane anchorlogin;
    @FXML
    private ImageView loginbird;
    @FXML
    private TextField usernameTF;
    @FXML
    private PasswordField paswordPF;
    @FXML
    private Button loginbt;
    @FXML
    private Text text2023;
    @FXML
    private Text wronglogin;
    @FXML
    private Label emailtxtlogin;
    @FXML
    private Label txtpasslogin;

    private Parent root;
    private Stage stage;
    private Scene scene;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }

    @FXML
    private void clearMsg(MouseEvent event) {
    }

    @FXML
    private void clearMsg(ActionEvent event) {
    }

    @FXML
    private void login(ActionEvent event) throws IOException {
        if ("admin@gmail.com".equals(usernameTF.getText()) && "123".equals(paswordPF.getText())) {
            root = FXMLLoader.load(getClass().getResource("main.fxml"));
            stage = (Stage) loginbt.getScene().getWindow();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.show();
        } else {
            // Show an alert for incorrect username or password
            Alert alert = new Alert(AlertType.ERROR);
            alert.setTitle("Login Error");
            alert.setHeaderText("Invalid Credentials");
            alert.setContentText("Please check your username and password and try again.");
            alert.showAndWait();
        }
    }

}
