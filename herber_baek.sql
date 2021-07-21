SELECT * FROM employees WHERE hire_date = '1985-01-01';

SELECT DISTINCT first_name
FROM employees
WHERE first_name LIKE '%sus%';

SELECT emp_no, first_name, last_name
FROM	employees
WHERE emp_no BETWEEN 10026 AND 10082;

SELECT emp_no, first_name, last_name
FROM	employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name = 'Baek';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 10026;

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no <= 10026; 

SELECT emp_no, title
FROM titles
WHERE to_date IS NOT NULL;

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name IN ('Herber', 'Baek')
	AND 	emp_no < 20000;
	
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
	AND last_name IN ('Herber', 'Baek')
	OR first_name = 'Shridhar';

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no < 20000
	AND 
		last_name IN ('Herber', 'Baek')
	OR first_name = 'Shridhar'
);
