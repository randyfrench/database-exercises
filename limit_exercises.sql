
-- LIMIT Exercises

USE employees;

--   1. Create a new SQL script named limit_exercises.sql.

 /* Q2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:*/

DESCRIBE titles;

SELECT DISTINCT title FROM titles;
--    List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

 /* Q3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.*/
SELECT first_name,last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;
-- Tremain Eugenio, 1990-05-01; Ipke Fontan, 1990-08-06; Anwar Collavizza, 1990-09-11; bodo Merserau,1991-09-28; Karslen Pearson, 1991-10-18

/* Q4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.*/
SELECT first_name,last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
		AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;

    /*LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?*/
/*
If I want page 10, the formula could be something like this...
(Page - 1) * Limit = Offset
  (10-1)   *   5   = 45
*/ 
