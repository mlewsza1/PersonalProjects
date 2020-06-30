/* this statement creates the employee table to track employee information in the database
*/

CREATE TABLE EMPLOYEE (

EMPLOYEE_ID      NUMBER         NOT NULL    PRIMARY KEY,
EMPLOYEE_FNAME   VARCHAR(50)    NOT NULL,
EMPLOYEE_LNAME   VARCHAR(50)    NOT NULL,
POSITION         VARCHAR(50)    NOT NULL,
HIRE_DATE        DATE           NOT NULL,
DEPARTMENT_ID    NUMBER,         

CONSTRAINT employee_fk_department
       FOREIGN KEY (DEPARTMENT_ID)
REFERENCES DEPARTMENT(DEPARTMENT_ID)
);

/* this statement creates the department table to track the department information in the database 
*/

CREATE TABLE DEPARTMENT(

DEPARTMENT_ID   NUMBER        NOT NULL ,
DEPARTMENT_NAME VARCHAR(50)   NOT NULL,
DEPARTMENT_HEAD VARCHAR(50)   NOT NULL,
OFFICE_NUMBER   NUMBER        NOT NULL,

CONSTRAINT department_pk  
        PRIMARY KEY (DEPARTMENT_ID)
);

/* this statement creates the patient table to track information about the patient in the database. It is important to 

CREATE TABLE PATIENT	(
PATIENT_ID	            NUMBER                 NOT NULL PRIMARY KEY,
PATIENT_FNAME           VARCHAR(50)            NOT NULL,
PATIENT_LNAME           VARCHAR(50)            NOT NULL,
HOME_ADDRESS            VARCHAR(100)           NOT NULL,
PHONE_NUMBER            VARCHAR(20)            NOT NULL,
DOB                     DATE                   NOT NULL,
EMERGENCY_CONTACT_NAME  VARCHAR(100)           NOT NULL,
ALLERGIES_DESCRIPTION   VARCHAR (200)          NOT NULL
);
