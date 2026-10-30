
-- Assignment 2 - SQL

-- Create and select database
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Create student table
CREATE TABLE STUDENT (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(50),
    Department VARCHAR(10),
    Semester INT,
    Marks INT,
    City VARCHAR(30)
);

-- Insert student records
INSERT INTO STUDENT
(Student_ID, Student_Name, Department, Semester, Marks, City)
VALUES
(101, 'Arun', 'CSE', 1, 85, 'Bengaluru'),
(102, 'Priya', 'CSE', 1, 72, 'Chennai'),
(103, 'Kiran', 'ECE', 2, 90, 'Bengaluru'),
(104, 'Divya', 'ECE', 2, 65, 'Mysuru'),
(105, 'Rahul', 'CSE', 2, 88, 'Hyderabad'),
(106, 'Sneha', 'IT', 1, 78, 'Chennai'),
(107, 'Vijay', 'IT', 2, 92, 'Bengaluru'),
(108, 'Meena', 'CSE', 1, 60, 'Mysuru'),
(109, 'Ajay', 'ECE', 1, 75, 'Hyderabad'),
(110, 'Nisha', 'IT', 2, 84, 'Bengaluru');

-- Create faculty table
CREATE TABLE FACULTY (
    Faculty_ID INT PRIMARY KEY,
    Faculty_Name VARCHAR(50),
    Department VARCHAR(10),
    Salary DECIMAL(10,2),
    Experience INT
);

-- Insert faculty records
INSERT INTO FACULTY
(Faculty_ID, Faculty_Name, Department, Salary, Experience)
VALUES
(201, 'Ramesh', 'CSE', 65000, 12),
(202, 'Lakshmi', 'ECE', 58000, 8),
(203, 'Suresh', 'CSE', 72000, 15),
(204, 'Geetha', 'IT', 60000, 10),
(205, 'Mahesh', 'ECE', 52000, 5),
(206, 'Kavitha', 'IT', 68000, 14),
(207, 'Prakash', 'CSE', 55000, 6),
(208, 'Anitha', 'ECE', 75000, 18),
(209, 'Ganesh', 'IT', 50000, 4),
(210, 'Radha', 'CSE', 80000, 20);

-- Display all tables
SHOW TABLES;

-- Count total students
SELECT COUNT(*) AS Total_Students
FROM STUDENT;

-- Count total faculty
SELECT COUNT(*) AS Total_Faculty
FROM FACULTY;

-- Display department wise student count and average marks
SELECT Department,
       COUNT(*) AS Total_Students,
       AVG(Marks) AS Average_Marks
FROM STUDENT
GROUP BY Department;

-- Display highest and lowest marks by department
SELECT Department,
       MAX(Marks) AS Highest_Marks,
       MIN(Marks) AS Lowest_Marks
FROM STUDENT
GROUP BY Department;

-- Display department wise faculty salary statistics
SELECT Department,
       COUNT(*) AS Total_Faculty,
       SUM(Salary) AS Total_Salary,
       AVG(Salary) AS Average_Salary
FROM FACULTY
GROUP BY Department;

-- Display departments with more than two students
SELECT Department,
       COUNT(*) AS Total_Students
FROM STUDENT
GROUP BY Department
HAVING COUNT(*) > 2;

-- Display departments with average marks above 80
SELECT Department,
       AVG(Marks) AS Average_Marks
FROM STUDENT
GROUP BY Department
HAVING AVG(Marks) > 80;

-- Display departments with average faculty salary above 60000
SELECT Department,
       AVG(Salary) AS Average_Salary
FROM FACULTY
GROUP BY Department
HAVING AVG(Salary) > 60000;

-- Display students scoring above overall average marks
SELECT *
FROM STUDENT
WHERE Marks > (
    SELECT AVG(Marks)
    FROM STUDENT
);

-- Display faculty earning more than average ECE faculty salary
SELECT *
FROM FACULTY
WHERE Salary > (
    SELECT AVG(Salary)
    FROM FACULTY
    WHERE Department = 'ECE'
);

-- Display students scoring above maximum ECE marks
SELECT *
FROM STUDENT
WHERE Marks > (
    SELECT MAX(Marks)
    FROM STUDENT
    WHERE Department = 'ECE'
);

-- Display faculty earning more than their department average salary
SELECT f.*
FROM FACULTY AS f
WHERE f.Salary > (
    SELECT AVG(f2.Salary)
    FROM FACULTY AS f2
    WHERE f2.Department = f.Department
);
