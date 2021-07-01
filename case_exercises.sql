USE employees;

# CASE Statements Examples
SELECT dept_name,
			CASE dept_name
				WHEN 'research' THEN 'Development'
				WHEN 'marketing' THEN 'Sales'
				ELSE dept_name
				END AS dept_group
FROM employees.departments;			

SELECT dept_name,
			CASE
				WHEN dept_name IN ('research', 'development') THEN 'R&D'
				WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
				WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
				ELSE dept_name
				END AS dept_group
FROM employees.departments;				

SELECT dept_name,
			IF(dept_name = 'Research', true, false) AS is_research
FROM employees.departments;			


-- Q1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that -- is a 1 if the employee is still with the company and 0 if not. 

SELECT 
	de.emp_no,
	dept_no,
	hire_date,
	to_date,
	IF(to_date > CURDATE(), 1, 0) AS current_employee
FROM dept_emp AS de
JOIN (SELECT 
			emp_no,
			MAX(to_date) AS max_date
		FROM dept_emp
		GROUP BY emp_no) as last_dept 
		ON de.emp_no = last_dept.emp_no
			AND de.to_date = last_dept.max_date
JOIN employees AS e ON e.emp_no = de.emp_no;

-- Q2 Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the -- first letter of their last name. 

SELECT
	CONCAT(first_name, ' ', last_name) AS employee_name,
	CASE
		WHEN LEFT(last_name, 1) IN('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN 'A-H'
		WHEN LEFT(last_name, 1) IN('i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q') THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;

-- Q3 How many employees (current or previous) were born in each decade? 

SELECT
	CASE
		WHEN birth_date LIKE '195%' THEN '50s'
		WHEN birth_date LIKE '196%' THEN '60s'
		ELSE 'YOUNG'
	END AS decade,
	COUNT(*)
FROM employees
GROUP BY decade;