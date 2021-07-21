-- 1. Create a file named where_exercises.sql. Make sure to use the employees database

USE employees;

/* Q2 -Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. 709*/
SELECT first_name
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya');

/* Q3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? 709 */
SELECT first_name
FROM employees
WHERE first_name = 'Irena' 
		OR first_name = 'Vidya' 
		OR first_name = 'Maya';

/* Q4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. 619 but also shows gender F*/
SELECT first_name, gender
FROM employees
WHERE first_name = 'Irena' 
		OR first_name = 'Vidya' 
		OR first_name = 'Maya'
		AND gender = 'M';
		
/* Q5 Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. 7330*/
SELECT last_name
FROM employees
WHERE last_name LIKE'e%';

/* Q6 Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. 30723 How many employees have a last name that ends with E, but does not start with E? 23393*/
SELECT last_name
FROM employees
WHERE last_name LIKE'e%'
		OR last_name LIKE '%e';
		
SELECT last_name
FROM employees
WHERE last_name LIKE '%e'
		AND last_name NOT LIKE 'e%';

/* Q7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E = 899. How many employees' last names end with E, regardless of whether they start with E? = 24292*/
SELECT last_name
FROM employees
WHERE last_name LIKE'e%e';

SELECT last_name
FROM employees
WHERE last_name LIKE'%e';

/* Q8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.=135214*/
SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

/* Q9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.=789*/
SELECT *
FROM employees
WHERE hire_date LIKE '%12-25';

/* Q10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.=346*/
SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND hire_date LIKE '%12-25';

/* Q11 Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.=1873*/
SELECT last_name
FROM employees
WHERE last_name LIKE'%q%';

/* Q12 Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?=547*/
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
		AND last_name NOT LIKE '%qu%';
 

