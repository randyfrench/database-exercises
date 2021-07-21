
 -- Exercises for ORDER BY
# Q1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
 
USE employees;

/* Q2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 709 rows first row Irena Reuteanauer and last row Vidya Simmen*/
SELECT *
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

/* Q3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 709 rows firs row Irena Action and last row Vdya Zaweizig*/
SELECT *
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;


/* Q4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 709 rows first row Irena Action and last row Maya Zyda*/
SELECT first_name, last_name
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;


/* Q5 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name. 899 rows 10021 Ramzi Erde, 499648 Tadahiro Erde */
SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

/* Q6 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee. 899 Teiji Eldridge 1999-11-27, Sergi Erde 1985-02-02*/
SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC;

/* Q7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first. 362 Tremaine Eugenio, this seems tricky*/
SELECT first_name,last_name, birth_date, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date;
 
-- Functions Exercises



/* Q2 Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.*/

SELECT CONCAT(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';


/* Q3 Convert the names produced in your last query to all uppercase.*/

SELECT UPPER(CONCAT(first_name, " ", last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

/* Q4 Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),*/

SELECT first_name,last_name, birth_date, datediff(curdate(),hire_date) AS number_of_days_employed
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND birth_date LIKE '%12-25'
ORDER BY number_of_days_employed DESC;

/* Q5 Find the smallest and largest current salary from the salaries table.*/
SELECT MIN(salary)
FROM salaries
WHERE to_date > curdate();

SELECT MAX(salary)
FROM salaries
WHERE to_date > curdate();



/* Q6 Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:*/
SELECT SUBSTR('first_name', 1, 1,'last_name, 1,4') AS username, first_name, last_name, birth_date from employees;


/*+------------+------------+-----------+------------+
| username   | first_name | last_name | birth_date |
+------------+------------+-----------+------------+
| gface_0953 | Georgi     | Facello   | 1953-09-02 |
| bsimm_0664 | Bezalel    | Simmel    | 1964-06-02 |
| pbamf_1259 | Parto      | Bamford   | 1959-12-03 |
| ckobl_0554 | Chirstian  | Koblick   | 1954-05-01 |
| kmali_0155 | Kyoichi    | Maliniak  | 1955-01-21 |
| apreu_0453 | Anneke     | Preusig   | 1953-04-20 |
| tziel_0557 | Tzvetan    | Zielinski | 1957-05-23 |
| skall_0258 | Saniya     | Kalloufi  | 1958-02-19 |
| speac_0452 | Sumant     | Peac      | 1952-04-19 |
| dpive_0663 | Duangkaew  | Piveteau  | 1963-06-01 |
+------------+------------+-----------+------------+
10 rows in set (0.05 sec)*/
 


