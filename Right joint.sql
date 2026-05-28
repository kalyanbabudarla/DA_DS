#right joint
create table employees1 (
emp_id int,
emp_name varchar(30),
dept_id int
);

create table departments1 (
dept_id int,
dept_name varchar(30)
);

INSERT INTO employees1 VALUES
(1,'Arun',101),
(2,'Ravi',102),
(3,'Kumar',103),
(4,'Kalyan',104);

INSERT INTO departments1 VALUES
(101,'HR'),
(102,'IT'),
(103,'Finance');

select * from employees1;
drop table employees1;

select * from departments1;
drop table departments1;

SELECT employees1.emp_name, departments1.dept_name FROM employees1 right JOIN departments1
ON employees1.dept_id = departments1.dept_id;