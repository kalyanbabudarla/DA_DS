CREATE TABLE Employees2 (
    employee_id INT,
    employee_name VARCHAR(50),
    salary INT,
    department_number INT,
    job_role VARCHAR(50)
);

select * from employees2;
drop table employees2;

INSERT INTO Employees2 (employee_id, employee_name, salary, department_number, job_role) VALUES
(1,  'John',  1000, 10, 'Clerk'),
(2,  'Ava',   1500, 20, 'Salesman'),
(3,  'Ravi',  2000, 30, 'Analyst'),
(4,  'Maya',  2500, 90, 'Programmer'),
(5,  'Arun',  3000, 90, 'Programmer'),
(6,  'Neha',  4000, 90, 'Manager'),
(7,  'Kiran', 5500, 20, 'Salesman'),
(8,  'Sara',  6000, 30, 'Analyst'),
(9,  'Tom',   7000, 10, 'Programmer'),
(10, 'Lina',  8000, 30, 'Manager'),
(11, 'Omar',  9000, 90, 'Clerk'),
(12, 'Priya',10000, 20, 'Programmer');

-- Task 1: Basic count
-- Question: Find the total number of employees in the Employees table.
SELECT COUNT(*) AS total_employees2 FROM Employees2;

-- Task 2: Total sum
-- Question: Calculate the total sum of all salaries payable to employees.
SELECT SUM(salary) AS total_salary FROM Employees2;

-- Task 3: Average salary in department 90
-- Question: Find the average salary of employees working in department number 90.
SELECT AVG(salary) AS avg_salary FROM Employees2 WHERE department_number = 90;

-- Task 4: Highest programmer salary
-- Question: Identify the highest salary among employees working as "Programmers".
SELECT MAX(salary) AS highest_programmer_salary FROM Employees2 WHERE job_role = 'Programmer';

-- Task 5: Lowest salary
-- Question: Retrieve the minimum salary from the entire Employees table.
SELECT MIN(salary) AS lowest_salary FROM Employees2;

-- Task 6: Conditional count
-- Question: Count how many employees have a salary greater than 5,000.
SELECT COUNT(*) AS employees_above_5000 FROM Employees2 WHERE salary > 5000;

-- Task 7: Unique job roles
-- Question: Write a query to count the number of distinct job roles available.
SELECT COUNT(DISTINCT job_role) AS unique_job_roles FROM Employees2;

-- Task 8: Salary range
-- Question: Find the difference between the highest and lowest salaries in the company.
SELECT MAX(salary) - MIN(salary) AS salary_range FROM Employees2;

-- Task 9: Salary by department
-- Question: List each department ID along with the total salary paid in that department.
SELECT department_number, SUM(salary) AS total_salary
FROM Employees2 GROUP BY department_number ORDER BY department_number;

-- Task 10: Departments with more than 2 employees
-- Question: Find all department IDs where the total count of employees is greater than 2.
SELECT department_number, COUNT(*) AS employee_count
FROM Employees2 GROUP BY department_number HAVING COUNT(*) > 2;