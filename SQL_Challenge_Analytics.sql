--Check tables to see if primary keys are unique
/*
SELECT COUNT(*) FROM departments;
SELECT COUNT(DISTINCT(dept_no)) FROM departments;
--9 unique values matches total unique values

SELECT COUNT(*) FROM employees;
SELECT COUNT(DISTINCT(emp_no)) FROM employees;
--300024 unique values matches total unique values

SELECT COUNT(*) FROM dept_emp;
SELECT COUNT(DISTINCT(emp_no, dept_no)) FROM dept_emp;
--331603 unique values matches total unique values

SELECT COUNT(*) FROM dept_manager;
SELECT COUNT(DISTINCT(dept_no, emp_no)) FROM dept_manager;
--24 uunique values matches total unique values

SELECT COUNT(*) FROM titles;
SELECT COUNT(DISTINCT(title_id)) FROM titles;
--7 unique values matches total unique values

SELECT COUNT(*) FROM salaries;
SELECT COUNT(DISTINCT(emp_no)) FROM salaries;
--300024 unique values matches total unique values
*/

-- Question 1) List the following details of each employee: 
--			   employee number, last name, first name, sex, and salary
-- Answer   2) Obtained from employee table and joining the salary table

SELECT 
employees.emp_no AS EmployeeNumber,
employees.last_name AS LastName,
employees.first_name AS FirstName,
employees.sex AS Sex,
salaries.salary AS Salary
FROM employees
FULL OUTER JOIN salaries ON employees.emp_no = salaries.emp_no
;

-- Question 2) List first name, last name, and hire date for employees who were hired in 1986
-- Answer   2) Obtained from employee table constraining the date range

SELECT 
employees.first_name FirstName,
employees.last_name LastName,
employees.hire_date

FROM employees
--WHERE employees.hire_date BETWEEN '1/1/1986' AND '12/31/1986'
WHERE employees.hire_date BETWEEN '1/1/1986' AND '31/12/1986'
;

-- Question 3) List the manager of each department with the following information: 
-- 			   department number, department name, the manager's employee number, last name, first name
-- Answer   3) Obtained from dept_manager table joining with the departments table and employees table

SELECT 
dept_manager.dept_no DepartmentNumber,
departments.dept_name DepartmentName,
dept_manager.emp_no DepartmentManagerEmployeeNumber,
employees.last_name LastName,
employees.first_name FirstName

FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
;

-- Question 4) List the department of each employee with the following information: 
-- 			   employee number, last name, first name, and department name
-- Answer   4) CHECK Obtained from employees table joining with the dept_employee table then the departments table 

SELECT 
employees.emp_no EmployeeNumber,
employees.last_name LastName,
employees.first_name FirstName,
departments.dept_name DepartmentName

FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
;

-- Question 5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- Answer   5) Obtained from employees table constraining the first_name and last_name

SELECT 
employees.first_name FirstName,
employees.last_name LastName,
employees.sex Sex

FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'
;
-- Question 6) List all employees in the Sales department, including their employee number, last name, first name, and department name
-- Answer   6) Obtained from employees table joining with the departments table

SELECT 
departments.dept_name DepartmentName,
employees.emp_no EmployeeNumber,
employees.last_name LastName,
employees.first_name FirstName

FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
;

-- Question 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
-- Answer   7) Obtained from employees table joining with the departments table

SELECT 
departments.dept_name DepartmentName,
employees.emp_no EmployeeNumber,
employees.last_name LastName,
employees.first_name FirstName

FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'
;

-- Question 8) List the frequency count of employee last names (i.e., how many employees share each last name) in descending order
-- Answer   8) Obtained from employees table constraining last names and then order descending

SELECT 
employees.last_name LastName,
COUNT(employees.last_name)

FROM employees
GROUP BY employees.last_name
;

-- Check employee numbers are unique e.g. employees.last_name = 'Breugel' have different first names and employee numbers
SELECT 
employees.last_name LastName,
employees.first_name FirstName,
employees.emp_no EmployeeNumber
--COUNT(employees.last_name)

FROM employees
WHERE employees.last_name = 'Breugel'
--GROUP BY employees.last_name
;