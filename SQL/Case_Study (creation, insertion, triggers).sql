--------------------------------------------------------
--  File created - Sunday-February-11-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence COURSES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "UNIVERSITY"."COURSES_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "UNIVERSITY"."DEPARTMENTS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence STUDENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "UNIVERSITY"."STUDENTS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table COURSES
--------------------------------------------------------

  CREATE TABLE "UNIVERSITY"."COURSES" 
   (	"COURSE_ID" NUMBER, 
	"COURSE_NAME" VARCHAR2(255 BYTE), 
	"COURSE_DESCRIPTION" VARCHAR2(255 BYTE), 
	"DEPARTMENT_ID" NUMBER, 
	"COURSE_CREDITS" NUMBER, 
	"SEMESTER" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "UNIVERSITY"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER, 
	"DEPARTMENT_NAME" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ENROLL
--------------------------------------------------------

  CREATE TABLE "UNIVERSITY"."ENROLL" 
   (	"STUDENT_ID" NUMBER, 
	"COURSE_ID" NUMBER, 
	"GRADE" VARCHAR2(10 BYTE) DEFAULT NULL, 
	"POINTS" NUMBER(5,2) DEFAULT 0, 
	"QUALITY_POINTS" NUMBER(5,2) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STUDENTS
--------------------------------------------------------

  CREATE TABLE "UNIVERSITY"."STUDENTS" 
   (	"STUDENT_ID" NUMBER, 
	"FNAME" VARCHAR2(255 BYTE), 
	"LNAME" VARCHAR2(255 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"EMAIL" VARCHAR2(255 BYTE), 
	"DOB" DATE, 
	"STREET" VARCHAR2(255 BYTE), 
	"CITY" VARCHAR2(255 BYTE), 
	"GPA" NUMBER(5,2) DEFAULT 0, 
	"DEPARTMENT_ID" NUMBER, 
	"SEMESTER" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into UNIVERSITY.COURSES
SET DEFINE OFF;
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (1,'Introduction to Programming','Basic programming concepts',1,3,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (2,'Circuit Analysis','Fundamentals of electrical circuits',2,2,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (3,'Fluid Mechanics','Study of fluid behavior',3,2,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (4,'Structural Engineering','Analysis of structures',4,3,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (5,'Organic Chemistry','Study of carbon compounds',5,3,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (6,'Biomechanics','Application of mechanics to biological systems',6,2,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (7,'Aerodynamics','Study of the motion of air',7,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (8,'Environmental Impact Assessment','Evaluation of environmental effects',8,2,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (9,'Production Planning and Control','Optimizing manufacturing processes',9,2,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (10,'Materials Engineering','Study of materials properties',10,3,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (11,'Calculus I','Fundamental principles of calculus',11,3,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (12,'Mechanics','Study of motion and forces',12,2,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (13,'Data Structures','Advanced data organization techniques',1,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (14,'Digital Electronics','Study of digital circuits',2,2,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (15,'Thermodynamics','Principles of heat and energy transfer',3,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (16,'Transportation Engineering','Planning and design of transportation systems',4,2,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (17,'Inorganic Chemistry','Study of inorganic compounds',5,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (18,'Medical Imaging','Introduction to medical imaging technologies',6,2,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (19,'Flight Dynamics','Analysis of aircraft motion',7,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (20,'Sustainable Development','Environmental and social sustainability',8,2,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (21,'Quality Management','Principles of quality control',9,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (22,'Nanotechnology','Study of materials at the nanoscale',10,2,1);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (23,'Linear Algebra','Study of linear equations and matrices',11,3,2);
Insert into UNIVERSITY.COURSES (COURSE_ID,COURSE_NAME,COURSE_DESCRIPTION,DEPARTMENT_ID,COURSE_CREDITS,SEMESTER) values (24,'Optics','Principles of light and its properties',12,2,1);
REM INSERTING into UNIVERSITY.DEPARTMENTS
SET DEFINE OFF;
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (1,'Computer Science');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (2,'Electrical Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (3,'Mechanical Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (4,'Civil Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (5,'Chemical Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (6,'Biomedical Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (7,'Aerospace Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (8,'Environmental Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (9,'Industrial Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (10,'Materials Science and Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (11,'Mathematics');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (12,'Physics');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (13,'Biotechnology');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (14,'Software Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (15,'Electronics');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (16,'Telecommunications');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (17,'Automotive Engineering');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (18,'Robotics');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (19,'Renewable Energy');
Insert into UNIVERSITY.DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME) values (20,'Data Science');
REM INSERTING into UNIVERSITY.ENROLL
SET DEFINE OFF;
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (2,2,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (3,3,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (4,4,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (5,5,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (6,6,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (7,7,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (8,8,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (9,9,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (10,10,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (11,11,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (12,12,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (13,13,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (14,14,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (15,15,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (16,16,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (17,17,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (18,18,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (19,19,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (20,20,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (1,2,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (2,3,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (1,1,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (2,4,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (3,5,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (3,6,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (4,7,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (4,8,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (5,9,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (5,10,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (6,11,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (6,12,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (7,13,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (7,14,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (8,15,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (8,16,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (9,17,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (9,18,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (10,19,null,0,0);
Insert into UNIVERSITY.ENROLL (STUDENT_ID,COURSE_ID,GRADE,POINTS,QUALITY_POINTS) values (10,20,null,0,0);
REM INSERTING into UNIVERSITY.STUDENTS
SET DEFINE OFF;
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (1,'Ahmed','Ali','0123456789','ahmed@gmail.com',to_date('15-JAN-90','DD-MON-RR'),'123 Main St','Cairo',0,1,1);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (2,'Fatima','Mohamed','01123456789','fatima@gmail.com',to_date('20-MAY-92','DD-MON-RR'),'456 Elm St','Alexandria',0,2,2);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (3,'Hassan','Mahmoud','01098765432','hassan@gmail.com',to_date('10-AUG-95','DD-MON-RR'),'789 Oak St','Luxor',0,3,3);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (4,'Nour','Ibrahim','01112223333','nour@gmail.com',to_date('25-MAR-93','DD-MON-RR'),'101 Pine St','Aswan',0,4,4);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (5,'Mariam','Youssef','0123456123','mariam@gmail.com',to_date('03-DEC-94','DD-MON-RR'),'234 Maple St','Giza',0,5,3);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (6,'Omar','Ahmed','01011223344','omar@gmail.com',to_date('18-JUL-91','DD-MON-RR'),'567 Birch St','Port Said',0,6,4);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (7,'Amr','Sami','01122334455','amr@gmail.com',to_date('08-SEP-93','DD-MON-RR'),'789 Cedar St','Sharm El Sheikh',0,7,5);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (8,'Nadia','Riad','01098765432','nadia@gmail.com',to_date('12-APR-92','DD-MON-RR'),'890 Pine St','Hurghada',0,8,6);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (9,'Laila','Hassan','01112223344','laila@gmail.com',to_date('28-NOV-91','DD-MON-RR'),'456 Oak St','Mansoura',0,9,3);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (10,'Ahmed','Mohamed','01011223344','ahmedm@gmail.com',to_date('15-JUN-90','DD-MON-RR'),'789 Cedar St','Tanta',0,10,4);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (11,'Youssef','Said','01011112222','youssef@gmail.com',to_date('20-FEB-94','DD-MON-RR'),'101 Elm St','Damietta',0,11,5);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (12,'Sara','Khalil','01122334455','sara@gmail.com',to_date('15-SEP-92','DD-MON-RR'),'202 Pine St','Kafr El Sheikh',0,12,6);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (13,'Rania','Mansour','0123456789','rania@gmail.com',to_date('25-AUG-93','DD-MON-RR'),'345 Oak St','Luxor',0,1,1);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (14,'Khaled','Hassan','01123456789','khaled@gmail.com',to_date('10-APR-91','DD-MON-RR'),'678 Elm St','Cairo',0,2,2);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (15,'Maya','Ahmed','01098765432','maya@gmail.com',to_date('15-JAN-95','DD-MON-RR'),'123 Cedar St','Giza',0,3,3);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (16,'Hassan','Khalil','01112223333','hassan_k@gmail.com',to_date('25-JUN-93','DD-MON-RR'),'456 Pine St','Alexandria',0,4,4);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (17,'Lina','Sami','0123456123','lina@gmail.com',to_date('03-DEC-94','DD-MON-RR'),'789 Birch St','Luxor',0,5,3);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (18,'Youssef','Ibrahim','01011223344','youssef_i@gmail.com',to_date('18-JUL-91','DD-MON-RR'),'101 Oak St','Cairo',0,6,4);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (19,'Mona','Said','01122334455','mona@gmail.com',to_date('08-SEP-93','DD-MON-RR'),'456 Cedar St','Alexandria',0,7,5);
Insert into UNIVERSITY.STUDENTS (STUDENT_ID,FNAME,LNAME,PHONE,EMAIL,DOB,STREET,CITY,GPA,DEPARTMENT_ID,SEMESTER) values (20,'Omar','Riad','01098765432','omar_r@gmail.com',to_date('12-APR-92','DD-MON-RR'),'789 Pine St','Giza',0,8,6);
--------------------------------------------------------
--  DDL for Trigger CALCULATE_POINTS_QUALITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."CALCULATE_POINTS_QUALITY" 
BEFORE INSERT OR UPDATE ON Enroll
FOR EACH ROW
DECLARE
  grade_points NUMBER;
  max_gpa NUMBER := 4.00; -- Set the maximum GPA value
  v_course_credits NUMBER;
BEGIN
  -- Fetch the course_credits for the given course_id
  SELECT course_credits INTO v_course_credits
  FROM Courses
  WHERE course_id = :NEW.course_id;

  -- Define the grade points based on the grade
  CASE UPPER(:NEW.grade)
    WHEN 'A+' THEN grade_points := 4.00; -- Treat A+ as 4.00
    WHEN 'A'  THEN grade_points := 4.00;
    WHEN 'A-' THEN grade_points := 3.70;
    WHEN 'B+' THEN grade_points := 3.30;
    WHEN 'B'  THEN grade_points := 3.00;
    WHEN 'B-' THEN grade_points := 2.70;
    WHEN 'C+' THEN grade_points := 2.30;
    WHEN 'C'  THEN grade_points := 2.00;
    WHEN 'C-' THEN grade_points := 1.70;
    WHEN 'D+' THEN grade_points := 1.30;
    WHEN 'D'  THEN grade_points := 1.00;
    WHEN 'D-' THEN grade_points := 0.70;
    WHEN 'F'  THEN grade_points := 0.00;
    ELSE grade_points := 0; -- Default value for unrecognized grades
  END CASE;

  -- Calculate GPA and cap it at the maximum value
  :NEW.points := LEAST(grade_points, max_gpa);
  :NEW.quality_points := LEAST(grade_points, max_gpa) * v_course_credits;
END;
/
ALTER TRIGGER "UNIVERSITY"."CALCULATE_POINTS_QUALITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COURSES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."COURSES_TRG" 
BEFORE INSERT
ON UNIVERSITY.COURSES
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column COURSE_ID
  :new.COURSE_ID := COURSES_SEQ.nextval;
END COURSES_TRG;
/
ALTER TRIGGER "UNIVERSITY"."COURSES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEPARTMENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."DEPARTMENTS_TRG" 
BEFORE INSERT
ON UNIVERSITY.DEPARTMENTS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column DEPARTMENT_ID
  :new.DEPARTMENT_ID := DEPARTMENTS_SEQ.nextval;
END DEPARTMENTS_TRG;
/
ALTER TRIGGER "UNIVERSITY"."DEPARTMENTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ON_COURSE_DELETE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."ON_COURSE_DELETE" 
BEFORE DELETE ON courses
FOR EACH ROW
BEGIN
  DELETE FROM enroll WHERE course_id = :OLD.course_id;
END;
/
ALTER TRIGGER "UNIVERSITY"."ON_COURSE_DELETE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ON_DEPARTMENT_DELETE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."ON_DEPARTMENT_DELETE" 
BEFORE DELETE ON departments
FOR EACH ROW
BEGIN
  DELETE FROM courses WHERE department_id = :OLD.department_id;
  DELETE FROM students WHERE department_id = :OLD.department_id;
END;
/
ALTER TRIGGER "UNIVERSITY"."ON_DEPARTMENT_DELETE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ON_STUDENT_DELETE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."ON_STUDENT_DELETE" 
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
  DELETE FROM enroll WHERE student_id = :OLD.student_id;
END;
/
ALTER TRIGGER "UNIVERSITY"."ON_STUDENT_DELETE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STUDENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."STUDENTS_TRG" 
BEFORE INSERT
ON UNIVERSITY.STUDENTS
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
-- For Toad:  Highlight column STUDENT_ID
  :new.STUDENT_ID := STUDENTS_SEQ.nextval;
END STUDENTS_TRG;
/
ALTER TRIGGER "UNIVERSITY"."STUDENTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_GPA_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "UNIVERSITY"."UPDATE_GPA_TRIGGER" 
FOR INSERT OR UPDATE ON UNIVERSITY.ENROLL
COMPOUND TRIGGER
    TYPE enroll_rec_type IS RECORD (
        student_id   UNIVERSITY.ENROLL.student_id%TYPE,
        quality_points NUMBER,
        course_credits NUMBER
    );

    TYPE enroll_tab_type IS TABLE OF enroll_rec_type;
    enroll_tab enroll_tab_type := enroll_tab_type();

    BEFORE STATEMENT IS
    BEGIN
        -- Empty the collection before each statement
        enroll_tab := enroll_tab_type();
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        -- Populate the collection with relevant data for each row
        enroll_tab.EXTEND;
        enroll_tab(enroll_tab.LAST).student_id := :NEW.student_id;
        enroll_tab(enroll_tab.LAST).quality_points := :NEW.quality_points;
        enroll_tab(enroll_tab.LAST).course_credits := :NEW.course_id; -- Corrected binding
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        -- Process the data in the collection after the statement
        FOR i IN 1..enroll_tab.COUNT
        LOOP
            DECLARE
                v_total_quality_points NUMBER;
                v_total_credits NUMBER;
                v_gpa NUMBER;
            BEGIN
                -- Calculate total quality points and total credits for the student
                SELECT COALESCE(SUM(e.quality_points), 0),
                       COALESCE(SUM(c.course_credits), 0)
                INTO v_total_quality_points, v_total_credits
                FROM enroll e
                JOIN courses c ON e.course_id = c.course_id
                WHERE e.student_id = enroll_tab(i).student_id;

                -- Avoid division by zero
                IF v_total_credits > 0 THEN
                    -- Calculate GPA using the formula
                    v_gpa := v_total_quality_points / v_total_credits;
                ELSE
                    -- If total credits are zero, set GPA to zero
                    v_gpa := 0;
                END IF;

                -- Update GPA on the students table
                UPDATE students
                SET gpa = v_gpa
                WHERE student_id = enroll_tab(i).student_id;
            END;
        END LOOP;
    END AFTER STATEMENT;
END UPDATE_GPA_TRIGGER;
/
ALTER TRIGGER "UNIVERSITY"."UPDATE_GPA_TRIGGER" ENABLE;
--------------------------------------------------------
--  Constraints for Table ENROLL
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."ENROLL" ADD PRIMARY KEY ("STUDENT_ID", "COURSE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."DEPARTMENTS" ADD PRIMARY KEY ("DEPARTMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UNIVERSITY"."DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."COURSES" ADD PRIMARY KEY ("COURSE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UNIVERSITY"."COURSES" MODIFY ("SEMESTER" NOT NULL ENABLE);
  ALTER TABLE "UNIVERSITY"."COURSES" MODIFY ("COURSE_CREDITS" NOT NULL ENABLE);
  ALTER TABLE "UNIVERSITY"."COURSES" MODIFY ("COURSE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."STUDENTS" ADD PRIMARY KEY ("STUDENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UNIVERSITY"."STUDENTS" MODIFY ("SEMESTER" NOT NULL ENABLE);
  ALTER TABLE "UNIVERSITY"."STUDENTS" MODIFY ("LNAME" NOT NULL ENABLE);
  ALTER TABLE "UNIVERSITY"."STUDENTS" MODIFY ("FNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."COURSES" ADD FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "UNIVERSITY"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ENROLL
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."ENROLL" ADD FOREIGN KEY ("STUDENT_ID")
	  REFERENCES "UNIVERSITY"."STUDENTS" ("STUDENT_ID") ENABLE;
  ALTER TABLE "UNIVERSITY"."ENROLL" ADD FOREIGN KEY ("COURSE_ID")
	  REFERENCES "UNIVERSITY"."COURSES" ("COURSE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "UNIVERSITY"."STUDENTS" ADD FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "UNIVERSITY"."DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
