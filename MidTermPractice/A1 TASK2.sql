--A1 TASK2


DROP TABLE GRADES;
DROP TABLE SECTIONSTUDENT;
DROP TABLE CLASSPERIOD;
DROP TABLE SECTION;
DROP TABLE PREREQ;
DROP TABLE COURSE;
DROP TABLE PROGRAMTABLE;
DROP TABLE INSTRUCTOR;
DROP TABLE ROOM;
DROP TABLE CAMPUS;
DROP TABLE ADDRESSLINE;
DROP TABLE STUDENT;
DROP TABLE Address;
dROP TABLE ProvInce;


INSERT INTO PROVINCE (PROV_CODE, PROV_NAME) VALUES ('ON','ONTA');
UPDATE PROVINCE SET PROV_NAME = 'ONTAR' WHERE PROV_CODE = 'ON';
DELETE PROVINCE WHERE PROV_CODE = 'ON';

select * FROM PROVINCE;



CREATE TABLE Province(
  PROV_CODE        VARCHAR2(2) PRIMARY KEY,
  PROV_NAME        VARCHAR2(30) NOT NULL 
);







CREATE TABLE Address(
  ADD_ID    NUMBER(10) PRIMARY KEY,
  STREET  VARCHAR(50) NOT NULL,
  CITY  VARCHAR(25) NOT NULL,
  PROV_CODE VARCHAR(2) not NULL,
  POSTAL VARCHAR(7) not nULL,
  
  
   -- FK so can use the lookup Prov table
  CONSTRAINT PROV_ADDRESS_FK          
  FOREIGN KEY (PROV_CODE) 
  REFERENCES Province(PROV_CODE),
  
   --so its not confuse with other keys must be at least 9 digits long
  CONSTRAINT Check_Address_Id
            CHECK (ADD_ID > 70000000 AND ADD_ID < 80000000)
);


CREATE TABLE STUDENT (
  STU_NUMB NUMBER(9) PRIMARY KEY,
  FNAME VARCHAR2(50) NOT NULL,
  LNAME VARCHAR2(50) NOT NULL,
  DOB DATE NOT NULL,
  GENDER VARCHAR2(1) NOT NULL,
  CELL NUMBER(10),
  HOMEP NUMBER(10) NOT NULL
);



CREATE TABLE ADDRESSLINE(
STU_NUMB NUMBER(9) NOT NULL,
 ADD_ID    NUMBER(10) NOT NULL,
 
 CONSTRAINT STUDENT_ADDRESSLINE_FK          
  FOREIGN KEY (STU_NUMB) 
  REFERENCES STUDENT(STU_NUMB),
  
   CONSTRAINT ADDRESS_ADDRESSLINE_FK          
  FOREIGN KEY (ADD_ID) 
  REFERENCES ADDRESS(ADD_ID)
);





CREATE TABLE CAMPUS(
CAMPUS_ID NUMBER(2) PRIMARY KEY,
CAMPUS_NAME VARCHAR2(30) NOT NULL,
PHONE NUMBER(10) NOT NULL,
ADD_ID NUMBER(10) NOT NULL,

   CONSTRAINT CAMPUS_ADDRESS_FK          
  FOREIGN KEY (ADD_ID) 
  REFERENCES ADDRESS(ADD_ID)
);



CREATE TABLE ROOM(
ROOM VARCHAR2(6) PRIMARY KEY,
CAMPUS_ID NUMBER(2) NOT NULL,
CAPACITY NUMBER(3),
WING VARCHAR2(1),
EXT NUMBER(4),
TYPE VARCHAR2(1),

   CONSTRAINT ROOM_CAMPUS_FK          
  FOREIGN KEY (CAMPUS_ID) 
  REFERENCES CAMPUS(CAMPUS_ID)

);



CREATE TABLE INSTRUCTOR(
STAFF_NUMB NUMBER(6) PRIMARY KEY,
FNAME VARCHAR(30) NOT NULL,
OFFICE VARCHAR2(6) NOT NULL,

   CONSTRAINT INSTRUCTOR_ROOM_FK          
  FOREIGN KEY (OFFICE) 
  REFERENCES ROOM(ROOM)
);




CREATE TABLE PROGRAMTABLE(
PROGCODE VARCHAR2(8) PRIMARY KEY,
NAME VARCHAR(30) NOT NULL
);



CREATE TABLE COURSE(
COURSE_CODE VARCHAR2(8) PRIMARY KEY,
TITLE VARCHAR2(50) NOT NULL,
PROGCODE VARCHAR2(8) NOT NULL,
STAFF_NUMB NUMBER(6) NOT NULL,



   CONSTRAINT COURSE_PROGRAM_FK          
  FOREIGN KEY (PROGCODE) 
  REFERENCES PROGRAMTABLE(PROGCODE),
  
     CONSTRAINT COURSE_INSTRUCTOR_FK          
  FOREIGN KEY (STAFF_NUMB) 
  REFERENCES INSTRUCTOR(STAFF_NUMB)
);



CREATE TABLE PREREQ(
COURSE_CODE VARCHAR2(8) NOT NULL,
PREREQ_CODE  VARCHAR2(8) NOT NULL,



   CONSTRAINT PREREQ_COURSE_FK          
  FOREIGN KEY (COURSE_CODE) 
  REFERENCES COURSE(COURSE_CODE),
  
   CONSTRAINT PREREQ_PREREQCOURSE_FK          
  FOREIGN KEY (PREREQ_CODE) 
  REFERENCES COURSE(COURSE_CODE)
);




CREATE TABLE SECTION (
COURSE_CODE VARCHAR2(8) NOT NULL,
SECT_ID NUMBER(1) NOT NULL,

CONSTRAINT SECTION_PK
  PRIMARY KEY(COURSE_CODE, SECT_ID),
  
  
CONSTRAINT SECTION_COURSE_FK          
  FOREIGN KEY (COURSE_CODE) 
  REFERENCES COURSE(COURSE_CODE)

);



CREATE TABLE CLASSPERIOD(
COURSE_CODE VARCHAR2(8) NOT NULL,
SECT_ID NUMBER(1) NOT NULL,
PERIOD_ID NUMBER(2) NOT NULL,

CONSTRAINT CPERIOD_PK
PRIMARY KEY (COURSE_CODE, SECT_ID, PERIOD_ID),

CONSTRAINT CLASSPERIOD_SECTION_FK          
  FOREIGN KEY (COURSE_CODE, SECT_ID) 
  REFERENCES SECTION(COURSE_CODE, SECT_ID)
  

);




CREATE TABLE SECTIONSTUDENT (
COURSE_CODE VARCHAR2(8) NOT NULL,
SECT_ID NUMBER(1) NOT NULL,
 STU_NUMB NUMBER(9) NOT NULL,
 
 CONSTRAINT SECTSTUD_PK
PRIMARY KEY (COURSE_CODE, SECT_ID, STU_NUMB),

CONSTRAINT SECTIONSTUDENT_SECTION_FK          
  FOREIGN KEY (COURSE_CODE, SECT_ID) 
  REFERENCES SECTION(COURSE_CODE, SECT_ID),
  
  CONSTRAINT SECTIONSTUDENT_STUDENT_FK          
  FOREIGN KEY (STU_NUMB) 
  REFERENCES STUDENT(STU_NUMB)
);




CREATE TABLE GRADES (
GRADE_ID VARCHAR2(9) PRIMARY KEY,

COURSE_CODE VARCHAR2(8) NOT NULL,
SECT_ID NUMBER(1) NOT NULL,
 STU_NUMB NUMBER(9) NOT NULL,
 
 CONSTRAINT GRADES_SECTION_FK          
  FOREIGN KEY (COURSE_CODE, SECT_ID) 
  REFERENCES SECTION(COURSE_CODE, SECT_ID),
  
  CONSTRAINT GRADES_STUDENT_FK          
  FOREIGN KEY (STU_NUMB) 
  REFERENCES STUDENT(STU_NUMB)

);



