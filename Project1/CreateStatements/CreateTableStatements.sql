/* this statement creates the employee table to track employee information in the database as well as the department they work in.
this table is considered a supertype to the physician table and nurse table. 
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

/* this statement creates the department table to track the department information in the database.
*/

CREATE TABLE DEPARTMENT(

DEPARTMENT_ID   NUMBER        NOT NULL ,
DEPARTMENT_NAME VARCHAR(50)   NOT NULL,
DEPARTMENT_HEAD VARCHAR(50)   NOT NULL,
OFFICE_NUMBER   NUMBER        NOT NULL,

CONSTRAINT department_pk  
        PRIMARY KEY (DEPARTMENT_ID)
);

/* this statement creates the patient table to track information about the patient in the database. */

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

/* this statement creates the prescription table to track information about the patient and their prescription in the database. 
This table is also connected to the Patient table and the Physician Table */

CREATE TABLE PRESCRIPTION	(
PRESCRIPTION_ID      NUMBER        NOT NULL 	PRIMARY KEY ,
PRESCRIPTION_NAME    VARCHAR(50)   NOT NULL,
EMPLOYEE_ID          NUMBER        NOT NULL,
PATIENT_ID    	NUMBER   	NOT NULL,
PRESCRIBED_DATE	DATE      	NOT NULL,
CONSTRAINT PRESCRIPTION_FK_PATIENT
FOREIGN KEY (PATIENT_ID)
           REFERENCES PATIENT (PATIENT_ID),
CONSTRAINT PRESCRIPTION_FK_Physician
        	FOREIGN KEY (EMPLOYEE_ID)
            REFERENCES PHYSICIAN (EMPLOYEE_ID)
);

/* this statement creates the appointment table to track information about the patient and employee in the database.
This table has connections between the patient table as well as the physician table. */

CREATE TABLE APPOINTMENT (
APPOINTMENT_ID    	NUMBER    		NOT NULL 	PRIMARY KEY ,
APPOINTMENT_DATE	DATE			NOT NULL,
APPOINTMENT_TIME	VARCHAR(20)	       NOT NULL,
APPOINTMENT_TYPE	VARCHAR(50)	       NOT NULL,
EMPLOYEE_ID		NUMBER		       NOT NULL,
PATIENT_ID		NUMBER		       NOT NULL,
CONSTRAINT  APPOINTMENT_FK_PATIENT
        	FOREIGN KEY (PATIENT_ID)
           REFERENCES PATIENT (PATIENT_ID),
CONSTRAINT APPOINTMENT_FK_PHYSICIAN 
        	FOREIGN KEY (EMPLOYEE_ID)
            REFERENCES PHYSICIAN (EMPLOYEE_ID)
);

/* this statement creates the training table to track information about the employee training within the database.
This table is connected to the employee table.*/


CREATE TABLE TRAINING (
TRAINING_ID 	              NUMBER         	NOT NULL       	PRIMARY KEY,	
EMPLOYEE_ID	              NUMBER,
TRAINING_COURSE     	       VARCHAR(100) 	       NOT NULL,
CERTIFICATION_DATE 	       DATE 	              NOT NULL,
CERTIFICATION_EXPIRATION   	DATE 	              NOT NULL,
CONSTRAINT training_fk_employee
FOREIGN KEY (EMPLOYEE_ID)
REFERENCES EMPLOYEE (EMPLOYEE_ID)
);

/* this statement creates the medical insurance table to track information about the patients insurance in the database.
this table is connected to the patient table. */


CREATE TABLE MEDICAL_INSURANCE (
POLICY_NUMBER         	NUMBER         	NOT NULL       	PRIMARY KEY,
PATIENT_ID    	       NUMBER,
INSURANCE_COMPANY           VARCHAR(50)          NOT NULL,
POLICY_EXPIRATION   	       DATE 	              NOT NULL,
POLICY_AMT  	              NUMBER         	NOT NULL,
CONSTRAINT medical_insurance_fk_patient
FOREIGN KEY (PATIENT_ID)
REFERENCES PATIENT (PATIENT_ID)
);

/* this statement creates the physician table to track information about the physician in the database. 
This table is connected to the employee table. (physician is a subtype to the employee table). */

CREATE TABLE PHYSICIAN  (
EMPLOYEE_ID          NUMBER          NOT NULL    PRIMARY KEY,
SPECIALTY            VARCHAR(100)    NOT NULL,
PHYSICIAN_ORDERMT    VARCHAR(100)    NOT NULL,
CONSTRAINT PHYSICIAN_FK_EMPLOYEE
        	FOREIGN KEY (EMPLOYEE_ID)
           REFERENCES EMPLOYEE (EMPLOYEE_ID)
);

/* this statement creates the nurse table to track information about the nurse in the database.
this table is also connected to the employee table. (nurse is a subtype to the employee table). */


CREATE TABLE NURSE	(
EMPLOYEE_ID                NUMBER        NOT NULL    PRIMARY KEY,
NURSE_TRAINING             VARCHAR(100)  NOT NULL,
YEARS_OF_EXPERIENCE        NUMBER        NOT NULL,
CONSTRAINT NURSE_FK_EMPLOYEE
        	FOREIGN KEY (EMPLOYEE_ID)
           REFERENCES EMPLOYEE (EMPLOYEE_ID)
);
