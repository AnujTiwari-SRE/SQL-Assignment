
-- Assignment 3 - SQL JOIN Operations

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS CollegeDB3;
USE CollegeDB3;

-- Step 2: Create Faculty Table
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50),
    department VARCHAR(30),
    subject VARCHAR(30),
    salary DECIMAL(10,2)
);

-- Step 3: Insert Faculty Records
INSERT INTO Faculty VALUES
(101, 'Ramesh', 'Computer Science', 'Java', 60000),
(102, 'Priya', 'Computer Science', 'Python', 65000),
(103, 'Suresh', 'Mathematics', 'Mathematics', 55000),
(104, 'Divya', 'Electronics', 'Embedded C', 58000),
(105, 'Karthik', 'Database', 'SQL', 62000),
(106, 'Meena', 'Computer Science', 'C Programming', 50000),
(107, 'Anitha', 'Physics', 'Physics', 52000);

-- Step 4: Create Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course VARCHAR(30),
    city VARCHAR(30),
    marks INT,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);

-- Step 5: Insert Student Records
INSERT INTO Student VALUES
(1, 'Arun', 'PGCP-AC', 'Bengaluru', 85, 101),
(2, 'Priya', 'PGCP-AC', 'Chennai', 90, 101),
(3, 'Kiran', 'PGCP-AI', 'Hyderabad', 88, 102),
(4, 'Divya', 'PGCP-AI', 'Bengaluru', 78, 102),
(5, 'Rahul', 'PGCP-BDA', 'Pune', 82, 105),
(6, 'Sneha', 'PGCP-BDA', 'Mumbai', 91, 105),
(7, 'Manoj', 'PGCP-ESD', 'Chennai', 75, 104),
(8, 'Pooja', 'PGCP-ESD', 'Bengaluru', 86, 104),
(9, 'Ajay', 'PGCP-ITISS', 'Hyderabad', 80, 106),
(10, 'Neha', 'PGCP-ITISS', 'Pune', 89, 106),
(11, 'Vijay', 'PGCP-AC', 'Mumbai', 72, 101),
(12, 'Swathi', 'PGCP-AI', 'Chennai', 95, 102),
(13, 'Deepak', 'PGCP-BDA', 'Bengaluru', 77, 105),
(14, 'Rekha', 'PGCP-ESD', 'Hyderabad', 84, 104);

-- Step 6: Display All Tables
SHOW TABLES;

-- Part A: INNER JOIN

-- Problem 1: Display student details with faculty names
SELECT s.student_id, s.student_name, s.course, f.faculty_name
FROM Student s
INNER JOIN Faculty f
ON s.faculty_id = f.faculty_id;

-- Problem 2: Display student, faculty, subject and department
SELECT s.student_name, f.faculty_name, f.subject, f.department
FROM Student s
INNER JOIN Faculty f
ON s.faculty_id = f.faculty_id;

-- Problem 3: Display students studying under Ramesh
SELECT s.*
FROM Student s
INNER JOIN Faculty f
ON s.faculty_id = f.faculty_id
WHERE f.faculty_name = 'Ramesh';

-- Problem 4: Display students scoring more than 80 with faculty names
SELECT s.student_name, s.marks, f.faculty_name
FROM Student s
INNER JOIN Faculty f
ON s.faculty_id = f.faculty_id
WHERE s.marks > 80;

-- Problem 5: Display PGCP-AI students with faculty and department
SELECT s.student_name, f.faculty_name, f.department
FROM Student s
INNER JOIN Faculty f
ON s.faculty_id = f.faculty_id
WHERE s.course = 'PGCP-AI';

-- Problem 6: Display students and faculty subjects in ascending faculty order
SELECT s.student_name, f.faculty_name, f.subject
FROM Student s
INNER JOIN Faculty f
ON s.faculty_id = f.faculty_id
ORDER BY f.faculty_name ASC;

-- Problem 7: Display total students assigned to each faculty member
SELECT f.faculty_name, COUNT(s.student_id) AS Total_Students
FROM Faculty f
INNER JOIN Student s
ON f.faculty_id = s.faculty_id
GROUP BY f.faculty_id, f.faculty_name;

-- Problem 8: Display faculty members whose students average marks are above 80
SELECT f.faculty_name, AVG(s.marks) AS Average_Marks
FROM Faculty f
INNER JOIN Student s
ON f.faculty_id = s.faculty_id
GROUP BY f.faculty_id, f.faculty_name
HAVING AVG(s.marks) > 80;

-- Part B: LEFT JOIN

-- Problem 9: Display all students with faculty names including unassigned students
SELECT s.student_id, s.student_name, s.course, s.city, s.marks, f.faculty_name
FROM Student s
LEFT JOIN Faculty f
ON s.faculty_id = f.faculty_id;

-- Part C: RIGHT JOIN

-- Problem 10: Display all faculty members with assigned student details
SELECT f.faculty_id, f.faculty_name, s.student_id, s.student_name, s.course, s.marks
FROM Student s
RIGHT JOIN Faculty f
ON s.faculty_id = f.faculty_id;
