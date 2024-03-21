iEXPORT:V11.02.00
DUNIVERSITY
RUSERS
2048
0
64
0
ii�          1                                     Sun Feb 11 4:7:36 2024D:/database/backups/university_20240211_H0736.sql                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               d    `$	
#G###A�# �i�                                     d    `$	
#G###A�# �ii                                      +00:00   BYTE UNUSED 2 INTERPRETED DISABLE:ALL  
METRICSU
METRICSUpre-schema procedural objects and actions
PROCACTION
�� BEGIN  
� sys.dbms_logrep_imp.instantiate_schema(schema_name=>SYS_CONTEXT('USERENV','CURRENT_SCHEMA'), export_db_name=>'XE', inst_scn=>'471387');
 COMMIT; END;
  
METRICEU 12
METRICSUforeign function library names for user    
METRICEU 12
METRICSUPUBLIC type synonyms
METRICEU 12
METRICSUprivate type synonyms
METRICEU 12
METRICSUobject type definitions for user    
METRICEU 12
METRICSUpre-schema procedural objects and actions
METRICEU 12
METRICSUdatabase links
METRICEU 12
METRICSUsequence numbers
CREATE SEQUENCE "DEPARTMENTS_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER NOCYCLE
CREATE SEQUENCE "COURSES_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER NOCYCLE
CREATE SEQUENCE "STUDENTS_SEQ" MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER NOCYCLE
METRICEU 15
METRICSUcluster definitions
METRICEU 15
METRICSUXDB Schemas by user 
METRICEU 15
TABLE "COURSES"
CREATE TABLE "COURSES" ("COURSE_ID" NUMBER, "COURSE_NAME" VARCHAR2(255) NOT NULL ENABLE, "COURSE_DESCRIPTION" VARCHAR2(255), "DEPARTMENT_ID" NUMBER, "COURSE_CREDITS" NUMBER NOT NULL ENABLE, "SEMESTER" NUMBER(1, 0) NOT NULL ENABLE)  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING NOCOMPRESS
INSERT INTO "COURSES" ("COURSE_ID", "COURSE_NAME", "COURSE_DESCRIPTION", "DEPARTMENT_ID", "COURSE_CREDITS", "SEMESTER") VALUES (:1, :2, :3, :4, :5, :6)
    � i  � i            � Introduction to Programming Basic programming concepts � � �   � Circuit Analysis# Fundamentals of electrical circuits � � �   � Fluid Mechanics Study of fluid behavior � � �   � Structural Engineering Analysis of structures � � �   � Organic Chemistry Study of carbon compounds � � �   � Biomechanics. Application of mechanics to biological systems � � �   � Aerodynamics Study of the motion of air � � �   �	 Environmental Impact Assessment# Evaluation of environmental effects �	 � �   �
 Production Planning and Control" Optimizing manufacturing processes �
 � �   � Materials Engineering Study of materials properties � � �   �
 Calculus I" Fundamental principles of calculus � � �   �	 Mechanics Study of motion and forces � � �   � Data Structures% Advanced data organization techniques � � �   � Digital Electronics Study of digital circuits � � �   � Thermodynamics& Principles of heat and energy transfer � � �   � Transportation Engineering- Planning and design of transportation systems � � �   � Inorganic Chemistry Study of inorganic compounds � � �   � Medical Imaging, Introduction to medical imaging technologies � � �   � Flight Dynamics Analysis of aircraft motion � � �   � Sustainable Development' Environmental and social sustainability �	 � �   � Quality Management Principles of quality control �
 � �   � Nanotechnology# Study of materials at the nanoscale � � �   � Linear Algebra& Study of linear equations and matrices � � �   � Optics& Principles of light and its properties � � �  ��
ALTER TABLE "COURSES" ADD  PRIMARY KEY ("COURSE_ID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING ENABLE
ANALSTATS TS "COURSES"
Q BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"COURSES"',NULL,NULL,NULL,2,1,70,6); END;
ANALSTATS TS "COURSES"
�� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C2040F'; SREC.MAXVAL := 'C20410'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 314,315& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1t ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"COURSES"','"COURSE_ID"', NULL ,NULL,NULL,2,.5,0,srec,4,6); END;  
ANALSTATS TS "COURSES"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '496E74726F64756374696F6E20746F2050726F6772616D6D696E67'; SREC.MAXVAL := '4C696E65617220416C6765627261'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 381277961612252000000000000000000000,396752960730698000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1w ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"COURSES"','"COURSE_NAME"', NULL ,NULL,NULL,2,.5,0,srec,22,6); END;  
ANALSTATS TS "COURSES"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '426173696320636F6E6365707473206F662070726F6772616D6D696E67'; SREC.MAXVAL := '46756E64616D656E74616C20636F6E6365707473206F66206C696E6561722061'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 344668130249305000000000000000000000,365842568185225000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1~ ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"COURSES"','"COURSE_DESCRIPTION"', NULL ,NULL,NULL,2,.5,0,srec,35,6); END;  
ANALSTATS TS "COURSES"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C105'; SREC.MAXVAL := 'C106'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 4,5& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1x ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"COURSES"','"DEPARTMENT_ID"', NULL ,NULL,NULL,2,.5,0,srec,3,6); END;  
ANALSTATS TS "COURSES"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C104'; SREC.MAXVAL := 'C105'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 3,4& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1y ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"COURSES"','"COURSE_CREDITS"', NULL ,NULL,NULL,2,.5,0,srec,3,6); END;  
ANALSTATS TS "COURSES"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C102'; SREC.MAXVAL := 'C103'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 1,2& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1s ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"COURSES"','"SEMESTER"', NULL ,NULL,NULL,2,.5,0,srec,3,6); END;  
TABLE "DEPARTMENTS"
CREATE TABLE "DEPARTMENTS" ("DEPARTMENT_ID" NUMBER, "DEPARTMENT_NAME" VARCHAR2(255) NOT NULL ENABLE)  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING NOCOMPRESS
INSERT INTO "DEPARTMENTS" ("DEPARTMENT_ID", "DEPARTMENT_NAME") VALUES (:1, :2)
    � i      � Computer Science   � Electrical Engineering   � Mechanical Engineering   � Civil Engineering   � Chemical Engineering   � Biomedical Engineering   � Aerospace Engineering   �	 Environmental Engineering   �
 Industrial Engineering   �! Materials Science and Engineering   � Mathematics   � Physics   � Biotechnology   � Software Engineering   � Electronics   � Telecommunications   � Automotive Engineering   � Robotics   � Renewable Energy   � Data Science  ��
ALTER TABLE "DEPARTMENTS" ADD  PRIMARY KEY ("DEPARTMENT_ID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING ENABLE
ANALSTATS TS "DEPARTMENTS"
U BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"DEPARTMENTS"',NULL,NULL,NULL,2,1,18,6); END;
ANALSTATS TS "DEPARTMENTS"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C105'; SREC.MAXVAL := 'C106'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 4,5& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1| ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"DEPARTMENTS"','"DEPARTMENT_ID"', NULL ,NULL,NULL,2,.5,0,srec,3,6); END;  
ANALSTATS TS "DEPARTMENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '436F6D707574657220536369656E6365'; SREC.MAXVAL := '4D617468656D6174696373'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 350143907661868000000000000000000000,401783474614647000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1 ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"DEPARTMENTS"','"DEPARTMENT_NAME"', NULL ,NULL,NULL,2,.5,0,srec,15,6); END;  
TABLE "ENROLL"
CREATE TABLE "ENROLL" ("STUDENT_ID" NUMBER, "COURSE_ID" NUMBER, "GRADE" VARCHAR2(10), "POINTS" NUMBER(5, 2), "QUALITY_POINTS" NUMBER(5, 2))  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING NOCOMPRESS
ALTER TABLE "ENROLL" MODIFY DEFAULT
2 ALTER TABLE "ENROLL" MODIFY ("GRADE" DEFAULT NULL)
ALTER TABLE "ENROLL" MODIFY DEFAULT
0 ALTER TABLE "ENROLL" MODIFY ("POINTS" DEFAULT 0)
ALTER TABLE "ENROLL" MODIFY DEFAULT
8 ALTER TABLE "ENROLL" MODIFY ("QUALITY_POINTS" DEFAULT 0)
INSERT INTO "ENROLL" ("STUDENT_ID", "COURSE_ID", "GRADE", "POINTS", "QUALITY_POINTS") VALUES (:1, :2, :3, :4, :5)
      
 i          � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   �	 �	�� � �   �
 �
�� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � �	�� � �   � �
�� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   � ��� � �   �	 ��� � �   �	 ��� � �   �
 ��� � �   �
 ��� � �   � ��� � �   � ��� � �  ��
ALTER TABLE "ENROLL" ADD  PRIMARY KEY ("STUDENT_ID", "COURSE_ID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING ENABLE
ANALSTATS TS "ENROLL"
P BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"ENROLL"',NULL,NULL,NULL,1,1,15,6); END;
ANALSTATS TS "ENROLL"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C108'; SREC.MAXVAL := 'C108'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 7,7& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1s ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ENROLL"','"STUDENT_ID"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ANALSTATS TS "ENROLL"
�� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C20410'; SREC.MAXVAL := 'C20410'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 315,315& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1r ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ENROLL"','"COURSE_ID"', NULL ,NULL,NULL,1,1,0,srec,4,6); END;  
ANALSTATS TS "ENROLL"
��w DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '41'; SREC.MAXVAL := '41'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 337499295804764000000000000000000000,337499295804764000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1n ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ENROLL"','"GRADE"', NULL ,NULL,NULL,1,1,0,srec,2,6); END;  
ANALSTATS TS "ENROLL"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C105'; SREC.MAXVAL := 'C105'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 4,4& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1o ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ENROLL"','"POINTS"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ANALSTATS TS "ENROLL"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C111'; SREC.MAXVAL := 'C111'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 16,16& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1w ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"ENROLL"','"QUALITY_POINTS"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
TABLE "STUDENTS"
CREATE TABLE "STUDENTS" ("STUDENT_ID" NUMBER, "FNAME" VARCHAR2(255) NOT NULL ENABLE, "LNAME" VARCHAR2(255) NOT NULL ENABLE, "PHONE" VARCHAR2(20), "EMAIL" VARCHAR2(255), "DOB" DATE, "STREET" VARCHAR2(255), "CITY" VARCHAR2(255), "GPA" NUMBER(5, 2), "DEPARTMENT_ID" NUMBER, "SEMESTER" NUMBER(1, 0) NOT NULL ENABLE)  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING NOCOMPRESS
ALTER TABLE "STUDENTS" MODIFY DEFAULT
/ ALTER TABLE "STUDENTS" MODIFY ("GPA" DEFAULT 0)
INSERT INTO "STUDENTS" ("STUDENT_ID", "FNAME", "LNAME", "PHONE", "EMAIL", "DOB", "STREET", "CITY", "GPA", "DEPARTMENT_ID", "SEMESTER") VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, :10, :11)
    � i  � i   i  � i    � i  � i            � Ahmed Ali
 0123456789 ahmed@gmail.com w� 123 Main St Cairo � � �   � Fatima Mohamed 01123456789 fatima@gmail.com w�
 456 Elm St
 Alexandria � � �   � Hassan Mahmoud 01098765432 hassan@gmail.com w�

 789 Oak St Luxor � � �   � Nour Ibrahim 01112223333 nour@gmail.com w� 101 Pine St Aswan � � �   � Mariam Youssef
 0123456123 mariam@gmail.com w� 234 Maple St Giza � � �   � Omar Ahmed 01011223344 omar@gmail.com w� 567 Birch St	 Port Said � � �   � Amr Sami 01122334455 amr@gmail.com w�	 789 Cedar St Sharm El Sheikh � � �   �	 Nadia Riad 01098765432 nadia@gmail.com w� 890 Pine St Hurghada � �	 �   �
 Laila Hassan 01112223344 laila@gmail.com w�
 456 Oak St Mansoura � �
 �   � Ahmed Mohamed 01011223344 ahmedm@gmail.com w� 789 Cedar St Tanta � � �   � Youssef Said 01011112222 youssef@gmail.com w�
 101 Elm St Damietta � � �   � Sara Khalil 01122334455 sara@gmail.com w�	 202 Pine St Kafr El Sheikh � � �   � Rania Mansour
 0123456789 rania@gmail.com w�
 345 Oak St Luxor � � �   � Khaled Hassan 01123456789 khaled@gmail.com w�

 678 Elm St Cairo � � �   � Maya Ahmed 01098765432 maya@gmail.com w� 123 Cedar St Giza � � �   � Hassan Khalil 01112223333 hassan_k@gmail.com w� 456 Pine St
 Alexandria � � �   � Lina Sami
 0123456123 lina@gmail.com w� 789 Birch St Luxor � � �   � Youssef Ibrahim 01011223344 youssef_i@gmail.com w�
 101 Oak St Cairo � � �   � Mona Said 01122334455 mona@gmail.com w�	 456 Cedar St
 Alexandria � � �   � Omar Riad 01098765432 omar_r@gmail.com w� 789 Pine St Giza � �	 �  ��
ALTER TABLE "STUDENTS" ADD  PRIMARY KEY ("STUDENT_ID") USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT) TABLESPACE "SYSTEM" LOGGING ENABLE
ANALSTATS TS "STUDENTS"
R BEGIN  DBMS_STATS.SET_TABLE_STATS(NULL,'"STUDENTS"',NULL,NULL,NULL,1,1,84,6); END;
ANALSTATS TS "STUDENTS"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C108'; SREC.MAXVAL := 'C108'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 7,7& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1u ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"STUDENT_ID"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ANALSTATS TS "STUDENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '4A6F686E'; SREC.MAXVAL := '4A6F686E'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 386489588769835000000000000000000000,386489588769835000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1p ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"FNAME"', NULL ,NULL,NULL,1,1,0,srec,5,6); END;  
ANALSTATS TS "STUDENTS"
�� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '446F65'; SREC.MAXVAL := '446F65'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 355335535890788000000000000000000000,355335535890788000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1p ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"LNAME"', NULL ,NULL,NULL,1,1,0,srec,4,6); END;  
ANALSTATS TS "STUDENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '3132332D3435362D37383930'; SREC.MAXVAL := '3132332D3435362D37383930'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 255440721174618000000000000000000000,255440721174618000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1q ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"PHONE"', NULL ,NULL,NULL,1,1,0,srec,13,6); END;  
ANALSTATS TS "STUDENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '6A6F686E2E646F6540656D61696C2E636F6D'; SREC.MAXVAL := '6A6F686E2E646F6540656D61696C2E636F6D'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 552643088299035000000000000000000000,552643088299035000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1q ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"EMAIL"', NULL ,NULL,NULL,1,1,0,srec,19,6); END;  
ANALSTATS TS "STUDENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '77BE0101010101'; SREC.MAXVAL := '77BE0101010101'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 2447893,2447893& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1n ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"DOB"', NULL ,NULL,NULL,1,1,0,srec,8,6); END;  
ANALSTATS TS "STUDENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '313233204D61696E205374'; SREC.MAXVAL := '313233204D61696E205374'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 255440717181745000000000000000000000,255440717181745000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1r ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"STREET"', NULL ,NULL,NULL,1,1,0,srec,12,6); END;  
ANALSTATS TS "STUDENTS"
��� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := '4369747976696C6C65'; SREC.MAXVAL := '4369747976696C6C65'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(I 350022770587906000000000000000000000,350022770587906000000000000000000000& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1p ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"CITY"', NULL ,NULL,NULL,1,1,0,srec,10,6); END;  
ANALSTATS TS "STUDENTS"
�� DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C1043A'; SREC.MAXVAL := 'C1043A'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY(	 3.57,3.57& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1n ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"GPA"', NULL ,NULL,NULL,1,1,0,srec,4,6); END;  
ANALSTATS TS "STUDENTS"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C105'; SREC.MAXVAL := 'C105'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 4,4& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1x ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"DEPARTMENT_ID"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ANALSTATS TS "STUDENTS"
��{ DECLARE  SREC DBMS_STATS.STATREC; BEGIN SREC.MINVAL := 'C106'; SREC.MAXVAL := 'C106'; SREC.EAVS := 0; SREC.CHVALS := NULL; # SREC.NOVALS := DBMS_STATS.NUMARRAY( 5,5& ); SREC.BKVALS := DBMS_STATS.NUMARRAY( 0,1s ); SREC.EPC := 2; DBMS_STATS.SET_COLUMN_STATS(NULL,'"STUDENTS"','"SEMESTER"', NULL ,NULL,NULL,1,1,0,srec,3,6); END;  
ENDTABLE
METRICSUsynonyms
METRICEU 20
METRICSUviews
METRICEU 20
METRICSUstored procedures
METRICEU 20
METRICSUoperators
METRICEU 20
METRICSUAnalyze cluster statements 
METRICEU 20
METRICSUreferential integrity constraints
TABLE "COURSES"
ALTER TABLE "COURSES" ADD FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE
ENDTABLE
TABLE "STUDENTS"
ALTER TABLE "STUDENTS" ADD FOREIGN KEY ("DEPARTMENT_ID") REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE
ENDTABLE
TABLE "ENROLL"
ALTER TABLE "ENROLL" ADD FOREIGN KEY ("COURSE_ID") REFERENCES "COURSES" ("COURSE_ID") ENABLE
ENDTABLE
TABLE "ENROLL"
ALTER TABLE "ENROLL" ADD FOREIGN KEY ("STUDENT_ID") REFERENCES "STUDENTS" ("STUDENT_ID") ENABLE
ENDTABLE
METRICEU 24
METRICSUtriggers
TABLE "ENROLL"
CREATE FORMAT92TRIG 
��! TRIGGER calculate_points_quality
" BEFORE INSERT OR UPDATE ON Enroll
 FOR EACH ROW
 DECLARE
   grade_points NUMBER;
7   max_gpa NUMBER := 4.00; -- Set the maximum GPA value
   v_course_credits NUMBER;
 BEGIN
6   -- Fetch the course_credits for the given course_id
.   SELECT course_credits INTO v_course_credits
   FROM Courses
$   WHERE course_id = :NEW.course_id;
 
0   -- Define the grade points based on the grade
   CASE UPPER(:NEW.grade)
=     WHEN 'A+' THEN grade_points := 4.00; -- Treat A+ as 4.00
)     WHEN 'A'  THEN grade_points := 4.00;
)     WHEN 'A-' THEN grade_points := 3.70;
)     WHEN 'B+' THEN grade_points := 3.30;
)     WHEN 'B'  THEN grade_points := 3.00;
)     WHEN 'B-' THEN grade_points := 2.70;
)     WHEN 'C+' THEN grade_points := 2.30;
)     WHEN 'C'  THEN grade_points := 2.00;
)     WHEN 'C-' THEN grade_points := 1.70;
)     WHEN 'D+' THEN grade_points := 1.30;
)     WHEN 'D'  THEN grade_points := 1.00;
)     WHEN 'D-' THEN grade_points := 0.70;
)     WHEN 'F'  THEN grade_points := 0.00;
E     ELSE grade_points := 0; -- Default value for unrecognized grades
   END CASE;
 
3   -- Calculate GPA and cap it at the maximum value
/   :NEW.points := LEAST(grade_points, max_gpa);
J   :NEW.quality_points := LEAST(grade_points, max_gpa) * v_course_credits;
 END;  
ALTER TRIGGER "CALCULATE_POINTS_QUALITY"  ENABLE
ENDTABLE
TABLE "ENROLL"
CREATE FORMAT92TRIG 
��& TRIGGER UNIVERSITY.UPDATE_GPA_TRIGGER
5 FOR INSERT OR UPDATE OR DELETE ON UNIVERSITY.ENROLL 
 COMPOUND TRIGGER
%     TYPE enroll_rec_type IS RECORD (
8         student_id   UNIVERSITY.ENROLL.student_id%TYPE,
         quality_points NUMBER,
         course_credits NUMBER
     );
 
6     TYPE enroll_tab_type IS TABLE OF enroll_rec_type;
5     enroll_tab enroll_tab_type := enroll_tab_type();
 
     BEFORE STATEMENT IS

     BEGIN
6         -- Empty the collection before each statement
)         enroll_tab := enroll_tab_type();
     END BEFORE STATEMENT;
 
     BEFORE EACH ROW IS

     BEGIN
C         -- Populate the collection with relevant data for each row
         enroll_tab.EXTEND;
C         enroll_tab(enroll_tab.LAST).student_id := :NEW.student_id;
K         enroll_tab(enroll_tab.LAST).quality_points := :NEW.quality_points;
[         enroll_tab(enroll_tab.LAST).course_credits := :NEW.course_id; -- Corrected binding
     END BEFORE EACH ROW;
 
     AFTER STATEMENT IS

     BEGIN
B         -- Process the data in the collection after the statement
%         FOR i IN 1..enroll_tab.COUNT
         LOOP
             DECLARE
/                 v_total_quality_points NUMBER;
(                 v_total_credits NUMBER;
                 v_gpa NUMBER;
             BEGIN
T                 -- Calculate total quality points and total credits for the student
;                 SELECT COALESCE(SUM(e.quality_points), 0),
:                        COALESCE(SUM(c.course_credits), 0)
=                 INTO v_total_quality_points, v_total_credits
                 FROM enroll e
<                 JOIN courses c ON e.course_id = c.course_id
?                 WHERE e.student_id = enroll_tab(i).student_id;
 
*                 -- Avoid division by zero
,                 IF v_total_credits > 0 THEN
7                     -- Calculate GPA using the formula
G                     v_gpa := v_total_quality_points / v_total_credits;
                 ELSE
B                     -- If total credits are zero, set GPA to zero
                      v_gpa := 0;
                 END IF;
 
4                 -- Update GPA on the students table
                  UPDATE students
                  SET gpa = v_gpa
=                 WHERE student_id = enroll_tab(i).student_id;
             END;
         END LOOP;
     END AFTER STATEMENT;
 
     AFTER EACH ROW IS

     BEGIN
Q         -- Populate the collection with relevant data for each row being deleted
         IF DELETING THEN
             enroll_tab.EXTEND;
G             enroll_tab(enroll_tab.LAST).student_id := :OLD.student_id;
O             enroll_tab(enroll_tab.LAST).quality_points := :OLD.quality_points;
J             enroll_tab(enroll_tab.LAST).course_credits := :OLD.course_id;
         END IF;
     END AFTER EACH ROW;
 END UPDATE_GPA_TRIGGER;  
ALTER TRIGGER "UPDATE_GPA_TRIGGER"  ENABLE
ENDTABLE
TABLE "DEPARTMENTS"
CREATE FORMAT92TRIG 
�� TRIGGER on_department_delete
 BEFORE DELETE ON departments
 FOR EACH ROW
 BEGIN
@   DELETE FROM courses WHERE department_id = :OLD.department_id;
A   DELETE FROM students WHERE department_id = :OLD.department_id;
 END;  
ALTER TRIGGER "ON_DEPARTMENT_DELETE"  ENABLE
ENDTABLE
TABLE "STUDENTS"
CREATE FORMAT92TRIG 
��% TRIGGER UNIVERSITY.on_student_delete
2 BEFORE DELETE ON UNIVERSITY.STUDENTS FOR EACH ROW
 BEGIN
9   DELETE FROM enroll WHERE student_id = :OLD.student_id;
 END;  
ALTER TRIGGER "ON_STUDENT_DELETE"  ENABLE
ENDTABLE
TABLE "COURSES"
CREATE FORMAT92TRIG 
��$ TRIGGER UNIVERSITY.on_course_delete
1 BEFORE DELETE ON UNIVERSITY.COURSES FOR EACH ROW
 BEGIN
7   DELETE FROM enroll WHERE course_id = :OLD.course_id;
 END;  
ALTER TRIGGER "ON_COURSE_DELETE"  ENABLE
ENDTABLE
TABLE "COURSES"
CREATE FORMAT92TRIG 
�� TRIGGER UNIVERSITY.COURSES_TRG
 BEFORE INSERT
 ON UNIVERSITY.COURSES
" REFERENCING NEW AS New OLD AS Old
 FOR EACH ROW
 BEGIN
) -- For Toad:  Highlight column COURSE_ID
)   :new.COURSE_ID := COURSES_SEQ.nextval;
 END COURSES_TRG;  
ALTER TRIGGER "COURSES_TRG"  ENABLE
ENDTABLE
TABLE "DEPARTMENTS"
CREATE FORMAT92TRIG 
��# TRIGGER UNIVERSITY.DEPARTMENTS_TRG
 BEFORE INSERT
 ON UNIVERSITY.DEPARTMENTS
" REFERENCING NEW AS New OLD AS Old
 FOR EACH ROW
 BEGIN
- -- For Toad:  Highlight column DEPARTMENT_ID
1   :new.DEPARTMENT_ID := DEPARTMENTS_SEQ.nextval;
 END DEPARTMENTS_TRG;  
ALTER TRIGGER "DEPARTMENTS_TRG"  ENABLE
ENDTABLE
TABLE "STUDENTS"
CREATE FORMAT92TRIG 
��  TRIGGER UNIVERSITY.STUDENTS_TRG
 BEFORE INSERT
 ON UNIVERSITY.STUDENTS
" REFERENCING NEW AS New OLD AS Old
 FOR EACH ROW
 BEGIN
* -- For Toad:  Highlight column STUDENT_ID
+   :new.STUDENT_ID := STUDENTS_SEQ.nextval;
 END STUDENTS_TRG;  
ALTER TRIGGER "STUDENTS_TRG"  ENABLE
ENDTABLE
METRICEU 32
METRICSUindextypes
METRICEU 32
METRICSUbitmap, functional and extensible indexes
METRICEU 32
METRICSUposttables actions
METRICEU 32
METRICSUmaterialized views
METRICEU 32
METRICSUsnapshot logs
METRICEU 32
METRICSUjob queues
METRICEU 32
METRICSUrefresh groups and children
METRICEU 32
METRICSUdimensions
METRICEU 32
METRICSUPost-inst procedural actions 
METRICEU 32
METRICSUpost-schema procedural objects and actions
METRICEU 44
METRICSUstatistics
TABLE "COURSES"
ANALCOMPUTE TS "COURSES" ANALYZE  TABLE "COURSES"  ESTIMATE STATISTICS 
TABLE "DEPARTMENTS"
ANALCOMPUTE TS "DEPARTMENTS" ANALYZE  TABLE "DEPARTMENTS"  ESTIMATE STATISTICS 
TABLE "ENROLL"
ANALCOMPUTE TS "ENROLL" ANALYZE  TABLE "ENROLL"  ESTIMATE STATISTICS 
TABLE "STUDENTS"
ANALCOMPUTE TS "STUDENTS" ANALYZE  TABLE "STUDENTS"  ESTIMATE STATISTICS 
ENDTABLE
METRICEU 48
METRICEUG0
EXIT
EXIT
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                