
-- Assignment 1 - SQL

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS StudentDB;

-- Step 2: Select Database
USE StudentDB;

-- Step 3: Create Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    department VARCHAR(30),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(30),
    marks DECIMAL(5,2),
    course_fee DECIMAL(10,2),
    admission_date DATE
);

-- Step 4: Insert Student Records
INSERT INTO Student
(student_id, student_name, department, gender, age, city, marks, course_fee, admission_date)
VALUES
(101, 'Arun', 'CSE', 'Male', 21, 'Bangalore', 85, 75000, '2024-06-10'),
(102, 'Priya', 'ECE', 'Female', 22, 'Chennai', 78, 65000, '2023-07-15'),
(103, 'Kiran', 'CSE', 'Male', 20, 'Hyderabad', 92, 75000, '2024-06-12'),
(104, 'Divya', 'IT', 'Female', 21, 'Bangalore', 67, 70000, '2023-08-20'),
(105, 'Rahul', 'Mechanical', 'Male', 23, 'Mumbai', 56, 60000, '2022-07-05'),
(106, 'Sneha', 'CSE', 'Female', 22, 'Chennai', 88, 75000, '2023-06-18'),
(107, 'Vijay', 'ECE', 'Male', 24, 'Bangalore', 72, 65000, '2022-08-11'),
(108, 'Anita', 'IT', 'Female', 20, 'Hyderabad', 95, 70000, '2024-07-01'),
(109, 'Ramesh', 'Mechanical', 'Male', 21, 'Chennai', 48, 60000, '2023-07-22'),
(110, 'Meena', 'CSE', 'Female', 23, 'Mumbai', 81, 75000, '2022-06-25'),
(111, 'Suresh', 'IT', 'Male', 22, 'Hyderabad', 74, 70000, '2023-08-14'),
(112, 'Kavya', 'ECE', 'Female', 21, 'Chennai', 90, 65000, '2024-06-19'),
(113, 'Manoj', 'Mechanical', 'Male', 20, 'Bangalore', 63, 60000, '2024-07-10'),
(114, 'Pooja', 'CSE', 'Female', 24, 'Mumbai', 58, 75000, '2022-08-30'),
(115, 'Ajay', 'IT', 'Male', 23, 'Bangalore', 86, 70000, '2022-07-16'),
(116, 'Lakshmi', 'ECE', 'Female', 20, 'Hyderabad', 69, 65000, '2024-06-22'),
(117, 'Deepak', 'Mechanical', 'Male', 22, 'Chennai', 77, 60000, '2023-06-28'),
(118, 'Swathi', 'CSE', 'Female', 21, 'Bangalore', 93, 75000, '2023-07-12'),
(119, 'Naveen', 'IT', 'Male', 24, 'Mumbai', 52, 70000, '2022-06-16'),
(120, 'Geetha', 'ECE', 'Female', 23, 'Hyderabad', 83, 65000, '2023-08-25');

-- Step 5: Verify Inserted Records
SELECT * FROM Student;

-- A. Basic SELECT and WHERE

-- 1. Display all student records
SELECT * FROM Student;

-- 2. Display student name, department and marks
SELECT student_name, department, marks FROM Student;

-- 3. Display CSE department students
SELECT * FROM Student
WHERE department = 'CSE';

-- 4. Display students from Bangalore
SELECT * FROM Student
WHERE city = 'Bangalore';

-- 5. Display students who scored exactly 85 marks
SELECT * FROM Student
WHERE marks = 85;

-- B. Relational Operators

-- 6. Display students who scored more than 80 marks
SELECT * FROM Student
WHERE marks > 80;

-- 7. Display students who scored less than 60 marks
SELECT * FROM Student
WHERE marks < 60;

-- 8. Display students whose age is greater than or equal to 22
SELECT * FROM Student
WHERE age >= 22;

-- 9. Display students whose marks are less than or equal to 70
SELECT * FROM Student
WHERE marks <= 70;

-- 10. Display students who do not belong to IT
SELECT * FROM Student
WHERE department <> 'IT';

-- C. Logical Operators

-- 11. Display CSE students who scored more than 80 marks
SELECT * FROM Student
WHERE department = 'CSE' AND marks > 80;

-- 12. Display students who belong to CSE or ECE
SELECT * FROM Student
WHERE department = 'CSE' OR department = 'ECE';

-- 13. Display Chennai students who scored more than 75 marks
SELECT * FROM Student
WHERE city = 'Chennai' AND marks > 75;

-- 14. Display students who are not from Mumbai
SELECT * FROM Student
WHERE NOT city = 'Mumbai';

-- 15. Display CSE students scoring above 80 or IT students
SELECT * FROM Student
WHERE (department = 'CSE' AND marks > 80)
OR department = 'IT';

-- D. LIKE Operator

-- 16. Display students whose names start with A
SELECT * FROM Student
WHERE student_name LIKE 'A%';

-- 17. Display students whose names end with a
SELECT * FROM Student
WHERE student_name LIKE '%a';

-- 18. Display students whose names contain ee
SELECT * FROM Student
WHERE student_name LIKE '%ee%';

-- 19. Display students whose second character is a
SELECT * FROM Student
WHERE student_name LIKE '_a%';

-- 20. Display five character names starting with S
SELECT * FROM Student
WHERE student_name LIKE 'S____';

-- E. IN Operator

-- 21. Display CSE, IT or ECE students
SELECT * FROM Student
WHERE department IN ('CSE', 'IT', 'ECE');

-- 22. Display students from Bangalore, Chennai or Hyderabad
SELECT * FROM Student
WHERE city IN ('Bangalore', 'Chennai', 'Hyderabad');

-- 23. Display students who scored 85, 90 or 95 marks
SELECT * FROM Student
WHERE marks IN (85, 90, 95);

-- 24. Display students who do not belong to Mechanical or IT
SELECT * FROM Student
WHERE department NOT IN ('Mechanical', 'IT');

-- F. BETWEEN Operator

-- 25. Display students whose marks are between 70 and 90
SELECT * FROM Student
WHERE marks BETWEEN 70 AND 90;

-- 26. Display students whose age is between 20 and 22
SELECT * FROM Student
WHERE age BETWEEN 20 AND 22;

-- 27. Display students whose course fee is between 65000 and 75000
SELECT * FROM Student
WHERE course_fee BETWEEN 65000 AND 75000;

-- 28. Display students admitted between June and December 2023
SELECT * FROM Student
WHERE admission_date BETWEEN '2023-06-01' AND '2023-12-31';

-- 29. Display students whose marks are not between 50 and 80
SELECT * FROM Student
WHERE marks NOT BETWEEN 50 AND 80;

-- G. ORDER BY

-- 30. Display students in ascending order of names
SELECT * FROM Student
ORDER BY student_name ASC;

-- 31. Display students in descending order of marks
SELECT * FROM Student
ORDER BY marks DESC;

-- 32. Display students in ascending order of age
SELECT * FROM Student
ORDER BY age ASC;

-- 33. Sort students by department and marks
SELECT * FROM Student
ORDER BY department ASC, marks DESC;

-- 34. Display CSE students sorted by highest marks
SELECT * FROM Student
WHERE department = 'CSE'
ORDER BY marks DESC;

-- 35. Display Bangalore students sorted by descending age
SELECT * FROM Student
WHERE city = 'Bangalore'
ORDER BY age DESC;

-- H. Combined Queries

-- 36. Display CSE students scoring between 70 and 95 marks
SELECT * FROM Student
WHERE department = 'CSE'
AND marks BETWEEN 70 AND 95
ORDER BY marks DESC;

-- 37. Display Chennai or Hyderabad students scoring above 75
SELECT * FROM Student
WHERE city IN ('Chennai', 'Hyderabad')
AND marks > 75;

-- 38. Display students whose names start with A or S and marks above 70
SELECT * FROM Student
WHERE (student_name LIKE 'A%' OR student_name LIKE 'S%')
AND marks > 70;

-- 39. Display CSE or ECE students aged between 20 and 23
SELECT * FROM Student
WHERE department IN ('CSE', 'ECE')
AND age BETWEEN 20 AND 23
ORDER BY marks DESC;

-- 40. Display selected students sorted by student name
SELECT * FROM Student
WHERE city <> 'Mumbai'
AND marks BETWEEN 60 AND 90
AND department IN ('IT', 'CSE')
ORDER BY student_name ASC;
