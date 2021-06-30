USE employees;

SELECT * FROM employees;

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
	AND (
		last_name IN ('Herber', 'Baek')
	OR first_name = 'Shridhar'
);


/* Q2 -Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. 709*/
SELECT first_name
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya');

/* Q3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? 709 yes it matches*/
SELECT first_name
FROM employees
WHERE first_name = 'Irena' 
		OR first_name = 'Vidya' 
		OR first_name = 'Maya';

/* Q4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. 441 */
SELECT first_name, gender
FROM employees
WHERE (first_name = 'Irena' 
		OR first_name = 'Vidya' 
		OR first_name = 'Maya')
		AND gender = 'M';
		
SELECT *
FROM employees
WHERE first_name = ('Irena' OR 'Vidya' OR 'Maya') AND gender = 'M';	
	
/* Q5 Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. 7330*/
SELECT last_name
FROM employees
WHERE last_name LIKE'e%';

/*Q6 Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. 30723 How many employees have a last name that ends with E, but does not start with E? 30723 23393*/

SELECT last_name
FROM employees
WHERE last_name LIKE'e%'
		OR last_name LIKE '%e';
		
SELECT last_name
FROM employees
WHERE last_name LIKE '%e'
		AND last_name NOT LIKE 'e%';

/* Q7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E = 899. How many employees' last names end with E, regardless of whether they start with E? =  899 24292*/
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

/* Q9 Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. 842 */
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';

/*Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.=346*/
SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND hire_date LIKE '%12-25';

/*Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.=1873*/
SELECT last_name
FROM employees
WHERE last_name LIKE'%q%';

/*Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?=547*/
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
		AND last_name NOT LIKE '%qu%';


 -- Exercises for ORDER BY
 
 

/* Q2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 709 rows first row Irena Reuteanauer and last row Vidya Simmen*/
SELECT first_name, last_name
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC;

/* Q3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? 709 rows firs row Irena Action and last row Vdya Zaweizig*/
SELECT first_name, last_name
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
ORDER BY birth_date, hire_date DESC;

SELECT first_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '19%%-12-25'
ORDER BY birth_date DESC, hire_date DESC;
 
 
-- LIMIT Exercises



--    Create a new SQL script named limit_exercises.sql.

 /* Q2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:*/

--    SELECT DISTINCT title FROM titles;
SELECT DISTINCT title FROM titles;
--    List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

 /* Q3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.*/
SELECT first_name,last_name, birth_date, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date
LIMIT 5;

/*Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.*/
SELECT first_name,last_name, birth_date, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND birth_date LIKE '%12-25'
ORDER BY birth_date, hire_date
LIMIT 5 OFFSET 45;

    /*LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?*/

