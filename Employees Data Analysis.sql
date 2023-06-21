CREATE TABLE employees (
  emp_no INT,
  emp_title_id VARCHAR(10),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR(1),
  hire_date DATE
);

CREATE TABLE employees_departments (
  emp_no INT,
  dept_no VARCHAR(10)
);

CREATE TABLE employees_salary (
  emp_no INT,
  salary INT
);

CREATE TABLE departments_managers (
  dept_no VARCHAR(10),
  emp_no INT
);

CREATE TABLE departments (
  dept_no VARCHAR(10),
  dept_name VARCHAR(50)
);

CREATE TABLE titles (
  title_id VARCHAR(10),
  title VARCHAR(50)
);

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN employees_salary s ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM departments d
JOIN departments_managers m ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no;

SELECT e.emp_no, e.last_name, e.first_name, ed.dept_no, d.dept_name
FROM employees e
JOIN employees_departments ed ON e.emp_no = ed.emp_no
JOIN departments d ON ed.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN employees_departments ed ON e.emp_no = ed.emp_no
JOIN departments d ON ed.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN employees_departments ed ON e.emp_no = ed.emp_no
JOIN departments d ON ed.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
