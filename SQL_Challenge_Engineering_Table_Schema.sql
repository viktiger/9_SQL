DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments(
	dept_no	VARCHAR(100) NOT NULL,
	dept_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (dept_no)
);

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(100) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	sex	VARCHAR(100) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
	--FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

SET datestyle TO "ISO, MDY";
--SELECT CAST('12/20/2016' as Date); -- to test if you want to
COPY employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\Public\employees.csv'
--FROM 'C:\Users\viksh\Desktop\CodingTest\09-SQL\Instructions\data\employees.csv'
DELIMITER ','
CSV HEADER;


DROP TABLE IF EXISTS dept_emp CASCADE;
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(100) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

DROP TABLE IF EXISTS dept_manager CASCADE;
CREATE TABLE dept_manager(
	dept_no VARCHAR(100) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles(
	title_id VARCHAR(100) NOT NULL,
	title VARCHAR(100) NOT NULL,
	PRIMARY KEY (title_id)
);

DROP TABLE IF EXISTS salaries CASCADE;
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no)
);

/*
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM employees;
*/
