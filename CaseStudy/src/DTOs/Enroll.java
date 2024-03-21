/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

/**
 *
 * @author Hassan Hosny
 */
public class Enroll {

    // STUDENT_ID, COURSE_ID, GRADE, POINTS, QUALITY_POINTS
    private String student_name;
    private String course_name;
    private int course_credits;

    private int student_id;
    private int course_id;
    private String grade;
    private float points;
    private float quality_points;

    public Enroll(String student_name, String course_name, int course_credits, int student_id, int course_id, String grade, float points, float quality_points) {
        this.student_name = student_name;
        this.course_name = course_name;
        this.course_credits = course_credits;
        this.student_id = student_id;
        this.course_id = course_id;
        this.grade = grade;
        this.points = points;
        this.quality_points = quality_points;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public float getPoints() {
        return points;
    }

    public void setPoints(float points) {
        this.points = points;
    }

    public float getQuality_points() {
        return quality_points;
    }

    public void setQuality_points(float quality_points) {
        this.quality_points = quality_points;
    }

    public String getStudent_name() {
        return student_name;
    }

    public void setStudent_name(String student_name) {
        this.student_name = student_name;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public int getCourse_credits() {
        return course_credits;
    }

    public void setCourse_credits(int course_credits) {
        this.course_credits = course_credits;
    }
    
    

}
