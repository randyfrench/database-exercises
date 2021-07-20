# 3. use the employees database
USE employees;
# 4. List all the tables in the database
SHOW tables;

/* Q5 What different data types are present on this table?
 int, date, varchar(14), varchar(16), enum('M','F'), date */

DESCRIBE employees;

/*6. Which table(s) do you think contain a numeric type column?
 departments, dept_emp, dept_manager, employees, salaries, titles*/

/* 7. Which table(s) do you think contain a string type column?
 employees, titles */

/* 8. Which table(s) do you think contain a date type column?
 dept_emp, dept_manager, employees, salaries, titles*/
 
/* 9. What is the relationship between the employees and the departments tables? */
DESCRIBE employees;
DESCRIBE departments;

/* 10. Show the SQL that created the dept_manager table.*/
SHOW CREATE TABLE dept_manager;
