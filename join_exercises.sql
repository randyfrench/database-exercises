USE employees;

DESCRIBE departments;

DESCRIBE dept_emp;

DESCRIBE dept_manager;

DESCRIBE employees;

DESCRIBE salaries;

DESCRIBE titles;

SELECT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME
FROM information_schema.key_column_usage
WHERE CONSTRAINT_NAME='PRIMARY';

#Create a file named join_exercises.sql to do your work in.
#Join Example Database

USE join_example_db;

    #Use the join_example_db. Select all the records from both the users and roles tables.
 SELECT *
 FROM users;
 
 SELECT *
 FROM roles;
 
 

    /*Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.*/
    
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;    

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
 WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;



    /*Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.*/

#Employees Database

    #Use the employees database.

    /*Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.*/
    
 SELECT CONCAT(e.first_name, ' ', e.last_name) AS Department_Name, Department_Manager
FROM departments AS e
JOIN dept_name AS de
	ON de.emp_no = e.emp_no
JOIN employees AS d
  ON d.dept_no = de.dept_no
 WHERE de.to_date = '9999-01-01';   
 
SELECT dept_name as " Department Name", CONCAT(first_name, " ", last_name) AS "Department Manager"
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no
JOIN employees on employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > curdate();

  /*Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang*/

#Find the name of all departments currently managed by women.
SELECT dept_name as "Department Name", CONCAT(first_name, " ", last_name) AS "Manager Name"
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no
JOIN employees on employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date > curdate() AND gender = 'F'
ORDER BY 'Department Name';

/*Department Name | Manager Name
----------------+-----------------
Development     | Leon DasSarma
Finance         | Isamu Legleitner
Human Resources | Karsetn Sigstam
Research        | Hilary Kambil*/

#Find the current titles of employees currently working in the Customer Service department.

SELECT *
FROM departments
JOIN dept_manager on dept_manager.dept_no = departments.dept_no
JOIN ;






/*Title              | Count
-------------------+------
Assistant Engineer |    68
Engineer           |   627
Manager            |     1
Senior Engineer    |  1790
Senior Staff       | 11268
Staff              |  3574
Technique Leader   |   241*/

#Find the current salary of all current managers.

/*Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393
Sales              | Hauke Zhang       | 101987*/

#Find the number of current employees in each department.

/*+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+*/

#Which department has the highest average salary? Hint: Use current not historic information.

/*+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+*/

#Who is the highest paid employee in the Marketing department?

/*+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+*/

#Which current department manager has the highest salary?

/*+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+*/

#Bonus Find the names of all current employees, their department name, and their current manager's name.

#240,124 Rows

/*Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman*/

 #.....

#Bonus Who is the highest paid employee within each department.

