# sql-challenge

# Data Modeling

Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables. To create the sketch, feel free to use a tool like QuickDBDLinks to an external site..

# Data Engineering

Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:

Remember to specify the data types, primary keys, foreign keys, and other constraints.

For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.

Be sure to create the tables in the correct order to handle the foreign keys.

Import each CSV file into its corresponding SQL table.

# Data Analysis

List the employee number, last name, first name, sex, and salary of each employee.

List the first name, last name, and hire date for the employees who were hired in 1986.

List the manager of each department along with their department number, department name, employee number, last name, and first name.

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

List each employee in the Sales department, including their employee number, last name, and first name.

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

# Data Modeling Schema

# Modify this code to update the DB schema diagram.
# To reset the sample schema, replace everything with
# two dots ('..' - without quotes).

departments
-----------
dept_no VARCHAR(5)
dept_name string

dept_emp
--------
emp_no PK int FK >- employees.emp_no
dept_no PK int FK >- departments.dept_no



dept_manager
------------
dept_no PK int
emp_no int FK >- departments.dept_no


employees
---------
emp_no PK int FK >- salaries.emp_no
emp_title_id VARCHAR(5)
birth_date date
first_name string
last_name string
sex VARCHAR(5)
hire_date date

salaries
--------
emp_no PK int
salary int

titles
------
title_id VARCHAR(5) FK >- employees.emp_title_id
title string

# Complete Work Cited

https://www.w3schools.com/postgresql/postgresql_like.php
http://127.0.0.1:50106/help/help/import_export_data.html
https://en.wikipedia.org/wiki/Composite_key
https://www.postgresql.org/docs/16/sql-copy.html
https://chat.openai.com/share/ca1fc5ae-477e-40ed-aa21-1fe09428869f
https://stackoverflow.com/questions/14083311/permission-denied-when-trying-to-import-a-csv-file-from-pgadmin
https://www.techonthenet.com/postgresql/comments.php#:~:text=In%20PostgreSQL%2C%20a%20comment%20that,several%20lines%20within%20your%20SQL.
