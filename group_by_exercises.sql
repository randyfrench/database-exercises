USE employees;

SELECT *
FROM titles;

/* Q2 In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.*/

SELECT DISTINCT title # 7 titles
FROM titles;

/* Q3 Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.*/

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

/* Q4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.*/

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name, first_name;

/* Q5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.*/

SELECT DISTINCT last_name # Chleq, Lindqvist, Qiwen
FROM employees
WHERE last_name LIKE '%q%' 
		AND last_name NOT LIKE '%qu%';


/* Q6 Add a COUNT() to your results (the query above) to find the number of employees with the same last name. 547*/
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' 
		AND last_name NOT LIKE '%qu%';


/* Q7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.*/

SELECT DISTINCT first_name, gender, COUNT(*)
FROM employees
WHERE first_name  IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

/* Q8 Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? YES BONUS: How many duplicate usernames are there? 6*/
SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1,4), '_',
						SUBSTR(birth_date, 6, 2),
						SUBSTR(birth_date, 3, 2))) AS username, first_name, last_name, birth_date
FROM employees;
