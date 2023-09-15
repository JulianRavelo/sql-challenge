-- Create table Employees
DROP TABLE IF EXISTS EMPLOYEES CASCADE;
CREATE TABLE EMPLOYEES (
    EMP_NO INT PRIMARY KEY NOT NULL,
    EMP_TITLE_ID VARCHAR(5) NOT NULL,
    BIRTH_DATE VARCHAR(50),
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SEX VARCHAR(1),
    HIRE_DATE VARCHAR(50)
);

--ALTER TABLE EMPLOYEES
--ALTER COLUMN BIRTH_DATE TYPE DATE USING BIRTH_DATE::DATE set datestyle to DMY,
--ALTER COLUMN HIRE_DATE TYPE DATE USING BIRTH_DATE::DATE set datestyle to DMY
--;

-- Create table Salaries
DROP TABLE IF EXISTS SALARIES CASCADE;
CREATE TABLE SALARIES (
    EMP_NO INT PRIMARY KEY NOT NULL,
    SALARY INT NOT NULL,
	FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)
);

-- Create table Titles
DROP TABLE IF EXISTS TITLES CASCADE;
CREATE TABLE TITLES (
    TITLE_ID VARCHAR(5) PRIMARY KEY NOT NULL,
    TITLE VARCHAR(100) NOT NULL,
	FOREIGN KEY (TITLE_ID) REFERENCES EMPLOYEES(EMP_TITLE_ID)
);

-- Create table Department Employee
DROP TABLE IF EXISTS DEPT_EMP CASCADE;
CREATE TABLE DEPT_EMP (
    EMP_NO INT NOT NULL,
    DEPT_NO VARCHAR(5) NOT NULL,
	FOREIGN KEY (EMP_NO) REFERENCES EMPLOYEES(EMP_NO)
);

-- Create table Department Manager
DROP TABLE IF EXISTS DEPT_MANAGER CASCADE;
CREATE TABLE DEPT_MANAGER (
    DEPT_NO VARCHAR(5) NOT NULL,
    EMP_NO INT PRIMARY KEY NOT NULL,
	FOREIGN KEY (EMP_NO) REFERENCES DEPT_EMP(EMP_NO)
);

-- Create table Departments
DROP TABLE IF EXISTS DEPARTMENTS CASCADE;
CREATE TABLE DEPARTMENTS (
    DEPT_NO VARCHAR(5) PRIMARY KEY NOT NULL,
    DEPT_NAME VARCHAR(100) NOT NULL,
	FOREIGN KEY (DEPT_NO) REFERENCES DEPT_MANAGER(DEPT_NO)
);

-- Alter tables to add more foreign keys
ALTER TABLE DEPT_EMP ADD FOREIGN KEY(DEPT_NO)
REFERENCES DEPARTMENTS (DEPT_NO);

ALTER TABLE DEPT_MANAGER ADD FOREIGN KEY(DEPT_NO)
REFERENCES DEPARTMENTS (DEPT_NO);
