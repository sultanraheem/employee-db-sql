DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(4000) NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date VARCHAR(4000) NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date VARCHAR(4000) NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


-- C:\Users\higas\Downloads\UTOR-VIRT-DATA-PT-02-2024-U-LOLC\Module 4 - Data-Analysis-Pandas\Module 9 Challenge Files\Starter_Code\data\departments.csv

-- COPY departments FROM 'C:\Users\higas\Downloads\UTOR-VIRT-DATA-PT-02-2024-U-LOLC\Module 4 - Data-Analysis-Pandas\Module 9 Challenge Files\Starter_Code\data\departments.csv'
-- WITH CSV HEADER  

-- SELECT * FROM departments

SELECT to_date(birth_date,'mm/dd/yyyy'),birth_date FROM employees
UPDATE employees 
SET hire_date = to_date(hire_date,'mm/dd/yyyy')


ALTER TABLE employees 
ALTER birth_date TYPE date USING birth_date::date

ALTER TABLE employees 
ALTER hire_date TYPE date USING hire_date::date

SELECT * FROM employees

--

-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp 
LEFT JOIN salaries AS sal ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
    dm.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM 
    dept_manager dm
JOIN 
    departments d ON dm.dept_no = d.dept_no
JOIN 
    employees e ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- need emp_no as employee_number and then first/last name + dept_no AS department number maybe dept_name as department_name
SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_no AS department_number,
    d.dept_name AS department_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;
	
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
    first_name,
    last_name,
    sex
FROM 
    employees
WHERE 
    first_name = 'Hercules' 
    -- AND last_name WHERE 'B%';
	AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name = 'Sales';
	
	-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT 
    e.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    d.dept_name AS department_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
    last_name,
    COUNT(*) AS frequency
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency DESC;
