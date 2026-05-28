#LEFT JOIN

CREATE TABLE students1 (
    id INT,
    name VARCHAR(50),
    course_id INT
);

INSERT INTO students1 VALUES
(1, 'Kalyan', 101),
(2, 'Arun', 102),
(3, 'Babu', 103);

CREATE TABLE courses1 (
    course_id INT,
    course_name VARCHAR(50)
);

INSERT INTO courses1 VALUES
(101, 'Python'),
(102, 'MySQL');

drop table students1;
select * from students1;

select * from courses1;
drop table courses1;

SELECT students1.name, courses1.course_name FROM students1 left JOIN courses1 
ON students1.course_id = courses1.course_id;
