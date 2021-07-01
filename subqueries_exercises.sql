# Suqueries Exercises
SHOW DATABASES;
USE employees;

# Ryan's example to get all the names of the current managers
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > NOW()
);
#Example Qery
/*From our employees database, we can use this example query below to find all the department managers names and birth dates:*/

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM dept_manager
		)
LIMIT 15;

# Q1 Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date IN (
		SELECT hire_date
		FROM employees
		WHERE emp_no = 101010)
		AND emp_no IN (
		SELECT emp_no
		FROM dept_emp
		WHERE to_date > NOW()
); #55 rows


  
# Q2 Find all the titles ever held by all current employees with the first name Aamod.
SELECT title
FROM titles
WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE first_name = "Aamod")
		AND emp_no IN (
		to_date > NOW());
		   
			

SELECT *
FROM titles;

SELECT *
FROM employees
WHERE first_name = "Aamod"; -- 216 rows

/* Q3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.*/
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM dept_emp
		WHERE to_date < CURDATE() -- 85,108
);

/* Q4 Find all the current department managers that are female. List their names in a comment in your code.*/
SELECT *
FROM employees
WHERE emp_no IN (
		SELECT emp_no 
		FROM dept_manager
		WHERE to_date > NOW() AND gender = "F" -- Isamu Legleitner, Karsten Sigstam, Leon DasSarma, Hilary Kambil
);

/* Q5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.*/
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
		SELECT emp_no
		FROM salaries
		WHERE salary > (select AVG(salary) from salaries) AND to_date > CURDATE()
); -- 154543 rows


/* Q6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?*/
SELECT COUNT(salary)
FROM salaries
WHERE salaries.to_date >= CURDATE())
		AND salary >= 
		(SELECT MAX()(salary)
		FROM salaries
		WHERE salaries.to_date >= NOW()) -
		(SELECT STDDEV(salary)
		FROM salaries
		WHERE salaries.to_date >= NOW());
		
SELECT MAX(salary) - STDDEV(salary)
FROM salaries
WHERE to_date > CURDATE();		
#BONUS

    #Find all the department names that currently have female managers.
 SELECT *
 FROM departments;
 

    #Find the first and last name of the employee with the highest salary.
SELECT MAX(salary)
FROM employees
WHERE emp_no
		SELECT emp_no
		FROM salaries
		WHERE to_date > curdate();
		
GROUP BY ;

SELECT emp_no
		FROM salaries
		WHERE to_date > curdate();
    #Find the department name that the employee with the highest salary works in.


