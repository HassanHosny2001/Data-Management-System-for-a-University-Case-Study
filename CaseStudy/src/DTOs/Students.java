/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTOs;

import java.sql.Date;

/**
 *
 * @author Hassan Hosny
 */
public class Students {
    // STUDENT_ID, FNAME, LNAME, PHONE, EMAIL, DOB, STREET, CITY, GPA, DEPARTMENT_ID
    private int student_id;
    private String fname;
    private String lname;
    private String phone;
    private String email;
    private Date dob;
    private String street;
    private String city;
    private float gpa;
    private int department_id;
    private int semester;

    public Students(int student_id, String fname, String lname, String phone, String email, Date dob, String street, String city, float gpa, int department_id, int semester) {
        this.student_id = student_id;
        this.fname = fname;
        this.lname = lname;
        this.phone = phone;
        this.email = email;
        this.dob = dob;
        this.street = street;
        this.city = city;
        this.gpa = gpa;
        this.department_id = department_id;
        this.semester = semester;
    }

    public Students(int student_id, String fname, float gpa) {
        this.student_id = student_id;
        this.fname = fname;
        this.gpa = gpa;
    }
    
    

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public float getGpa() {
        return gpa;
    }

    public void setGpa(float gpa) {
        this.gpa = gpa;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    
    
    
}
