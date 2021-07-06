USE germain_1477;

CREATE TEMPORARY TABLE my_numbers(
		n INT UNSIGNED NOT NULL
);

INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5);

SELECT * FROM my_numbers;

UPDATE my_numbers SET n = n + 1;

DELETE FROM my_numbers WHERE n % 2 = 0;

USE germain_1477;

-- CREATE TEMPORARY TABLE georgis AS
SELECT *
FROM employees.employees
JOIN employess.salaries using(emp_no)
WHERE first_name = "Georgi";



    /* 1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.*/

USE employees;

CREATE TEMPORARY TABLE germain_1477.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date > NOW();

USE germain_1477;

SELECT * from germain_1477.employees_with_departments;

/* 1a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns*/

ALTER TABLE germain_1477.employees_with_departments DROP COLUMN full_name;
ALTER TABLE germain_1477.employees_with_departments ADD full_name VARCHAR(31);


DESCRIBE germain_1477.employees_with_departments;
        -- 1b Update the table so that full name column contains the correct data
 UPDATE germain_1477.employees_with_departments
 SET full_name = CONCAT(first_name, " ", last_name);       
        -- 1c Remove the first_name and last_name columns from the table.
 ALTER TABLE germain_1477.employees_with_departments DROP COLUMN first_name; 
 ALTER TABLE germain_1477.employees_with_departments DROP COLUMN last_name;      
        -- 1d What is another way you could have ended up with this same table?
  -- creating it from a query.      

  -- 2 Create a temporary table based on the payment table from the sakila database.
  USE sakila;
  
CREATE TEMPORARY TABLE germain_1477.payment AS
SELECT *
FROM sakila.payment;

DROP TABLE payment;

  SELECT * FROM germain_1477.payment;

    /* 2a Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.*/

DESCRIBE germain_1477.payment;
SELECT database(germain_1477.payment);
USE germain_1477.payment;

ALTER TABLE germain_1477.payment
MODIFY COLUMN amount INT;

UPDATE payment SET amount = amount * 100;

    /* 3 Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?*/
 
 DROP germain_1477.employees_with_departments;
    
 USE germain_1477;
 
 -- build out the problem one step at a time  
 
CREATE TEMPORARY TABLE germain_1477.employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no dept_name
FROM employees.
JOIN salaries USING(salary)
JOIN departments USING(dept_no)
;


SELECT * FROM employees_with_departments;