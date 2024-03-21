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
public class Courses {

    private int course_id;
    private String course_name;
    private String course_description;
    private int department_id;
    private int course_credits;
    private int semester;
    private float avg_grade;
    private int count;

    public Courses(int course_id, String course_name, String course_description, int department_id, int course_credits, int semester, float avg_grade, int count) {
        this.course_id = course_id;
        this.course_name = course_name;
        this.course_description = course_description;
        this.department_id = department_id;
        this.course_credits = course_credits;
        this.semester = semester;
        this.avg_grade = avg_grade;
        this.count = count;
    }

    public int getCourse_id() {
        return course_id;
    }

    public void setCourse_id(int course_id) {
        this.course_id = course_id;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_description() {
        return course_description;
    }

    public void setCourse_description(String course_description) {
        this.course_description = course_description;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public int getCourse_credits() {
        return course_credits;
    }

    public void setCourse_credits(int course_credits) {
        this.course_credits = course_credits;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public float getAvg_grade() {
        return avg_grade;
    }

    public void setAvg_grade(float avg_grade) {
        this.avg_grade = avg_grade;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

}
